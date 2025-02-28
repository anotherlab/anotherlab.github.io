---
id: 277
title: 'Why doesn&#8217;t {$REGION} work above the interface?'
date: 2006-10-31T20:29:00-05:00
layout: post
guid: http://www.rajapet.com/?p=277
permalink: /2006/10/31/why-doesnt-region-work-above-interface/
---
Our Delphi code has some standard header comments at the top of the unit.  It has some information about the unit and who created it, and the purpose of that unit.  It also has some tags that the version contol system will use to expand.  On of those tags is the history of who edited that file.  On some of our older files, that list can get quite long.

So I figured since we moved to Delphi 2006, I could wrap those comments inside a {$REGION}/{$ENDREGION} block and collapse that block.  I added {$REGION} and {$ENDREGION}, but I couldn&#8217;t get the collapse button to appear.  I tried it elsewhere in the code, worked just fine.  Tried a different unit, same problem.  Well it&#8217;s Delphi 2006, maybe restarting it will fix it.  Nope.

It turns out that $REGION only collapses after the **interface** line.  I moved **interface** to above the {$REGION} line and all was good.  I couldn&#8217;t find that factoid documented anywhere.

<div>
  Tech Tags: <a href="http://technorati.com/tag/BDS" rel="tag">BDS</a> <a href="http://technorati.com/tag/Delphi+2006" rel="tag">Delphi+2006</a> <a href="http://technorati.com/tag/Region" rel="tag">Region</a> <a href="http://technorati.com/tag/Folding" rel="tag">Folding</a> <a href="http://technorati.com/tag/Interface" rel="tag">Interface</a>
</div>