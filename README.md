# OBSGameTitle
AutoHotkey script for a "quick pop-up and disappear" game information script for use with OBS.

This has been updated to run from/compile from AutoHotKey 2.x, and includes
somewhat better error handling than before.

## About

I use a OBS text source going to "C:\StreamTools\GameInfo.txt" as a sidebar when I stream. Using Notepad to change the title between game-changes is a bit of a pain, even with the assistance of a Stream Deck.

This tool creates a small-ish pop-up window in the center of the screen to edit precisely that one file and save (or cancel) very quickly so I can go back to making a fool of myself on Twitch.

## Demonstration
![Screenshot](https://github.com/Firehawke/OBSGameTitle/raw/master/Demo.png)

## License

GPLv3. Why? It's a tiny script, doesn't do a whole lot. Really simple, anyone could make this in an hour or less. All I really am asking for is that if you make improvements you offer them back to the community (or at least me..) so that I may take advantage of those improvements too. That's all. Of course, if you're keeping the mods to yourself, it's not against the GPLv3 to not share them back, but that's why I'm just asking nicely.

## Support

Absolutely none. If you break this, you get to keep the pieces. The output file is hard-coded because I honestly believe I'm probably one of MAYBE 5 people in the entire world that might use this and those five people know enough to edit the source and compile one that does a bit more if that's what they want/need.

## History

Version 2.1 came out on June 12th, 2023, and it overhauled the output system to write to several files with different information depending on need:

* ``C:\StreamTools\GameTitleText.txt`` contains just the game title text by itself.
* ``C:\StreamTools\GameInfoText.txt`` contains just the stream information text (usually a description of the stream in progress)
* ``C:\StreamTools\GameHistory.txt`` now contains a history of all games played this stream. You can clear it from the obviously labeled button. There is also a button for updating the text files WITHOUT updating the history-- this is used when you're not changing games but want to reformat the text slightly (e.g. it doesn't completely fit in the OBS text box)
* ``C:\StreamTools\GameInfo.txt``, just as before, contains the sum of the GameTitleText and the GameInfoText in one file.

Version 2.0 came out on January 29th, 2023 and was a rewrite of the original script to work with AHK 2.x.
