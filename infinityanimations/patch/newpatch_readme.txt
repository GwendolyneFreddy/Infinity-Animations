This folder contains the files needed for the executable patch. To generate a new patch from a changed .exe, double-click on newpatch.bat. Open the resulting new t-exe_patch.tpp with a text editor and delete the first line (with COPY ...) then save the file. You may wish to clean it up a bit (remove comments, etc.) as I did with the initial patch (which is now t-old_patch.tpp) but it is not really necessary except to reduce patch size.

Alternately, you can back up the existing patch manually and enter the following from a command prompt in your game folder (which is what newpatch.bat does):

weidu.exe --cmp-from BGMain_unpatched.exe --cmp-to BGMain.exe --out "infinityanimations\patch\t-exe_patch.tpp"

(If "BGMain_unpatched.exe" is in one of your infinityanimations\backup folders as BGMain.exe (which it should be if you've installed the mod), you may need to move and rename the file, or the batch command.)

HOWEVER, it is much more efficient just to edit the existing patch directly to make changes. For example, the file contains the following syntax (example):

WRITE_BYTE 0x407438 0x00
WRITE_BYTE 0x40743a 0x81

Let's say you need to clear the byte at hex address 407439 as well. You simply enter here:
WRITE_BYTE 0x407439 0x00

And you can put this *anywhere* in the file, though it is more orderly I suppose to put it where it belongs, in between the two existing lines. If your text editor has a sort function (as MS Word does in its Table menu), you can put your patches in any order and just sort it when you're done editing (though again, this isn't strictly necessary except to avoid duplicates).

-Miloch
