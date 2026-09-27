---
title: "When Visual Studio Forgets Your Phone: Building an Automated Solution"
author: anotherlab
classes: wide
toc: true
header:
  image: /assets/images/robot-connecting-phone.jpg
categories: 
  - visualstudio
  - maui
  - wpf
  - automation
tags:
  - android-debugging
  - device-detection
  - usb-devices
  - com-automation
  - wmi
  - developer-workflow
  - pinvoke
  - windows-interop
  - developer-tools
  - visual-studio-extensions
---
# Introduction
This is how I resolved one of my pet peeves with Visual Studio. When I am working on a .NET MAUI application, when I unplug my phone, Visual Studio changes debug target to the default emulator. When I plug the phone back in, it doesn't set it back. That drives me crazy. So I over-engineered a solution.

In a previous episode, I wrote a [PowerShell script](/2025/11/16/hacking-csproj-user/), to set it back. That had some limitations.

1. I had to remember to run the script
1. I needed to pass in the of the user project file
1. I needed to pass in the name of the device.

The last one doesn't change much. But I did get a new phone last week, so it does change. The first two were the pain points.

So I decided to go for some premium yak shaving and decided to write an app to do this for me. This is what it looks like when it's running.

![Very Active Debug Profile](https://github.com/anotherlab/VeryActiveDebugProfile/raw/main/Images/VeryActiveDebugProfile.gif)

You can find the repo for the source code at [VeryActiveDebugProfile](https://github.com/anotherlab/VeryActiveDebugProfile/) on GitHub.

## Prerequisites

1. Windows 10 or 11.
1. Visual Studio 2022 or 2026. I am using VS 2026. Rider doesn't need have this problem.
1. The MAUI workloads for .NET 10. The code should work with .NET 8 or 9, but it may need some minor changes.

A small number of nuget packages were used.

| Package Name                         | What It’s Used For                                                                 |
|-------------------------------------|------------------------------------------------------------------------------------|
| CommunityToolkit.Mvvm               | Lightweight MVVM framework for .NET apps; provides observable objects, commands, and messaging. |
| EnvDTE                              | Visual Studio automation model; used to interact with and control the Visual Studio IDE (extensions, macros, tooling). |
| Hardcodet.NotifyIcon.Wpf            | Adds system tray (notification area) icon support to WPF apps, including context menus and balloon tips. |
| Microsoft.Toolkit.Uwp.Notifications | Enables sending Windows toast notifications from desktop apps (WPF, WinForms, console). |
| System.Management                   | Provides access to Windows Management Instrumentation (WMI) for querying system info like hardware, processes, and services. |

The `Hardcodet.NotifyIcon.Wpf` is part of some code that is not functional at this time.

## What needs to get updated.
In Visual Studio, the selection of the current device for a MAUI project is stored in the user project file. This is a file with the same name of the csproj project file, but with ".user" tacked on the end.

Here is a sample user project file that is using my Samsung phone for debugging:

```xml
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="Current" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <IsFirstTimeProjectOpen>False</IsFirstTimeProjectOpen>
    <ActiveDebugFramework>net10.0-android</ActiveDebugFramework>
    <ActiveDebugProfile>Samsung SM-S948U (Android 16.0 - API 36)</ActiveDebugProfile>
    <SelectedPlatformGroup>PhysicalDevice</SelectedPlatformGroup>
    <DefaultDevice>pixel_9_-_api_36</DefaultDevice>
  </PropertyGroup>
</Project>
```
If I disconnect my phone, on my machine Visual Studio detects that the physical device is gone and switches over to an emulator image

```xml
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="Current" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <IsFirstTimeProjectOpen>False</IsFirstTimeProjectOpen>
    <ActiveDebugFramework>net10.0-android</ActiveDebugFramework>
    <ActiveDebugProfile>Pixel 9 - API 36 (Android 16.0 - API 36)</ActiveDebugProfile>
    <SelectedPlatformGroup>Emulator</SelectedPlatformGroup>
    <DefaultDevice>pixel_9_-_api_36</DefaultDevice>
  </PropertyGroup>
</Project>
```
`ActiveDebugProfile` changes from "Samsung SM-S948U (Android 16.0 - API 36)" to "Pixel 9 - API 36 (Android 16.0 - API 36)". `SelectedPlatformGroup` changes from "PhysicalDevice" to "Emulator", but we can ignore that.

Because this app will update `ActiveDebugProfile`, I named it "VeryActiveDebugProfile". Not very exciting, but the name on the tin tells you what is inside.  For short, I'll call it VADP

# Detecting when my phone was plugged in or removed

This is where code starts.

## Registering for device events

We start off by detecting USB device connect and disconnect events.  I'll walk through some of the code.  It's pretty well commented, but I'll show where the heavy lifting was done.

Using WPF's Windows Interop, we register an event that will be called when a USB device is connected or disconnected. That event gets wired up using OnSourceInitialized like this. In a WPF app, the OnSourceInitialized event is the first time that you can get access to the handle of the WPF window. We need that handle to register for Windows events. We also register for USB notifications to ensure that we get connection and disconnection notices.

```cs
protected override void OnSourceInitialized(EventArgs e)
{
    base.OnSourceInitialized(e);

    // Get the window handle and add a hook to listen for Windows messages
    HwndSource source = HwndSource.FromHwnd(new WindowInteropHelper(this).Handle);
    source.AddHook(WndProc);

    // Register for USB device notifications
    RegisterForDeviceNotifications(source.Handle);
}
```

The WndProc method is defined as

```cs
private IntPtr WndProc(IntPtr hwnd, int msg, IntPtr wParam, IntPtr lParam, ref bool handled)
{
    // If a USB device is connected or disconnected, wParam will indicate the event type (arrival or removal)
    if (msg == WM_DEVICECHANGE)
    {
        int eventType = wParam.ToInt32();

        if (eventType == DBT_DEVICEARRIVAL)
        {
            // When a device is connected, lParam points to a structure with details about the device.
            // We can extract the device path from it.
            string devicePath = GetDeviceInterfacePath(lParam);

            if (!string.IsNullOrEmpty(devicePath))
            {
                // Notify the UI about the new device.  Not all of them will be Android devices, but it's useful to see all device connections in the log.
                SendMessage($"Device connected: {devicePath}");

                var vid = PnpHelper.GetVendorAndProductfromPath(devicePath);

                // Next check to see if we have an Android device.
                var manufacturer = AndroidDeviceHelper.GetManufacturerFromHardwareId(vid);

                if (manufacturer != null)
                {
                    _connectedAndroidPaths[devicePath] = vid;
                    SendMessage($"{manufacturer} device detected ");

                    // Add a slight delay before updating the status to ensure the device is fully recognized by the system and PnP queries will succeed.
                    // This can help with cases where the device information isn't immediately available.
                    Dispatcher.InvokeAsync(async () => {
                        await System.Threading.Tasks.Task.Delay(100);
                        UpdateAndroidStatus(vid);
                    });

                }
            }
            else
            {
                // no device path means we can't identify the device, but we know something was connected
                // It wont be an Android device and we can ignore it
                return IntPtr.Zero;
            }
        }
        else if (eventType == DBT_DEVICEREMOVECOMPLETE)
        {
            string devicePath = GetDeviceInterfacePath(lParam);

            // We only need to update the status if an Android device was removed, so we check
            // if the device path is in our list of connected Android devices. If it is, we
            // remove it and update the status accordingly.
            if (!string.IsNullOrEmpty(devicePath) && _connectedAndroidPaths.Remove(devicePath))
            {
                SendMessage($"Device disconnected: {devicePath}");

                if (_connectedAndroidPaths.Count == 0)
                {
                    UpdateAndroidStatus(string.Empty);
                }
                else
                {
                    UpdateAndroidStatus(_connectedAndroidPaths.Values.Last());
                }
            }
        }
    }
    return IntPtr.Zero;
}
```
The RegisterForDeviceNotifications method is what tells Windows that we want to receive the connection events

```cs
private void RegisterForDeviceNotifications(IntPtr windowHandle)
{
    var filterUsb = new DEV_BROADCAST_DEVICEINTERFACE
    {
        dbcc_size = Marshal.SizeOf<DEV_BROADCAST_DEVICEINTERFACE>(),
        dbcc_devicetype = DBT_DEVTYP_DEVICEINTERFACE,
        dbcc_reserved = 0,
        dbcc_classguid = GUID_DEVINTERFACE_USB_DEVICE,
        dbcc_name = string.Empty
    };

    IntPtr bufferUsb = Marshal.AllocHGlobal(filterUsb.dbcc_size);
    try
    {
        Marshal.StructureToPtr(filterUsb, bufferUsb, false);
        _deviceNotifyHandle = NativeMethods.RegisterDeviceNotification(windowHandle, bufferUsb, DEVICE_NOTIFY_WINDOW_HANDLE);
        if (_deviceNotifyHandle == null || _deviceNotifyHandle.IsInvalid)
        {
            SendMessage("Failed to register for USB device notifications");
        }
    }
    finally
    {
        Marshal.FreeHGlobal(bufferUsb);
    }
}
```
You'll see a call to `NativeMethods.RegisterDeviceNotification()`. That's a wrapper for the P/Invoke methods.  P/Invoke or Platform Invoke is the way that managed code like C# can call unmanaged code.  That wrapper looks like this

```cs
public sealed class SafeDeviceNotificationHandle : SafeHandleZeroOrMinusOneIsInvalid
{
    // The constructor must be public for the P/Invoke marshaller
    public SafeDeviceNotificationHandle() : base(true) { }

    protected override bool ReleaseHandle()
    {
        // This is called automatically by the GC/Finalizer
        return NativeMethods.UnregisterDeviceNotification(handle);
    }
}

public static partial class NativeMethods
{
    [StructLayout(LayoutKind.Sequential)]
    internal struct RECT
    {
        public int Left;
        public int Top;
        public int Right;
        public int Bottom;
    }

    internal delegate bool MonitorEnumProc(
        IntPtr hMonitor,
        IntPtr hdcMonitor,
        ref RECT lprcMonitor,
        IntPtr dwData);

    [LibraryImport("user32.dll", EntryPoint = "RegisterDeviceNotificationW", SetLastError = true)]
    public static partial SafeDeviceNotificationHandle RegisterDeviceNotification(
        IntPtr hRecipient,
        IntPtr notificationFilter,
        uint flags);

    // Unregister is usually fine, but it's good practice to be explicit
    [LibraryImport("user32.dll", EntryPoint = "UnregisterDeviceNotification", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static partial bool UnregisterDeviceNotification(IntPtr handle);

    [LibraryImport("user32.dll", EntryPoint = "EnumDisplayMonitors")]
    [return: MarshalAs(UnmanagedType.Bool)]
    internal static partial bool EnumDisplayMonitors(
        IntPtr hdc,
        IntPtr lprcClip,
        MonitorEnumProc lpfnEnum,
        IntPtr dwData);
}
```

The old way to call unamanaged code was with `DllImport`.  It's been around since the dawn of .NET.  It uses runtime marshalling to manage the call to the unmanaged functions. This is done at runtime and uses reflection to generate the code.

Starting in .NET 7, we gained `LibraryImport`. The P/Invoke code is generated at compile time. This is much more efficient. The `SafeDeviceNotificationHandle` class provides for automatic release of the P/Invoke method, which makes the code a little cleaner.

## Getting the Device Path of the connected device

In `WndProc()`, we have this code

```cs
if (eventType == DBT_DEVICEARRIVAL)
{
    // When a device is connected, lParam points to a structure with details about the device.
    // We can extract the device path from it.
    string devicePath = GetDeviceInterfacePath(lParam);
```

The `GetDeviceInterfacePath` takes `lParam` and marshalls into to a structure that will have the device class name. That identifies the USB device. 
```cs
private static string GetDeviceInterfacePath(IntPtr lParam)
{
    if (lParam == IntPtr.Zero)
        return string.Empty;

    try
    {
        var hdr = Marshal.PtrToStructure<DEV_BROADCAST_HDR>(lParam);

        if (hdr.dbch_devicetype == DBT_DEVTYP_DEVICEINTERFACE)
        {
            var deviceInterface = Marshal.PtrToStructure<DEV_BROADCAST_DEVICEINTERFACE>(lParam);
            return deviceInterface.dbcc_name?.TrimEnd('\0') ?? string.Empty;
        }
    }
    catch
    {
        // Ignore marshaling errors
    }

    return string.Empty;
}
```
For my phone that comes over as `\\?\USB#VID_04E8&PID_6860#R3GL108K8GE#{a5dcbf10-6530-11d2-901f-00c04fb951ed}`.

There is a lot to unpack from that value, but we only need to care about this portion of the value: `VID_04E8&PID_6860`. That is the Vendor ID (VID) and the Product ID (PID). With those two values, we can ignore connection events for non-Android devices. We really only care about VID.

## Identifying the Android device

The next part of WndProc does this:

```cs
var vid = PnpHelper.GetVendorAndProductfromPath(devicePath);

```

That calls some simple code to return the VID/PID from the device name.

```cs
public static string GetVendorAndProductfromPath(string devicePath)
{
    string cleanPath = devicePath.Replace(@"\\?\", "");

    // 2. Split by '#' to isolate the components
    string[] parts = cleanPath.Split('#');

    // 3. Return the vendor and product id
    string result = $"{parts[1]}";

    return result;
}
```

That would return `VID_04E8&PID_6860` from the class name shown above.

```cs
var manufacturer = AndroidDeviceHelper.GetManufacturerFromHardwareId(vid);
```

That takes us to the next line in `WndProc`, which will use a WMI query to get the name of the Android device

```cs
public static string? GetDeviceName(string ThisDevice =  "VID")
{
    try
    {
        var query = $"SELECT Description, Service, PNPDeviceID, Present FROM Win32_PnPEntity " +
                    "WHERE Service='WUDFWpdMtp' " +
                    "AND PNPDeviceID LIKE '%" + ThisDevice + "%'" +
                    "AND Present = True";

        // Walk through the results and return the description of the first matching device
        foreach (var mo in new ManagementObjectSearcher(null, query).Get().OfType<ManagementObject>())
        {
            return mo.Properties["Description"].Value.ToString();
        }
    }
    catch (InvalidCastException)
    {
        // Some property couldn't be cast. This can happen when no rows are returned
        // Just ignore it
    }

    return null;
}
```

We can use WMI to query the system for detailed information, using a [SQL-like](https://learn.microsoft.com/en-us/windows/win32/wmisdk/querying-with-wql) syntax.

```sql
SELECT Description, Service, PNPDeviceID, Present FROM Win32_PnPEntity
WHERE Service='WUDFWpdMtp'
AND PNPDeviceID LIKE '%" + ThisDevice + "%'
AND Present = True
```

Give us the Description, Service, PNPDeviceID, and Present fields from Win32_PnPEntity where Service is 'WUDFWpdMtp', PNPDeviceID matches a wildcard string for our VID/PID, and present is true. [Win32_PnPEntity](https://learn.microsoft.com/en-us/windows/win32/cimwin32prov/win32-pnpentity) is a class that represents the properties of a Plug and Play device. This query is a quick and easy to get details about plugged in devices.

We execute the query and return the Description field for the first matching row.

In short, this will return the device name for the first Android device that matches that vendor and product ids.

We match on `Service='WUDFWpdMtp'` because that returns th WMI row with the name that we need. When you plug an Android device in, it shows up as multiple devices. WUDFWpdMtp is the driver in Windows that handles removabe storage devices.

If we were to change that WMI query to this

```sql
SELECT Description, Manufacturer, Name, PNPDeviceID, Service
FROM Win32_PnPEntity
WHERE PNPDeviceID LIKE '%" + ThisDevice + "%'
AND Present = True
```
We would get following result set back

| Description                              | Manufacturer                         | Name                         | PNPDeviceID                                              | Service       |
|------------------------------------------|--------------------------------------|------------------------------|----------------------------------------------------------|---------------|
| SAMSUNG Android ADB Interface            | SAMSUNG Electronics Co., Ltd.        | SAMSUNG Android ADB Interface| USB\VID_04E8&PID_6860&ADB\A&1CEC0697&0&0003              | WINUSB        |
| SM-S948U                                 | samsung                              | Chris's S26 Ultra            | USB\VID_04E8&PID_6860&MS_COMP_MTP&SAMSUNG_ANDROID\A&1CEC0697&0&0000 | WUDFWpdMtp   |
| SAMSUNG Mobile USB Composite Device      | SAMSUNG Electronics Co., Ltd.        | SAMSUNG Mobile USB Composite Device | USB\VID_04E8&PID_6860\R3GL108K8GE                | dg_ssudbus    |
| SAMSUNG Mobile USB Modem                 | SAMSUNG Electronics Co., Ltd.        | SAMSUNG Mobile USB Modem #2  | USB\VID_04E8&PID_6860&MODEM\A&1CEC0697&0&0001            | Modem         |

We want the row that returns "SM-S948U" as the Description. We only get that when we filter on `Service='WUDFWpdMtp'`.


### Using PowerShell to test WMI queries
You can check WMI through PowerShell if you need to confirm what your device would return. These PowerShell commands use WMI calls.

```posh
Get-PnpDevice -FriendlyName "*Android*" -Status OK |
  Select-Object -Property FriendlyName, Service, PNPDeviceID

Get-CimInstance -ClassName Win32_PnPEntity |
  Where-Object { $_.Service -eq 'WUDFWpdMtp' } |
  Select-Object Description, DeviceID, PNPDeviceID, Manufacturer
```

If we have a match, the device description will be the name of the Android device. And that will be what we need to update Visual Studio.

We set the device name in the viewmodel to the name of the connected device.  That calls a method named `RefreshVs()`.  This method will collect the filename of all open MAUI projects and update the ActiveDebugProfile field in the user project file to the device name.

# Finding the open intances of Visual Studio
We look at the running processes and collect the ones running Visual Studio.  We only care about the current user, so we don't need elevated privileges.  This is wrapped up in the `VsProjectService` service in VsProjectService.cs

We install the [EnvDTE NuGet](https://www.nuget.org/packages/envdte) package. This is a wrapper for the COM library containing the objects and members for Visual Studio core automation.

The methods that we calling are COM methods from ole32.dll. Unlike the plain native API methods that we used for getting the USB information, there is no benefit to use LibraryImport.

The reason is that these signatures marshal COM interfaces (IRunningObjectTable, IBindCtx) through out parameters. LibraryImport is a great fit for simple P/Invokes like the ones in NativeMethods.cs, where the parameters are IntPtr, SafeHandle, and primitive types. It is not a clean drop-in replacement for these COM-heavy ole32 calls.

If you really wanted to convert them, you’d usually need to change the signatures to use raw IntPtr and then manually turn those pointers into COM objects, which is more code and more fragile for no real benefit here.

This code will get the [Running Object Table](https://learn.microsoft.com/en-us/windows/win32/api/objidl/nn-objidl-irunningobjecttable) for the current user:

```cs
// Get the ROT and enumerate running objects
_ = GetRunningObjectTable(0, out IRunningObjectTable rot);
_ = CreateBindCtx(0, out IBindCtx ctx);

// Get the list of running objects from the ROT and walks through the list
rot.EnumRunning(out IEnumMoniker enumMoniker);
IMoniker[] monikers = new IMoniker[1];

    while (enumMoniker.Next(1, monikers, IntPtr.Zero) == 0)
    {
        // Get the display name of the running object
        monikers[0].GetDisplayName(ctx, null, out string displayName);

```
We then look only at the running instances of Visual Studio by matching on the display name of the process.

```cs
if (displayName.Contains("VisualStudio.DTE", StringComparison.CurrentCulture))
```
Through the magic (or mystery) of COM, we get the running object and access it through the [DTE interface](https://learn.microsoft.com/en-us/dotnet/api/envdte.dte).

```cs
rot.GetObject(monikers[0], out object obj);

dynamic dte = obj;

string solution = dte.Solution.FullName;
```
If we have a solution or at least one project, we new up an instance of a VsInstance class and then call a method named EnumerateProjects.  This method will recursively walk through the solutions and collect the paths to any project that is a MAUI project. The code to see if the project is pretty simple

```cs
static bool IsMauiProject(Project project)
{
    var filePath = project.FullName;

    var doc = XDocument.Load(filePath);

    var useMaui = doc
        .Descendants("UseMaui")
        .FirstOrDefault();

    return useMaui != null &&
            bool.TryParse(useMaui.Value, out var result) &&
            result;
}
```

We load the project as an XML document and look for the existence of `UseMaui` element.  If the element exists and the value is `true`, then this is a MAUI project.

## Updating the user project file

In RefreshVs, we collect the filenames of every open MAUI project

```cs
var service = GetService();
var instances = service.GetVsInstances();

var mauiProjects = VsProjectService.GetMauiProjectsByInstances(instances);

AddLog($"Found {mauiProjects.Count} MAUI projects.");

var UpdateCount = 0;

foreach (var project in mauiProjects)
{
    var thisUpdate = UpdateProjectFile(project);
    UpdateCount += thisUpdate;

    if (thisUpdate > 0)
        AddLog($"☑️ Updated {project}");
    else
        AddLog($"Skipped {project}");
}
```

The `UpdateProjectFile` method in the viewmodel calls the `UpdateProjectFile` method of the VsProjectService and passes the filename and the device name.  The following is the logic of that method. I removed the error handling to just show the highlights.

```cs
// Load the .csproj.user file
doc = XDocument.Load(userFilePath);

// We need to set the namespace
ns = doc.Root?.Name.Namespace ?? "http://schemas.microsoft.com/developer/msbuild/2003";

// Get the root
var root = doc.Root ?? throw new InvalidOperationException("Invalid .user file structure.");

// Then PropertyGroup
var propertyGroup = root.Elements(ns + "PropertyGroup").FirstOrDefault();

// Then ActiveDebugProfile
var activeDebugProfileElement = propertyGroup
    .Elements(ns + "ActiveDebugProfile")
    .FirstOrDefault();

// Update value
activeDebugProfileElement.Value = activeDebugProfile;

// Save the changes
doc.Save(userFilePath);
```
Visual Studio will watch for changes to the .csprj.user file. If you modify the file outside the IDE, the IDE will see the changes update the IDE accordingly. This is one of those things that just works.

## Performance concerns
When the app is running, it detects when a new device has been plugged fairly quickly. Usually within a second or two. Enumerating the running instances of Visual Studio and updating any open MAUI projects takes another second or so.

There was alternate way of detecting new device using WMI queries. You can use ManagementEventWatcher to subscribe to changes to a WMI table.  

```cs
// The WITHIN 2 means to rerun this query every 2 seconds
var query = new WqlEventQuery(
    "SELECT * FROM __InstanceCreationEvent WITHIN 2 " +
    "WHERE TargetInstance ISA 'Win32_PnPEntity'");

// Create an event that will be called
_watcher = new ManagementEventWatcher(query);
_watcher.EventArrived += (s, e) =>
{
    var device = (ManagementBaseObject)e.NewEvent["TargetInstance"];
    var name = device["Name"]?.ToString();

    // Do something here
    if (!string.IsNullOrEmpty(name) &&
        (name.Contains("Android") || name.Contains("ADB")))
    {
        Console.WriteLine($"Android device connected: {name}");
    }
};
```
While a variation of that could work, it's pretty heavy handed. It takes less resources to listen to device connection events, collect the vendor and product, and then run a WMI query.

# WPF
I wrote this using WPF because that is the desktop framework that I am used it. I never liked WinForms and I know how to write apps that use XAML. Most of the code is separate from the UI. The code that handles the USB events is tied to the UI, the rest follows a MVVM and service model.

I didn't cover the nuts and bolts of how to build a WPF app. It has some of the usual stuff like detecting light and dark mode or saving/restoring the position of the window. There's code to scroll the datagrid to the end whenever it's updated. Nothing fancy and all is commented in the code.

No additional permissions should be needed by the app. It should just work with the same rights that you used to run Visual Studio.

## WeakReferenceMessenger
To update the UI, I write log entries to an observable collection in the viewmodel. I use the WeakReferenceMessenger messaging to send messages to update that collection from vaious parts of the applicatioos.  That collection is bound to a DataGrid in the MainWindow.

## Let there be Toast
I use the Microsoft.Toolkit.Uwp.Notifications nuget package to display a toast message if any projects are updated. The eventual goal is have the app run in the tool tray and the toast will let me know when projects have been updated. It's overkill eyecandy, but it was to add.

## WinUI
I don't write much for Windows Desktop and WPF has always had enough functionality for what I needed. I pretty much ignored UWP and WinUI when they came out. It just seemed to me as more the of the same, yet different. And harder to install on other people's computers.

After I had VADP mostly working, I decided to see how long it would take to port to WinUI.  It didn't take long. The code was pretty much detached from the UI. Using MVVM made it easy to wire up new views to the existing viewmodels. The code to wire up the events to listen to USB connect/disconnects was probably the biggest change to the code.

There were some minor changes to the UI, most of the actual code just worked. The XAML was less polished. There was no benefit for this app to use WinUI over WPF. But I can check "wrote a WinUI app" off my bucket list.

Since this app was Windows only, there wasn't any point in writing it with MAUI or Avalonia.

# Troubleshooting
For the toast message popup to work, you need to compile for x64, it doesn't seem to work for AnyCpu. It should work for arm64, but I haven't tested it. The TargetFramework in the the csproj needs to be set to include a TFM with a minium version of Windows. I used `net10.0-windows10.0.22621.0`

If the WMI query doesn't return a product name for your phone, you may need to tweak the query. The PowerShell commands listed above will help return the right data.

# Is this overkill?
This app is more or less overkill. If I use a wireless ADB connection, then Visual Studio tends to keep the connection. When it doesn't, a have a slightly different problem to solve. I also tend to keep my phone plugged in when I'm using all day.

While I use this app everyday, I wrote it to see how hard it would be. I already knew that updating a user csproj outside of Visual Studio would work. My PowerShell script showed that it work. 

It then became a task of identifying when a USB device was connected and how to get that device name. That was fairly easy to do. It took a little longer to learn how to make the COM calls to get the open solution files.  A lot of that code was vibe-coded using a mixture of Claude and Gemini. It's 2026, the various AI options make grunt work like that much easier to accomplish.

# Future improvments
Right now this app just sits on the desktop, waiting for some action. I have multiple monitors, it doesn't bother me to have running that way. But it would be nice to have it run minimized in the system tray. I started that code, but it's not done yet.