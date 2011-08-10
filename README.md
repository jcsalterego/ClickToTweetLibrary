
ClickToTweetLibrary
===================

[SIMBL](http://www.culater.net/software/SIMBL/SIMBL.php) plugin which adds "Tweet > Open With Tweet Library... (⌘-L)" menu item to Twitter for Mac, which will open the currently selected tweet (and subsequent conversation) with [Tweet Library](http://tweetlibrary.com/)'s [Conversations](http://tweetlibrary.com/app/conversations) feature.

## Requirements
* Twitter for Mac 2.1
* SIMBL
* Mac OS X Snow Leopard (Untested on Lion)

## Installation
1. Build project with XCode or download binary ([ClickToTweetLibrary-latest.zip](http://jcsalterego.github.com/ClickToTweetLibrary/files/ClickToTweetLibrary-latest.zip))
1. Copy (or symlink if developing) `ClickToTweetLibrary.bundle` to SIMBL Plugins path, e.g. `~/Library/Application Support/SIMBL/Plugins`
1. Reload Twitter
1. (Optional step) Verify with Console.app the plugin startup message (`"ClickToTweetLibrary (x.y.z) loaded"`)

## Remaining Work
* The enabling/disabling of the menu item is hackish at best. It may be enabled when there's no tweet selected, but will do nothing if the hotkey is pressed.
* It would be nice to add this to the contextual popup menu, but I'm unsure how to hook into that.
* It could be smarter about conversations and pass along the oldest/origin tweet.

## License
BSD for ClickToTweetLibrary and MIT for [JRSwizzle](https://github.com/rentzsch/jrswizzle).

## Acknowledgements
* Thanks to [Mike Soloman](http://www.culater.net/) for [SIMBL](http://www.culater.net/software/SIMBL/SIMBL.php).
* Thanks to [rentzsch](https://github.com/rentzsch) for [JRSwizzle](https://github.com/rentzsch/jrswizzle).
* [Twitter for Mac](http://itunes.apple.com/us/app/twitter/id409789998) is Copyright © 2011 Twitter, Inc.
* [Tweet Library](http://itunes.apple.com/us/app/tweet-library/id365768793) is Copyright © 2011 Riverfold Software, LLC.

ClickToTweetLibrary is not affiliated with Tweet Library.
