---
title:  Breaking and then fixing my app's CFBundleShortVersionString
author: anotherlab
categories: 
  - versioning
  - ios
  - github
tags:
  - yaml
  - Info.plist
---
![Made to order](/assets/images/steampunk-mobile-app-assembly-line.jpg)

So I had this bug reported where the app was reporting the wrong version number. Only for iOS, it was correct on Android. It's an app created with .NET MAUI and it gets built as part of a GitHub workflow when the main branch is updated. The MAUI code that shows the version number is the same for Android and iOS. That indicated the version information was not being set correctly.

We have two version numbers in the app. For iOS, they are named [CFBundleVersion](https://developer.apple.com/documentation/bundleresources/information-property-list/cfbundleversion) and [CFBundleShortVersionString](https://developer.apple.com/documentation/bundleresources/information-property-list/cfbundleshortversionstring). CFBundleShortVersionString is supposed to be user-visible version of CFBundleVersion. If CFBundleVersion is set to "1.2.345", then CFBundleShortVersionString could be set to "1.2 build 345".

`CFBundleVersion` is the value that identifies the version of the build. Becareful when you set this. It can go up, but it can't go back down. The original developer didn't understand how this worked and when they first submitted the app to the Apple app store, they thought it had to be an integer. Instead of setting the value to "1.2.3456", they set it to something like "1023456". It got out of sync with `CFBundleShortVersionString`. 

This was back when it was a Xamarin.Forms app. In Xamarin.Forms, we set `CFBundleVersion` and `CFBundleShortVersionString` in the [Info.plist](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Introduction/Introduction.html) file. In .NET MAUI, you can set that in the .csproj project file. the Info.plist, or via command line parameters. I had placeholder values in the project file and used the command line parameters to set the version numbers as part of the build command.

I have a GitHub workflow set up for when the main branch is updated. It uses an open-source GutHub action named [action-bumpr](https://github.com/haya14busa/action-bumpr). This action-bumpr action can set all or part of semantic version number. 

<!-- {% raw %} -->
```yaml
jobs:
  bump-version:
    runs-on: ubuntu-latest
    outputs:
      version: ${{ steps.clean_version.outputs.version }}
      versioncode: ${{ steps.clean_version.outputs.versioncode }}
    steps:
      - uses: actions/checkout@v2
      - uses: haya14busa/action-bumpr@v1
        id: bumpr
        with:
          github_token: ${{ github.token }}
          default_bump_level: 'patch'
      - name: clean version
        id: clean_version
        run: |
          v=${{ steps.bumpr.outputs.next_version }}
          v=${v:1}
          echo "version=$v" >> $GITHUB_OUTPUT
          count=$(git rev-list --count HEAD)
          let "count += 2100000"
          echo "versioncode=$count" >> $GITHUB_OUTPUT
```
<!-- {% endraw %} -->

The `version` variable ends up with "1.2.3456" and `versioncount` gets the build count with a "magic number" of 2100000 added to it. The versioncount variable is being set this way only because we had it wrong from day one and you can only go up in value.

The "jobs:" job is used by a job called "build-ios:". After doing all of the setup stuff, it fires up the following command to build the app

<!-- {% raw %} -->
```yaml
      - name: Publish iOS
        run: dotnet publish -c Release -f:net9.0-ios /p:ArchiveOnBuild=true /p:RuntimeIdentifier=ios-arm64 /p:ApplicationDisplayVersion=${{ needs.bump-version.outputs.version }} /p:ApplicationVersion=${{ needs.bump-version.outputs.versioncode }}
        working-directory: MyApp
```
<!-- {% endraw %} -->
YAML's formatting makes that hard to read in a blog post. If we just look at the version parameters:
<!-- {% raw %} -->
```yaml
/p:ApplicationDisplayVersion=${{ needs.bump-version.outputs.version }}
/p:ApplicationVersion=${{ needs.bump-version.outputs.versioncode }}
```
<!-- {% endraw %} -->

The p:ApplicationDisplayVersion parameter maps to `CFBundleShortVersionString` and /p:ApplicationVersion maps to CFBundleVersion. This is were the version values are passed. When I did the build, `CFBundleShortVersionString` was not being set correctly. So I had decided to cheat and set it in Info.plist before calling the Publish iOS step.

<!-- {% raw %} -->
```yaml
      - name: Update CFBundleShortVersionString
        run: /usr/libexec/PlistBuddy ${{ github.workspace }}/MyStop/Platforms/iOS/Info.plist -c "set :CFBundleShortVersionString '${{ needs.bump-version.outputs.versioncode }}'";
        working-directory: MyStop/Platforms/iOS
```
<!-- {% endraw %} -->

PlistBuddy is a tool that is part of MacOS. It lets you edit .plist files from the command line. You can give the "-h" parameter to some terse help. I found a nice guide [here](https://github.com/captam3rica/plistbuddy-guide).

This was were I made the mistake. I was setting `CFBundleShortVersionString` to the version code and I should have used the version string. The root cause of the problem is that if you have `CFBundleShortVersionString` defined in Info.plist, that value take precedence over any value specified from the command line. It's usually the other way around, the command line takes precedence.

I though the fix would be easy. Remove `CFBundleShortVersionString` from Info.plist and remove the Plistbuddy lines from the workflow. That did set the correct version number. It didn't fix the problem with correct x.y.zzzz format version number being considered lower than XXXXXXXX by Apple. So time for a hack.

In the C# code that provides the version number in the App, the code will branch.  If the platform is Android, just return the version number. If it's iOS, check for X.Y.Z format and if that matches return that. If it's an integer value, we make some assumptions.  We take number and subtract the "magic number" that we had added to the git revision number that we had used in the `bump-version:` job.

```yaml
let "count += 2100000"
```
To convert that hot mess of a int to a user-readable version number, you could implement something like this:

```cs
string GetVersionNumber(string someValue)
{
	// Magic number and version prefix are hard coded
	// It is what it is
	const int MagicNumber = 2100000;
	const string prefix = "1.2";
	
	// Sanity check on converting what we expect to get
	// to an int value
	if (int.TryParse(someValue, out int result))
	{
		result -= MagicNumber;

		// Format and return to the call
		return $"{prefix}.{result}";
	}

	// If something wasn't correct, return something back
	return prefix;
}
```
It's a hack and it depends on the source code knowing what the X and Y are for the X.Y.ZZZZ parts of the version number. But it works.