# QuickLook-Preview


References: 
  https://stackoverflow.com/questions/78812968/how-to-debug-quick-look-preview-extension-with-xcode
  https://ianhocking.com/prog/posts/debugging-macos-thumbnails-previews/

It appeared that Apple broke debugging QuickLook Previews, but my guess
is that MacOS became pickier about the metadata included in the plists.

This project (done for OpenRocket) shows that you can in fact get previews
by running the Preview in Xcode, selecting "Finder", then look at the 
appropriate file (in this case "thallax-red.ork").

You almost for sure need to set the signing to your account.

Steps:
- select "OpenRocket QL Preview" as the target to run
- run it in Xcode (CMD-R)
- you should see a system notification that a QuickLook Preview was added to you system
  (if you don't see this once something is wrong)
- select "Finder"
- open a Finder window and select thallax-red.ork, then tap the space bar
- you should see a rocket outline
- I recall reading that after doing all the above, if nothing happens, reboot the Mac
  (I sorta recall that I did this and it finally worked!)

