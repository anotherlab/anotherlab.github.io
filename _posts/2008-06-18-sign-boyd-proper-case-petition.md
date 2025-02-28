---
title: 'Sign the &quot;danah boyd proper case&quot; petition'
date: 2008-06-18T20:34:00-05:00
---
[Jeff Atwood](http://www.codinghorror.com/blog/) is on a [righteous crusade](http://twitter.com/codinghorror/statuses/838022398) against those who insist on using only lower case for their names.  He has [a petition and he wants you to sign it](http://www.ipetitions.com/petition/danahboydpropercase/index.html "danah boyd should start capitalizing her name").  It’s all in good fun, but it raises a subtle point.  There are times where you have to import data from one application to another and you may need to change the case of text coming.  You could data coming out of an old system written in COBOL, where everything was uppercase and the people using the data wants the text changed to mixed case.

Going from all upper case to mixed case is an approximation.  You are filling in details (the case of each letter), where that information did not exist before.  You can make a close approximation by assuming certain rules.  Like states are always start with the first letter of each word capitalized.  And the same goes for proper names.  The people who deviate from the rules of grammar just have to live in world where we prefer to use the proper case.

Getting back to the petition, how do you deal with people who want to use their own capitalization rules?  The bigger question is should your application even enforce the proper case?   I think you should let people type in their names in the format that they want.  If they wanted to go through life with the Caps Lock key on, that’s their prerogative.
