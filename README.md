# DevConsoleEnablerApex
The Apex Implementation that will fix dev console unresponsive behavior by deleting IDE workspace


<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/hashtag/askforce?src=hash">#askforce</a> Dev Console in CS59 has gone to the beach or something -- server response &lt; bupkus, no indication on Trust. <a href="https://twitter.com/hashtag/brutal?src=hash">#brutal</a></p>&mdash; @fduncan (@fduncan) <a href="https://twitter.com/fduncan/status/882667746743521280">July 5, 2017</a></blockquote>






GRR!!! Dev console is blank!!! Happens with everyon....
Developer Console is one of the best IDE out there, sometime it just crashes and becomes irresponsive. The reason for this is corrupted IDEWorkspace record.

Well its kinda hectic to fix this via manually digging into remote logs and delteting objects via rest calls, So I have created an apex utility that will do that for you.

How to use?

1. Put up your instance url in Remote Site Settings. 
2. Run below piece of code in Execute Anon via Workbench /Eclipse


    DevConsoleEnabler.enableDevConsole();



<a href="https://githubsfdeploy.herokuapp.com?owner=pranayjswl007&repo=DevConsoleEnablerApex">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>


Source for the fix: 
https://salesforce.stackexchange.com/questions/80453/developer-console-is-not-loading
