---
title: Implementing a sortable TCollection in Delphi
date: 2007-07-05T17:24:00-05:00
---
[Delphi&#8217;s](http://www.codegear.com/products/delphi/win32) [TCollection](http://www.freepascal.org/docs-html/rtl/classes/tcollection.html) class is very useful, but out of the box it lacks the ability to sort the items in the list.  Fortunately, this is easily addressable accessing some private properties of the TCollection class.  Internally, the items in a TCollection are stored in a private TList named FList.  

The trick is to get access to a private property.  The way to do this is by creating a shadow class.  A shadow class is a class that matches the private declaration of the class that you need to access.  The shadow needs to have the same field types in the same order, up to and including the field that you need access to.  This is the risky part, and cover that risk later.  The definition of the TCollection class starts out with:</p> 

<div contenteditable="false">
  <pre><div>
  <!--<br /><br />Code highlighting produced by Actipro CodeHighlighter (freeware)<br />http://www.CodeHighlighter.com/<br /><br />-->
  
  <span>  TCollection </span><span>=</span><span> </span><span>class</span><span>(TPersistent)<br /></span><span>private</span><span><br />    FItemClass: TCollectionItemClass;<br />    FItems: TList;<br />    FUpdateCount: Integer;<br />    FNextID: Integer;<br />    FPropName: string;<br /></span>
</div></pre>
  
  <p>
    <!-- Code inserted with Steve Dunn's Windows Live Writer Code Formatter Plugin.  http://dunnhq.com --></div> 
    
    <p>
    </p>
    
    <p>
    </p>
    
    <p>
      To get at FItems, we need to shadow the top two members of the class.  Which provides this shadow class:
    </p>
    
    <p>
    </p>
    
    <p>
    </p>
    
    <div contenteditable="false">
      <pre><div>
  <!--<br /><br />Code highlighting produced by Actipro CodeHighlighter (freeware)<br />http://www.CodeHighlighter.com/<br /><br />-->
  
  <span>  TShadowedCollection </span><span>=</span><span> </span><span>class</span><span>(TPersistent)<br /></span><span>private</span><span><br />    FItemClass: TCollectionItemClass;<br />    FItems: TList;<br /></span><span>end</span><span>;<br /></span>
</div></pre>
      
      <p>
        <!-- Code inserted with Steve Dunn's Windows Live Writer Code Formatter Plugin.  http://dunnhq.com --></div> 
        
        <p>
        </p>
        
        <p>
        </p>
        
        <p>
          With access to the internal list, it becomes a simple task to provide the ability to the sort the list.  A public Sort method will call an internal method that runs a <a href="http://en.wikipedia.org/wiki/Quicksort">Quicksort</a> across the list.  The Quicksort code will process the list obtained by casting itself as TShadowedCollection, allowing access to FItems and then call a Compare() function to compare items in the FItems list.  The collection will provide a &#8220;do nothing&#8221; Compare() function.  It will be up to the descendant class to override that function and implement the actual comparision code.  The full source code for the class would look something like this:
        </p>
        
        <p>
        </p>
        
        <div contenteditable="false">
          <pre><div>
  <!--<br /><br />Code highlighting produced by Actipro CodeHighlighter (freeware)<br />http://www.CodeHighlighter.com/<br /><br />-->
  
  <span>unit</span><span> SortCollections;<br /><br /></span><span>interface</span><span><br /><br /></span><span>uses</span><span> classes;<br /><br /></span><span>type</span><span><br />  TSortableCollection </span><span>=</span><span> </span><span>class</span><span>(TCollection)<br /></span><span>protected</span><span><br /></span><span>function</span><span> Compare(Item1, Item2 : TCollectionItem) : integer; virtual;<br /></span><span>procedure</span><span> QuickSort(L, R: Integer);<br /></span><span>public</span><span><br /></span><span>procedure</span><span> Sort;<br /></span><span>end</span><span>;<br /><br /></span><span>implementation</span><span><br /><br /></span><span>type</span><span><br /></span><span>//</span><span> Helper class to allow sorting of a TCollection</span><span><br /></span><span>  </span><span>{</span><span>$HINTS OFF</span><span>}</span><span><br />  TShadowedCollection </span><span>=</span><span> </span><span>class</span><span>(TPersistent)<br /></span><span>private</span><span><br />    FItemClass: TCollectionItemClass;<br />    FItems: TList;<br /></span><span>end</span><span>;<br /></span><span>{</span><span>$HINTS ON</span><span>}</span><span><br /><br /><br /></span><span>{</span><span> TSortableCollection </span><span>}</span><span><br /><br /></span><span>function</span><span> TSortableCollection.Compare(Item1, Item2: TCollectionItem): integer;<br /></span><span>begin</span><span><br /></span><span>(*</span><span><br /><br />Descendant classes would override this method and cast Item1 and Item2 to the<br />decendant class's collection item type perform the field comparisions<br /><br />if item1.MyField &lt; item2.MyField<br />  return -1<br />else if item1.MyField > item2.MyField<br />  return 1<br />else return 0<br /><br /></span><span>*)</span><span><br />  result :</span><span>=</span><span> </span><span></span><span>;<br /></span><span>end</span><span>;<br /><br /></span><span>procedure</span><span> TSortableCollection.QuickSort(L, R: Integer);<br /></span><span>var</span><span><br />  I, J, p: Integer;<br />  Save: TCollectionItem;<br />  SortList: TList;<br /></span><span>begin</span><span><br /></span><span>//</span><span>This cast allows us to get at the private elements in the base class</span><span><br /></span><span>  SortList :</span><span>=</span><span> TShadowedCollection(Self).FItems;<br /><br /></span><span>repeat</span><span><br />    I :</span><span>=</span><span> L;<br />    J :</span><span>=</span><span> R;<br />    P :</span><span>=</span><span> (L </span><span>+</span><span> R) shr </span><span>1</span><span>;<br /></span><span>repeat</span><span><br /></span><span>while</span><span> Compare(Items[I], Items[P]) </span><span>&lt;</span><span> </span><span></span><span> </span><span>do</span><span><br />        Inc(I);<br /></span><span>while</span><span> Compare(Items[J], Items[P]) </span><span>></span><span> </span><span></span><span> </span><span>do</span><span><br />        Dec(J);<br /></span><span>if</span><span> I </span><span>&lt;=</span><span> J </span><span>then</span><span> </span><span>begin</span><span><br />        Save              :</span><span>=</span><span> SortList.Items[I];<br />        SortList.Items[I] :</span><span>=</span><span> SortList.Items[J];<br />        SortList.Items[J] :</span><span>=</span><span> Save;<br /></span><span>if</span><span> P </span><span>=</span><span> I </span><span>then</span><span><br />          P :</span><span>=</span><span> J<br /></span><span>else</span><span> </span><span>if</span><span> P </span><span>=</span><span> J </span><span>then</span><span><br />          P :</span><span>=</span><span> I;<br />        Inc(I);<br />        Dec(J);<br /></span><span>end</span><span>;<br /></span><span>until</span><span> I </span><span>></span><span> J;<br /></span><span>if</span><span> L </span><span>&lt;</span><span> J </span><span>then</span><span><br />      QuickSort(L, J);<br />    L :</span><span>=</span><span> I;<br /></span><span>until</span><span> I </span><span>>=</span><span> R;<br /></span><span>end</span><span>;<br /><br /></span><span>procedure</span><span> TSortableCollection.Sort;<br /></span><span>begin</span><span><br /></span><span>if</span><span> Count </span><span>></span><span> </span><span>1</span><span> </span><span>then</span><span><br />    QuickSort(</span><span></span><span>, pred(Count));<br /></span><span>end</span><span>;<br /><br /></span><span>end</span><span>.</span>
</div></pre>
          
          <p>
            <!-- Code inserted with Steve Dunn's Windows Live Writer Code Formatter Plugin.  http://dunnhq.com --></div> 
            
            <p>
            </p>
            
            <div>
              Tech Tags: <a href="http://technorati.com/tag/Delphi" rel="tag">Delphi</a> <a href="http://technorati.com/tag/TCollection" rel="tag">TCollection</a> <a href="http://technorati.com/tag/Sort" rel="tag">Sort</a>
            </div>
