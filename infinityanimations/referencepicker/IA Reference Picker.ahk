;
; AutoHotkey Version: 1.1.30.03
; Language:       English
; Platform:       Optimized for Windows 10
; Author:         Sam.
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn All, StdOut  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force  ; Skips the dialog box and replaces the old instance automatically, which is similar in effect to the Reload command.

OnError("Traceback")
Global T:={}
LoadTranslation()

Global PS_Version:="V3.0.0.11a"

Global A_Quote:=Chr(34)
Global GUIAnimationList:="", animateIDS:="", animateIDSp:="", anisndIDS:="", NamespaceLUT:={}
Global Conflict:={}
	Conflict["BGI MONSTER LONG 4 PART"]:=["G11"], Conflict["BGI MONSTER LONG"]:=["G1"], Conflict["BGI SIMPLE CASTER (BOW)"]:=["G1"], Conflict["BGI SIMPLE CASTER (S1)"]:=["G1"], Conflict["BGI SIMPLE MONSTER"]:=["G1"], Conflict["BGII SPLIT 4 PART"]:=["G11"], Conflict["BGII SPLIT"]:=["G1","G11"], Conflict["BGII UNSPLIT EXT."]:=["G1"], Conflict["BROKEN ANKHEG"]:=["G1"], Conflict["CHARACTER BGI"]:=["G1","A1"], Conflict["CHARACTER BGII"]:=["G1","A1"], Conflict["DRAGONS (XDR)"]:=["XDR","YDR"], Conflict["IWD LARGE"]:=["A1"], Conflict["IWD SMALL"]:=["A1"]
Global ID


try {
	GUIAnimationList:=ParseAnimsList()
	NamespaceLUT:=GenerateNamespaceLUT(GUIAnimationList)
	LoadIDS()
	UpdateIDS(GUIAnimationList)
	GuiMain()
} catch e {
	;ThrowMsg(16,"Error!","Exception thrown!`n`nWhat	=	" e.what "`nFile	=	" e.file "`nLine	=	" e.line "`nMessage	=	" e.message "`nExtra	=	" e.extra)
	ExceptionErrorDlg(e)
	ExitApp
	}
Return

OnExit:
GuiClose:
	;~ IfExist, %A_ScriptDir%\Generated_anims.list
		;~ FileDelete, %A_ScriptDir%\Generated_anims.list
	;~ FileAppend, % FormatAnimsList(FullAnimationList), %A_ScriptDir%\Generated_anims.list

	;~ IfExist, %A_ScriptDir%\Generated_anims_delimit.txt
		;~ FileDelete, %A_ScriptDir%\Generated_anims_delimit.txt
	;~ FileAppend, % FormatAnimsListDelimited(FullAnimationList,"`t"), %A_ScriptDir%\Generated_anims_delimit.txt
ExitApp



GuiMain(){
	Global
	Gui, 1:Add, Tab3, w800 h635 vTabMain gChangeTab AltSubmit, % GetLangStr("T1")	;//IA Reference List||Claim an animation|Browse the current IDs|View the reference chart|Build IDS
	Gui, 1:Tab, 3, 1  ; Future controls are owned by the second tab of the current tab control.
	Gui, 1:Add, GroupBox, w775 h70,
	Gui, 1:Add, GroupBox, w775 h60, % GetLangStr("T2")	;//Summary
	Gui, 1:Font, Bold w1000, Courier New
	Gui, 1:Add, Text, r1 xp+10 yp+15 w755, % RTrim(FormatStr(GetLangStr("T3"),A_Space,34,"C") A_Space FormatStr(GetLangStr("T4"),A_Space,23,"C") A_Space FormatStr(GetLangStr("T5"),A_Space,12,"C") A_Space FormatStr(GetLangStr("T6"),A_Space,5,"C") A_Space FormatStr(GetLangStr("T7"),A_Space,7,"C") A_Space FormatStr(GetLangStr("T8"),A_Space,9,"C") A_Space FormatStr(GetLangStr("T9"),A_Space,9,"C"))
	Gui, 1:Font
	Gui, 1:Add, Text, r1 y+7 w755 vSummaryText2,
	Gui, 1:Font, Bold
	Gui, 1:Add, GroupBox, xp-10 y+20 w330 h455 Section, % GetLangStr("T10")	;//Select an animation to view its details:
	Gui, 1:Font, , Courier New
	Gui, 1:Add, ListBox, xp+10 yp+20 w310 h435 vAnimationListBox1 gAnimationListBox1, % GetAnimationListBox1Choices()
	Gui, 1:Font
	Gui, 1:Font, Bold
	Gui, 1:Add, GroupBox, x+20 ys w435 h455, % GetLangStr("T11")	;//List of Files:
	Gui, 1:Font, , Courier New
	Gui, 1:Add, Edit, xp+10 yp+20 w415 h425 ReadOnly -Wrap +HScroll vFilesText1,
	Gui, 1:Font
	Stats:=GetAnimationUsageStats(GUIAnimationList)
	Progress1_:=New PS_Progress(755,30)
	Progress1_.AddSection(255,0,0,0,Stats.PercentUsed)
	Progress1_.AddSection(255,255,0,0,Stats.PercentPartial)
	Progress1_.AddSection(0,128,0,0,(100-Stats.PercentUsed-Stats.PercentPartial))
	Progress_:=Progress1_.GethProgress()
	Progress1_:=""
	Gui, 1:Add, Picture, xm+20 ym+40 w755 h30 vProgressPic, % "hBitmap:*" Progress_
	Gui, 1:Add, Text, w755 xm+20 y+5 vProgressText1, % Stats.PercentUsed "% " GetLangStr("T12") "							" Stats.PercentPartial "% " GetLangStr("T13") "						" Stats.PercentFree "% " GetLangStr("T14")
	
	Gui, 1:Tab, 4, 1
	Gui, 1:Add, Tab2, w800 h600 xm ym+25 Hidden AltSubmit vTabRefChart, % GetLangStr("T15")	;//Baldur's Gate I types||Baldur's Gate II types|IWD types
	
	Gui, 1:Tab, 1, 2
	Gui, 1:Add, GroupBox, x25 y60 w303 h188 , % GetLangStr("T16")	;//BGI MONSTER LONG 4 PART
	Gui, 1:Add, Text, x35 y77 w280 h60 , % GetLangStr("T17")	;//16 Directions unmirrored (10+6E)`nG11 G11E G12 G12E G13 G13E G14 G14E // 16 Seq.`nG21 G21E G22 G22E G23 G23E G24 G24E // 80 Seq.`nG31 G31E G32 G32E G33 G33E G34 G34E // 48 Seq.
	Gui, 1:Add, Text, x33 y145 w281 h53 , % GetLangStr("T18")	;//This is exactly the same as the BGI MONSTER LONG animation scheme`, with each of G1`, G2`, and G3 split into four parts.
	Gui, 1:Add, Text, x34 y207 w281 h31 , % GetLangStr("T19")	;//Examples: Large Wyvern`, BGI Tanar'ri
	Gui, 1:Add, GroupBox, x334 y60 w236 h188 , % GetLangStr("T20")	;//BGI MONSTER LONG
	Gui, 1:Add, Text, x342 y78 w216 h59 , % GetLangStr("T21")	;//16 Directions unmirrored (10 + 6E)`nG1 G1E // 16 Seq.`nG2 G2E // 80 Seq.`nG3 G3E // 48 Seq.
	Gui, 1:Add, Text, x341 y207 w218 h30 , % GetLangStr("T22")	;//Examples: Carrion Crawler`, Small Wyvern
	Gui, 1:Add, GroupBox, x574 y60 w219 h188 , % GetLangStr("T23")	;//BGI SIMPLE CASTER (BOW)
	Gui, 1:Add, Text, x579 y78 w207 h59 , % GetLangStr("T24")	;//8 Directions unmirrored (5 + 3E)`nG1 G1E // 48 Seq.`nG2 G2E // 24 Seq.
	Gui, 1:Add, Text, x579 y143 w206 h61 , % GetLangStr("T25")	;//Optionally supports bow animations (BG1`, BG1E`, BG2`, BG2E). Has casting animations.
	Gui, 1:Add, Text, x579 y208 w205 h28 , % GetLangStr("T26")	;//Examples: Sirine
	Gui, 1:Add, GroupBox, x26 y255 w256 h186 , % GetLangStr("T27")	;//BGI SIMPLE CASTER (S1)
	Gui, 1:Add, Text, x32 y275 w234 h61 , % GetLangStr("T28")	;//8 Directions unmirrored (5 + 3E)`nG1 G1E // 48 Seq.`nG2 G2E // 24 Seq.
	Gui, 1:Add, Text, x32 y338 w234 h57 , % GetLangStr("T29")	;//Optionally supports sword animations (SG1`, SG1E`, SG2`, SG2E). Has casting animations.
	Gui, 1:Add, Text, x32 y400 w233 h26 , % GetLangStr("T30")	;//Examples: Ogre Mage
	Gui, 1:Add, GroupBox, x287 y255 w235 h187 , % GetLangStr("T31")	;//BROKEN ANKHEG
	Gui, 1:Add, Text, x293 y277 w215 h70 , % GetLangStr("T32")	;//8 Directions unmirrored (5 + 3E)`nG1 G1E // 32 Seq.`nG2 G2E // 24 Seq.`nG3 G3E // 16 Seq.`n+ D (ground effects below`; DG1`, DG1E...)
	Gui, 1:Add, Text, x293 y350 w214 h51 , % GetLangStr("T33")	;//Currently not functional.
	Gui, 1:Add, Text, x293 y406 w214 h25 , % GetLangStr("T34")	;//Examples: Ankheg
	Gui, 1:Add, GroupBox, x528 y255 w263 h187 , % GetLangStr("T35")	;//BGI SIMPLE MONSTER
	Gui, 1:Add, Text, x535 y278 w243 h59 , % GetLangStr("T36")	;//8 Directions unmirrored (5 + 3E)`nG1 G1E // 48 Seq.`nG2 G2E // 24 Seq.
	Gui, 1:Add, Text, x535 y340 w243 h60 , % GetLangStr("T37")	;//Same as the caster animations`, but has extra attack animations instead of casting ones.
	Gui, 1:Add, Text, x535 y405 w241 h28 , % GetLangStr("T38")	;//Examples: Werewolf
	Gui, 1:Add, GroupBox, x25 y445 w768 h145 , % GetLangStr("T39")	;//CHARACTER BGI
	Gui, 1:Add, Text, x30 y464 w235 h120 , % GetLangStr("T40")	;//8 Directions unmirrored (5 + 3E)`nA1 A1E A2 A2E A3 A3E A4 A4E A5 A5E`nA6 A6E SA SAE SX SXE // 8 Seq. (A1 has 16)`nCA CAE // 62/64 Seq.`nG1 G1E // 72 Seq.`nW2 W2E // 8 Seq.`n+ Armour Levels (4)`n+ Arbitrary (originally WP) Object anim.`n+ CSHD
	Gui, 1:Add, Text, x275 y463 w265 h121 , % GetLangStr("T41")	;//Where CBGI is the animation identifier...`n[CBGI][1]A1 (id + armour level 1-4)`n[CBGI][1]INV`nObjects are...`n[BGI][S1]A1 (3 last letters of id + object id)`n[BGI][S1]INV`n`nNote that differing from other animation types equipping non-existent objects CRASHES for characters.
	Gui, 1:Add, Text, x546 y463 w239 h121 , % GetLangStr("T42")	;//Keep in mind all BGI character animations display the CSHD shadow animation.`n`nIf you'd like to have an animation using existing object animations (e.g. because it's an edit of an existing animation)`, choose one of the CHARACTER BGI WPM/L/S animation slots with the desired size category.
	Gui, 1:Font, Bold
	Gui, 1:Add, Text, x539 y73 w22 h19 , % GetLangStr("T43")	;//np
	Gui, 1:Add, Text, x765 y73 w22 h19 , % GetLangStr("T44")	;//p
	Gui, 1:Add, Text, x243 y271 w22 h19 , % GetLangStr("T44")	;//p
	Gui, 1:Add, Text, x487 y271 w22 h19 , % GetLangStr("T43")	;//np
	Gui, 1:Add, Text, x751 y271 w28 h19 , % GetLangStr("T45")	;//p/np
	Gui, 1:Add, Text, x235 y458 w28 h19 , % GetLangStr("T45")	;//p/np
	Gui, 1:Add, Text, x297 y71 w22 h19 , % GetLangStr("T43")	;//np
	Gui, 1:Font
	
	Gui, 1:Tab, 2, 2
	Gui, 1:Add, GroupBox, x21 y65 w240 h210 , % GetLangStr("T46")	;//DRAGONS (XDR)
	Gui, 1:Add, Text, x31 y85 w220 , % GetLangStr("T47")	;//9 Directions mirrored`n9 Animation parts`n5 Animations (5: 1 split no base`; 4: 2 split)`n`nAnimation + Part + Split + Direction
	;~ Gui, 1:Add, Text, x31 y165 w220 h80 , % GetLangStr("T48")	;//Where XDR1 is the identifier...`n[XDR1][1][9][0][2] is the first animation`, 9th part (bottom right corner)`, first split`,facing south west (third direction).`nParts are arranged top left to bottom right.
	Gui, 1:Add, GroupBox, x271 y65 w220 h210 , % GetLangStr("T49")	;//BGII SPLIT
	Gui, 1:Add, Text, x276 y84 w208 , % GetLangStr("T50")	;//9 Directions mirrored`nG1 G11 G12 G13 G14 G15 // 54 Seq.`nG2 G21 G22 G23 G24 G25 G26 // 63 Seq.
	;~ Gui, 1:Add, Text, x276 y130 w209 , % GetLangStr("T51")	;//You can add object to these much as you would to characters. The object animations are unsplit`, G1[ID] G2[ID]. As opposed to character slots`, equipping a non-existent item does not crash.
	;~ Gui, 1:Add, Text, x276 y235 w210 , % GetLangStr("T52")	;//Examples: Solar`, Troll
	Gui, 1:Add, GroupBox, x501 y65 w280 h330 , % GetLangStr("T53")	;//BGII SPLIT 4 PART
	Gui, 1:Add, Text, x511 y85 w250 h200 , % GetLangStr("T54")	;//9 Directions mirrored`nG11 G12 G13 G14 // 54 Seq.`nG111 G121 G131 G141 // 54 Seq.`nG112 G122 G132 G142 // 54 Seq.`nG113 G123 G133 G143 // 54 Seq.`nG114 G124 G134 G144 // 54 Seq.`nG115 G125 G135 G145 // 54 Seq.`n`nG21 G22 G23 G24 // 63 Seq.`nG211 G221 G231 G241 // 63 Seq.`nG212 G222 G232 G242 // 63 Seq.`nG213 G223 G233 G243 // 63 Seq.`nG214 G224 G234 G244 // 63 Seq.`nG215 G225 G235 G245 // 63 Seq.`nG216 G226 G236 G246 // 63 Seq.
	Gui, 1:Add, Text, x511 y295 w250 h50 , % GetLangStr("T55")	;//This is essentially the same as the BGII SPLIT animation type`, except split into four parts arranged as shown above.
	Gui, 1:Add, Text, x511 y355 w250 h30 , % GetLangStr("T56")	;//Examples: Demogorgon
	Gui, 1:Add, GroupBox, x21 y285 w470 h320 , % GetLangStr("T57")	;//CHARACTER BGII
	Gui, 1:Add, Text, x31 y305 w280 h90 , % GetLangStr("T58")	;//9 Directions mirrored`nA1 A2 A3 A4 A5 A6 A7 A8 A9 SA SS SX // 9 Seq.`nCA // 72 Seq.`nG1 (not split) // 99 Seq.`n+ Armour Levels (4)`n+ Arbitrary (originally WQ) Object anim.
	Gui, 1:Add, Text, x31 y405 w280 h90 , % GetLangStr("T59")	;//Where CBGT is the animation identifier...`n[CBGT][1]A1 (id + armour level 1-4)`n[CBGT][1]INV`nObjects are...`n[BGT][S1]A1 (3 last letters of id + object id)`n[BPT][S1]INV (second character is forced to P!!)`n
	Gui, 1:Add, Text, x31 y500 w280 h95 , % GetLangStr("T60")	;//^ This behaviour is due to BGII animations using WQ objects with WP paperdolls. It only applies to INV files.`n`nNote that differing from other animation types equipping non-existent objects CRASHES for characters.
	Gui, 1:Add, Text, x321 y355 w160 h240 , % GetLangStr("T61")	;//This animation type differs from the one used for the original game files in that I've decided not to split the G animation series. It's exactly the same content`, just kept in one file (see BGII SPLIT/BGII UNSPLIT).`n`nIf you'd like to have an animation using existing object animations (e.g. because it's an edit of an existing animation)`, choose one of the CHARACTER BGII WQM/L/N/S animation slots with the desired size category.
	Gui, 1:Add, GroupBox, x501 y405 w280 h200 , % GetLangStr("T62")	;//BGII UNSPLIT EXT.
	Gui, 1:Add, Text, x511 y425 w250 h50 , % GetLangStr("T63")	;//9 Directions mirrored`nG1 // 72 Seq.`nG2 // 63 Seq.
	Gui, 1:Add, Text, x511 y475 w250 h70 , % GetLangStr("T64")	;//An expanded variant of the BGII SPLIT animation type`, with all sequences in one file rather than distributed. Supports object animations as well (see above).
	Gui, 1:Add, Text, x511 y555 w250 , % GetLangStr("T65")	;//Examples: Melissan`, Death Tyrant
	Gui, 1:Font, Bold
	Gui, 1:Add, Text, x431 y295 w40 h20 , % GetLangStr("T45")	;//p/np
	Gui, 1:Add, Text, x441 y75 w40 h20 , % GetLangStr("T45")	;//p/np
	Gui, 1:Add, Text, x711 y415 w40 h20 , % GetLangStr("T45")	;//p/np
	Gui, 1:Add, Text, x211 y75 w40 h20 , % GetLangStr("T43")	;//np
	Gui, 1:Add, Text, x721 y75 w40 h20 , % GetLangStr("T43")	;//np
	Gui, 1:Font
	
	Gui, 1:Tab, 3, 2
	Gui, 1:Add, GroupBox, x21 y65 w510 h270 , % GetLangStr("T66")	;//IWD
	Gui, 1:Add, Text, x31 y85 w270 h240 , % GetLangStr("T67")	;//8 Directions unmirrored (5 + 3E)`nA1 A1E A2 A2E A3 A3E A4 A4E // 5 Seq. 8 Seq. resp.`nCA CAE // 5 Seq. 8 Seq. resp.`nDE DEE // 5 Seq. 8 Seq. resp.`nGH GHE // 5 Seq. 8 Seq. resp.`nGU GUE // 5 Seq. 8 Seq. resp.`nSC SCE // 5 Seq. 8 Seq. resp.`nSD SDE // 5 Seq. 8 Seq. resp.`nSL SLE // 5 Seq. 8 Seq. resp.`nSP SPE // 5 Seq. 8 Seq. resp.`nTW TWE // 5 Seq. 8 Seq. resp.`nWK WKE // 5 Seq. 8 Seq. resp.`n`n+ Object (SA1`, MA1...)
	Gui, 1:Add, Text, x311 y85 w210 h240 , % GetLangStr("T68")	;//IWD animations can coexist with a BGII SPLIT/UNSPLIT animation (which in turn can coexist with some 4 PART animations`, etc.) for the same identifier`, in fact they often do so with the original game files.`n`nAny type of object can be added to an IWD slot. However`, the last character of the object id is stripped off (e.g. WH becomes W).`n`nEquipping a non-existent object does not cause the game to crash`, as it does with character animations.
	Gui, 1:Font, Bold
	Gui, 1:Add, Text, x261 y75 w40 h20 , % GetLangStr("T43")	;//np
	Gui, 1:Font
	
	Gui, 1:Tab, 5, 1
	Gui, 1:Add, GroupBox, w380 h598 Section, % GetLangStr("T69")	;//ANIMATE.IDS
	Gui, 1:Add, Checkbox, xp+10 yp+20 vToggleIDSCheckbox1 gToggleIDSSytle, % GetLangStr("T70")	;//toggle BGII/IWD style
	Gui, 1:Font, , Courier New
	Gui, 1:Add, Edit, xp y+10 w360 h500 ReadOnly vAnimateIDSEdit, 126`r`n%animateIDS%
	Gui, 1:Font
	Gui, 1:Add, Button, r2 y+10 w100 gSaveIDS1, % GetLangStr("T71")	;//Save to File
	Gui, 1:Add, Button, r2 x+161 w100 yp gCopyClipboardIDS1, % GetLangStr("T72")	;//Copy to Clipboard
	Gui, 1:Add, GroupBox, w380 h598 xs+395 ys, % GetLangStr("T73")	;//ANISND.IDS
	Gui, 1:Font, , Courier New
	Gui, 1:Add, Edit, xp+10 yp+43 -Wrap w360 h500 ReadOnly vAnisndIDSEdit, IDS`r`n `r`n%anisndIDS%
	Gui, 1:Font
	Gui, 1:Add, Button, r2 y+10 w100 gSaveIDS2, % GetLangStr("T71")	;//Save to File
	Gui, 1:Add, Button, r2 x+161 yp w100 gCopyClipboardIDS2, % GetLangStr("T72")	;//Copy to Clipboard
	
	Gui, 1:Tab, 2, 1
	Gui, 1:Add, GroupBox, w775 h90 Section, % GetLangStr("T74")	;//Step 1:  Find a slot
	Gui, 1:Add, Text, r1 xp+10 yp+20, % GetLangStr("T75")	;//Type:
	Gui, 1:Add, DropDownList, xp y+5 w175 vTypeDropDownList1 gSiftSlots Sort, ||	;BGI MONSTER LONG 4 PART
	Gui, 1:Add, Text, r1 x+10 yp-18, % GetLangStr("T76")	;//Foot circle size:
	Gui, 1:Add, DropDownList, xp y+5 w100 vSizeDropDownList1 gSiftSlots Sort, ||	;NORMAL 3
	Gui, 1:Add, Text, r1 x+10 yp-18, % GetLangStr("T77")	;//Paperdoll:
	Gui, 1:Add, DropDownList, xp y+5 w100 vPaperdollDropDownList1 gSiftSlots Sort, ||	;Yes
	Gui, 1:Add, Text, r1 x+10 yp-18, % GetLangStr("T78")	;//Subtype:
	Gui, 1:Add, DropDownList, xp y+5 w100 vSubtypeDropDownList1 gSiftSlots Sort, ||	;WQM paletted
	
	Gui, 1:Add, Text, r1 x+10 yp-18, % GetLangStr("T52")	;//2DA Soundset
	Gui, 1:Add, DropDownList, xp y+5 w100 vSoundsetDropDownList1 gSiftSlots Sort, ||
	
	Gui, 1:Add, Text, r1 xs+10 y+10 w755 cRed vSummaryText1, ;Slot found at:
	Gui, 1:Add, GroupBox, xs w775 h70 Section, % GetLangStr("T79")	;//Step 2:  Pick a name
	Gui, 1:Add, Text, r1 xp+10 yp+20 w755, % GetLangStr("T80")	;//After finding a slot, please enter a descriptive name for your animation (this will also be used for ANIMATE.IDS):
	Gui, 1:Add, Edit, w755 -Wrap Limit34 Uppercase Disabled vSlotNameEdit1 gSlotNameEdit1, 
	Gui, 1:Add, GroupBox, xs w775 h70 Section, % GetLangStr("T81")	;//Step 3:  Claim your slot
	Gui, 1:Add, Button, x144 yp+20 Disabled vClaimButton1 gClaimButton1, % GetLangStr("T82")	;//Claim Animation Slot
	Gui, 1:Add, Button, x551 yp vResetClaimButton gResetClaimButton, % GetLangStr("T83")	;//Clear Selections
	Gui, 1:Add, Text, r1 xs+10 y+5 w755 cRed vSummaryText3, ;You have claimed...
	Gui, 1:Add, GroupBox, xs w775 h220 Section, % GetLangStr("T84")	;//Step 4:  Implement your new slot
	Gui, 1:Add, Text, xp+10 yp+20, % GetLangStr("T85")	;//Add to your WeiDU installer:
	Gui, 1:Add, Edit, r2 xp y+5 w755 ReadOnly Disabled vWeiDUEdit1,
	Gui, 1:Add, Button, vCopyClipboardWeiDUEdit1 gCopyClipboardWeiDUEdit1 Disabled, % GetLangStr("T72")	;//Copy to Clipboard
	Gui, 1:Add, Text, y+20, % GetLangStr("T86")	;//Add to your ANIMATE.IDS:
	Gui, 1:Add, Edit, xp y+5 w755 ReadOnly Disabled vAnimateIDSEdit2,
	Gui, 1:Add, Text, , % GetLangStr("T87")	;//Add to your ANISND.IDS:
	Gui, 1:Add, Edit, xp y+5 w755 ReadOnly Disabled vAnisndIDSEdit2,
	Gui, 1:Add, Text, x-20 y-20 w0 h0 vFoundSlot,
	
	Gui, 1:Tab, 1, 1
	Gui, 1:Add, GroupBox, w775 h598 Section, % GetLangStr("T88")	;//IA_list:
	Gui, 1:Add, Link, r1 xp+10 yp+20, % GetLangStr("T89")	;//Start with getting the current IA_list from <a href="www.shsforums.net">this forum</a>.  Paste it here or load it from a file using the corresponding buttons at the bottom.
	Gui, 1:Font, , Courier New
	Gui, 1:Add, Edit, xp y+10 w755 h480 ReadOnly vIAListEdit
	Gui, 1:Font
	Gui, 1:Add, Link, r1 xp y+10, % GetLangStr("T90")	;//Any animation slots you claim will be added to this list.  Be sure to post this list along with your content back to <a href="www.shsforums.net">the same forum</a>.
	Gui, 1:Add, Button, r2 xp y+10 w100 gLoadIAList, % GetLangStr("T91")	;//Load from File
	Gui, 1:Add, Button, r2 x+50 yp w100 gPasteClipboardIAList, % GetLangStr("T92")	;//Paste from Clipboard
	Gui, 1:Add, Button, r2 x+256 yp w100 gCopyClipboardIAList, % GetLangStr("T72")	;//Copy to Clipboard
	Gui, 1:Add, Button, r2 x+50 yp w100 gSaveIAList, % GetLangStr("T71")	;//Save to File
	
	
	;~ Gui, 1: +Resize
	Gui, 1: +HwndhGUI1
	Gui, 1:Show, , % GetLangStr("T93")	;//IA Reference Picker %PS_Version%
	SiftSlots()
	Gui, 2:Add, Picture, x0 y0 vPreviewPicture AltSubmit, % ""
	Gui, 2: -Border -Caption +HwndhGUI2 ; +Owner1 
	Gui, 2:Show, w0 h0, % ""
	Gui, 1:Show
	exDock:=new Dock(hGUI1,hGUI2)
	exDock.Position("RC")
	OnMessage(0x1C,"WM_ACTIVATEAPP")
	;~ Dock.HelperFunc.MoveWindow(hGUI2, 500, 500)
	Hotkey, IfWinActive, % "ahk_id " hGUI1
		Hotkey, !l, LoadLang
}

WM_ACTIVATEAPP(wParam, lParam, msg, hwnd){
	Global hGUI1, hGUI2
	If (hwnd=hGUI1) AND wParam AND hGUI2
		{
		GuiControlGet, CurrentTabMain, 1:, TabMain
		If (CurrentTabMain=3)
			WinActivate, % "ahk_id " hGUI1
		}
}

LoadLang(){
	FileSelectFile, Path, 3, %A_ScriptDir%\lang\, % GetLangStr("T48"), % GetLangStr("T100")
	If !FileExist(Path)
		Return
	Loop, %Path%, 0, 0
		Path:=A_LoopFileLongPath
	SplitPath, Path, , , , OutNameNoExt,
	IniWrite, %OutNameNoExt%, %A_ScriptDir%\Config.txt, Program, UseLang
	Reload
}

ChangeTab(){
	GuiControlGet, CurrentTabMain, 1:, TabMain
	If (CurrentTabMain=4)
		{
		GuiControl, 1:Move, TabMain, h20
		GuiControl, 1:Show, TabRefChart
		}
	Else
		{
		GuiControl, 1:Hide, TabRefChart
		GuiControl, 1:Move, TabMain, h635
		}
	If (CurrentTabMain<>3)
		{
		Gui, 2:Show, w0 h0, % ""
		Gui, 1:Show
		}
	Else
		AnimationListBox1()
}

SiftSlots(){
	TypeList:=SizeList:=PaperdollList:=SubtypeList:=SoundsetList:=Slot:=""
	GuiControlGet, Type, 1:, TypeDropDownList1
	GuiControlGet, Size, 1:, SizeDropDownList1
	GuiControlGet, Paperdoll, 1:, PaperdollDropDownList1
	GuiControlGet, Subtype, 1:, SubtypeDropDownList1
	GuiControlGet, Soundset, 1:, SoundsetDropDownList1
	If (A_GuiControl="SoundsetDropDownList1") AND (Soundset="Yes")
		{
		Gui +OwnDialogs
		MsgBox, 36, % GetLangStr("T125"), % GetLangStr("T126")
		IfMsgBox, Yes
			Continue:=1
		Else
			{
			GuiControl, 1:ChooseString, SoundsetDropDownList1, No
			GuiControlGet, Soundset, 1:, SoundsetDropDownList1
			}
		}
	For k,v in GUIAnimationList
		{
		If (v["Name"]="EMPTY") ;AND (v["Name"]<>"-----") AND !InStr("xt",v["Availability"])
			{
			If ((Type="") OR (Type=v["AnimationType"])) AND ((Size="") OR (Size=v["FootCircleSize"])) AND ((Subtype="") OR (Subtype=v["Palette"]))
				{
				If (Paperdoll="No") AND (v["Availability"]="p")
					{
					TypeList.=v["AnimationType"] "|", SizeList.=v["FootCircleSize"] "|", PaperdollList.="No|", SubtypeList.=v["Palette"] "|", SoundsetList.="No|"
					If Type AND Size AND Paperdoll AND Subtype AND Soundset AND !Slot
						Slot:=v
					}
				If ((Paperdoll="") OR (v["Availability"]="o"))
					{
					TypeList.=v["AnimationType"] "|", SizeList.=v["FootCircleSize"] "|", PaperdollList.="Yes|No|", SubtypeList.=v["Palette"] "|", SoundsetList.="No|"
					If (YNSS:=IsNamespaceEmpty(v["Label"]))
						SoundsetList.="Yes|"
					If Type AND Size AND Paperdoll AND Subtype AND Soundset AND !Slot
						{
						If (Soundset="Yes")
							{
							If YNSS
								Slot:=v
							}
						Else
							Slot:=v
						}
					}
				}
			}
		}
	If (Type="CHARACTER BGI") OR (Type="CHARACTER BGII") OR (Type="DRAGONS (XDR)") OR (Soundset="Yes")
		PaperdollList:="Yes|"
	Sort, TypeList, UZD|
	Sort, SizeList, UZD|
	Sort, PaperdollList, UZD|
	Sort, SubtypeList, UZD|
	Sort, SoundsetList, UZD|
	GuiControl, 1:, TypeDropDownList1, % "|" StrReplace(TypeList,Type,Type "||","",1)
	GuiControl, 1:, SizeDropDownList1, % "|" StrReplace(SizeList,Size,Size "||","",1)
	GuiControl, 1:, PaperdollDropDownList1, % "|" StrReplace(StrReplace(PaperdollList,Paperdoll,Paperdoll "||","",1),"|||","||")
	GuiControl, 1:, SubtypeDropDownList1, % "|" StrReplace(SubtypeList,Subtype,Subtype "||","",1)
	GuiControl, 1:, SoundsetDropDownList1, % "|" StrReplace(StrReplace(SoundsetList,Soundset,Soundset "||","",1),"|||","||")
	GuiControlGet, Paperdoll, 1:, PaperdollDropDownList1
	If IsObject(Slot) AND Paperdoll	; We can pick a slot
		{
		GuiControl, 1:, SummaryText1, % GetLangStr("T94") A_Space Slot["IDS"] A_Tab Format("{:-4}",Slot["Label"]) A_Tab Format("{:-34}",Slot["Name"]) A_Tab Slot["FootCircleSize"] A_Space Slot["Type"] Slot["Availability"] A_Space A_Space Slot["AnimationType"] A_Space Slot["Palette"]
		GuiControl, 1:Enable, SlotNameEdit1
		GuiControl, 1:Focus, SlotNameEdit1
		GuiControlGet, SlotName, 1:, SlotNameEdit1
		If SlotName
			GuiControl, 1:Enable, ClaimButton1
		GuiControl, 1:, FoundSlot, % Slot["IDS"]
		}
	Else
		{
		GuiControl, 1:, SummaryText1, ;% "Slot found at: "
		GuiControl, 1:Disable, SlotNameEdit1
		GuiControl, 1:Disable, ClaimButton1
		GuiControl, 1:, FoundSlot,
		}
}

IsNamespaceEmpty(Label){
	For k,v in NamespaceLUT[Label]
		If (GUIAnimationList[v,"Name"]<>"EMPTY") OR (GUIAnimationList[v,"Availability"]<>"o")
			Return 0
	Return 1
}

ResetClaimButton(){
	GuiControl, 1:, TypeDropDownList1, % "||"
	GuiControl, 1:, SizeDropDownList1, % "||"
	GuiControl, 1:, PaperdollDropDownList1, % "||"
	GuiControl, 1:, SubtypeDropDownList1, % "||"
	GuiControl, 1:, SoundsetDropDownList1, % "||"
	GuiControl, 1:, SummaryText1, ;% "Slot found at: "
	GuiControl, 1:, SummaryText3, ;% "You have claimed: "
	GuiControl, 1:, SlotNameEdit1,
	GuiControl, 1:Disable, SlotNameEdit1
	GuiControl, 1:Disable, ClaimButton1
	GuiControl, 1:, WeiDUEdit1,
	GuiControl, 1:, AnimateIDSEdit2,
	GuiControl, 1:, AnisndIDSEdit2,
	GuiControl, 1:Disable, WeiDUEdit1
	GuiControl, 1:Disable, AnimateIDSEdit2
	GuiControl, 1:Disable, AnisndIDSEdit2
	GuiControl, 1:Disable, CopyClipboardWeiDUEdit1
	GuiControl, 1:, FoundSlot,
	GuiControl, 1:Enable, TypeDropDownList1
	GuiControl, 1:Enable, SizeDropDownList1
	GuiControl, 1:Enable, PaperdollDropDownList1
	GuiControl, 1:Enable, SubtypeDropDownList1
	GuiControl, 1:Enable, SoundsetDropDownList1
	GuiControl, 1:Text, ResetClaimButton, % GetLangStr("T83")
	SiftSlots()
}

ClaimButton1(){
	GuiControl, 1:Disable, ClaimButton1
	GuiControl, 1:Disable, TypeDropDownList1
	GuiControl, 1:Disable, SizeDropDownList1
	GuiControlGet, Paperdoll, 1:, PaperdollDropDownList1
	GuiControlGet, Soundset, 1:, SoundsetDropDownList1
	GuiControl, 1:Disable, PaperdollDropDownList1
	GuiControl, 1:Disable, SubtypeDropDownList1
	GuiControl, 1:Disable, SoundsetDropDownList1
	GuiControlGet, Name, 1:, SlotNameEdit1
	Name:=FormatNameBGII(FormatInputName(Name))
	GuiControl, 1:Disable, SlotNameEdit1
	GuiControlGet, FoundSlot, 1:, FoundSlot
	
	ClaimSlot(GUIAnimationList,NamespaceLUT,FoundSlot,Name,(Paperdoll="yes"?1:0),(Soundset="yes"?1:0))
	GuiControl, 1:Enable, WeiDUEdit1
	GuiControl, 1:Enable, AnimateIDSEdit2
	GuiControl, 1:Enable, AnisndIDSEdit2
	GuiControl, 1:Enable, CopyClipboardWeiDUEdit1
	
	Implement:=FormatWeiDUIDS(FoundSlot,Name)
	GuiControl, 1:, WeiDUEdit1, % Implement["WeiDUStr"]
	GuiControl, 1:, AnimateIDSEdit2, % Implement["AnimateStr"]
	GuiControl, 1:, AnisndIDSEdit2, % Implement["AnisndStr"]
	Gui, 1:Font, , Courier New
	GuiControl, 1:Font, WeiDUEdit1
	GuiControl, 1:Font, AnimateIDSEdit2
	GuiControl, 1:Font, AnisndIDSEdit2
	Gui, 1:Font
	
	Slot:=GUIAnimationList["_" FoundSlot]
	GuiControl, 1:, SummaryText3, % GetLangStr("T95") A_Space Slot["IDS"] A_Tab Format("{:-4}",Slot["Label"]) A_Tab Format("{:-34}",FormatNameBGII(Name)) A_Tab Slot["FootCircleSize"] A_Space Slot["Type"] Slot["Availability"] A_Space A_Space Slot["AnimationType"] A_Space Slot["Palette"]
	
	GuiControl, 1:, AnimationListBox1, % "|" GetAnimationListBox1Choices()
	GuiControl, 1:ChooseString, AnimationListBox1, % "||" Slot["Label"] A_Tab Slot["Name"] "`t`t`t`t`t"  Slot["IDS"]
	PStats:=GetAnimationUsageStats(GUIAnimationList)
	Progress1:=New PS_Progress(755,30)
	Progress1.AddSection(255,0,0,0,PStats.PercentUsed)
	Progress1.AddSection(255,255,0,0,PStats.PercentPartial)
	Progress1.AddSection(0,128,0,0,(100-PStats.PercentUsed-PStats.PercentPartial))
	Progress:=Progress1.GethProgress()
	Progress1:=""
	GuiControl, 1:,ProgressPic, % "hBitmap:*" Progress
	GuiControl, 1:, ProgressText1, % PStats.PercentUsed "% " GetLangStr("T12") "							" PStats.PercentPartial "% " GetLangStr("T13") "						" PStats.PercentFree "% " GetLangStr("T14")
	
	UpdateIDS(GUIAnimationList)
	GuiControl, 1:, AnimateIDSEdit, 126`r`n%animateIDS%
	GuiControl, 1:, AnisndIDSEdit, IDS`r`n `r`n%anisndIDS%
	
	GuiControl, 1:, IAListEdit, % FormatAnimsListShort(GUIAnimationList)
	GuiControl, 1:Text, ResetClaimButton, % GetLangStr("T51")
}

ClaimSlot(AnimationList,LUT,IDS,Name,NeedsPaperdoll,NeedsSoundset){
	AnimationList["_" IDS,"Name"]:=Name
	AnimationType:=AnimationList["_" IDS,"AnimationType"]
	AnimationList["_" IDS,"Availability"]:=(NeedsPaperdoll=1?"x":"t")
	
	; Now we need to set secondary availability changes for slots sharing same Label
	For n,_IDS in LUT[AnimationList["_" IDS,"Label"]]	; For each IDS using that Label
		{
		If (IDS<>AnimationList[_IDS,"IDS"])	; We aren't ourself
			{
			;If (AnimationType=AnimationList[_IDS,"AnimationType"])	; We have a total conflict
			If NeedsSoundset
				AnimationList[_IDS,"Availability"]:="x", AnimationList[_IDS,"Name"]:="-----"
			Else
				{
				If ArrayHasCommonValue(Conflict[AnimationType],Conflict[AnimationList[_IDS,"AnimationType"]])
					AnimationList[_IDS,"Availability"]:="x", AnimationList[_IDS,"Name"]:="-----"
				Else If NeedsPaperdoll AND (AnimationList[_IDS,"Name"]="EMPTY")
					AnimationList[_IDS,"Availability"]:="p"
				}
			}
		}
	For n,_IDS in LUT[AnimationList["_" IDS,"Label"]]	; For each IDS using that Label
		AnimationList[_IDS,"Paperdoll"]:=RequestedPaperdoll(AnimationList[_IDS,"IDS"],AnimationList,LUT)
}

DistributeIAListUpdate(PathToIAList:=""){
	ResetClaimButton()
	GUIAnimationList:="", GUIAnimationList:=ParseAnimsList()
	NamespaceLUT:="", NamespaceLUT:=GenerateNamespaceLUT(GUIAnimationList)
	LoadIDS()
	UsedAnimationList:=ParseAnimsListLessRestrictive(1,PathToIAList)
	IntegrateUsedAnimsList(GUIAnimationList,UsedAnimationList)
	AnalyzePaperdollRequests(GUIAnimationList,NamespaceLUT)
	VerifyAvailability(GUIAnimationList,NamespaceLUT)
	
	
	GuiControl, 1:, AnimationListBox1, % "|" GetAnimationListBox1Choices()
	PStats:=GetAnimationUsageStats(GUIAnimationList)
	Progress1:=New PS_Progress(755,30)
	Progress1.AddSection(255,0,0,0,PStats.PercentUsed)
	Progress1.AddSection(255,255,0,0,PStats.PercentPartial)
	Progress1.AddSection(0,128,0,0,(100-PStats.PercentUsed-PStats.PercentPartial))
	Progress:=Progress1.GethProgress()
	Progress1:=""
	GuiControl, 1:,ProgressPic, % "hBitmap:*" Progress
	GuiControl, 1:, ProgressText1, % PStats.PercentUsed "% " GetLangStr("T12") "							" PStats.PercentPartial "% " GetLangStr("T13") "						" PStats.PercentFree "% " GetLangStr("T14")
	
	UpdateIDS(GUIAnimationList)
	GuiControl, 1:, AnimateIDSEdit, 126`r`n%animateIDS%
	GuiControl, 1:, AnisndIDSEdit, IDS`r`n `r`n%anisndIDS%
	
	GuiControl, 1:, IAListEdit, % FormatAnimsListShort(GUIAnimationList)
}

SlotNameEdit1(){
	GuiControlGet, SlotName, 1:, SlotNameEdit1
	If SlotName
		GuiControl, 1:Enable, ClaimButton1
	Else
		GuiControl, 1:Disable, ClaimButton1
}

ToggleIDSSytle(){
	GuiControlGet, Style, 1:, ToggleIDSCheckbox1
	If (Style=0)	; BGII
		GuiControl, 1:, AnimateIDSEdit, 126`r`n%animateIDS%
	Else	; IWD
		GuiControl, 1:, AnimateIDSEdit, IDS`r`n%animateIDSp%
}

CopyClipboardIDS1(){
	GuiControlGet, tmp, 1:, AnimateIDSEdit
	Clipboard:=StrReplace(StrReplace(tmp,"`r",""),"`n","`r`n")
}

CopyClipboardIDS2(){
	GuiControlGet, tmp, 1:, AnisndIDSEdit
	Clipboard:=StrReplace(StrReplace(tmp,"`r",""),"`n","`r`n")
}

CopyClipboardIAList(){
	GuiControlGet, tmp, 1:, IAListEdit
	Clipboard:=StrReplace(StrReplace(tmp,"`r",""),"`n","`r`n")
}

CopyClipboardWeiDUEdit1(){
	GuiControlGet, tmp, 1:, WeiDUEdit1
	Clipboard:=StrReplace(StrReplace(tmp,"`r",""),"`n","`r`n")
}

PasteClipboardIAList(){
	GuiControl, 1:, IAListEdit, % Trim(Clipboard," `t`r`n")
	DistributeIAListUpdate()
}

SaveIDS1(){
	GuiControlGet, tmp, 1:, AnimateIDSEdit
	tmp:=StrReplace(StrReplace(tmp,"`r",""),"`n","`r`n")
	Gui +OwnDialogs
	FileSelectFile, Path, S18, animate.ids, % GetLangStr("T96"), % GetLangStr("T97")	;//IDS File (*.ids)
	If !Path
		Return
	SplitPath, Path, , , OutExtension
	file:=FileOpen(Path (OutExtension?"":".ids"),"w-d")
		file.Write(tmp)
	file.Close()
}

SaveIDS2(){
	GuiControlGet, tmp, 1:, AnisndIDSEdit
	tmp:=StrReplace(StrReplace(tmp,"`r",""),"`n","`r`n")
	Gui +OwnDialogs
	FileSelectFile, Path, S18, anisnd.ids, % GetLangStr("T98"), % GetLangStr("T97")	;//IDS File (*.ids)
	If !Path
		Return
	SplitPath, Path, , , OutExtension
	file:=FileOpen(Path (OutExtension?"":".ids"),"w-d")
		file.Write(tmp)
	file.Close()
}

SaveIAList(){
	GuiControlGet, tmp, 1:, IAListEdit
	tmp:=StrReplace(StrReplace(tmp,"`r",""),"`n","`r`n")
	FormatTime, Time, %A_NowUTC%, yyyy-MM-dd@HH.mm.ss'UTC'
	Gui +OwnDialogs
	FileSelectFile, Path, S18, IA_list_%Time%, % GetLangStr("T99"), % GetLangStr("T100")	;//Text Documents (*.txt)
	If !Path
		Return
	SplitPath, Path, , , OutExtension
	file:=FileOpen(Path (OutExtension<>"txt"?".txt":""),"w-d")
		file.Write(tmp)
	file.Close()
}

LoadIAList(){
	Gui +OwnDialogs
	FileSelectFile, Path, 3, , % GetLangStr("T101"), % GetLangStr("T100")	;//Text Documents (*.txt)
	If !Path
		Return
	file:=FileOpen(Path,"r-d")
		tmp:=file.Read()
	file.Close()
	GuiControl, 1:, IAListEdit, % Trim(tmp," `t`r`n")
	DistributeIAListUpdate()
}

GetAnimationListBox1Choices(){
	List:=""
	For k,v in GUIAnimationList
		If (v["Availability"]<>"o") AND (v["Name"]<>"-----") AND (v["Name"]<>"EMPTY")
			List.=v["Label"] A_Tab v["Name"] "`t`t`t`t`t"  v["IDS"] "|"
	Return List
}

AnimationListBox1(){
	GuiControlGet, CurrentAnim, 1:, AnimationListBox1
	IDS:=SubStr(CurrentAnim,-5)
	GuiControl, 1:, SummaryText2, % RTrim(FormatStr(GUIAnimationList["_" IDS,"Name"],A_Space,34,"C") A_Space FormatStr(GUIAnimationList["_" IDS,"AnimationType"],A_Space,23,"C") A_Space FormatStr(GUIAnimationList["_" IDS,"Palette"],A_Space,12,"C") A_Space FormatStr(GUIAnimationList["_" IDS,"Label"],A_Space,5,"C") A_Space FormatStr(GUIAnimationList["_" IDS,"IDS"],A_Space,7,"C") A_Space FormatStr(GUIAnimationList["_" IDS,"FootCircleSize"],A_Space,9,"C") A_Space FormatStr(GUIAnimationList["_" IDS,"Paperdoll"],A_Space,9,"C"))
	Gui, 1:Font, , Courier New
	GuiControl, 1:Font, SummaryText2
	Gui, 1:Font
	ID:=GUIAnimationList["_" IDS,"Label"]
	GuiControl, 1:, FilesText1, % GetFileList(GUIAnimationList["_" IDS,"AnimationType"],GUIAnimationList["_" IDS,"Palette"])
	LoadPreviewImage(A_ScriptDir "\preview\" IDS ".gif")
	;MsgBox % A_ScriptDir "\preview\" IDS ".gif"
}

LoadPreviewImage(Path){
	;Gui, 2:Add, Picture, x1 y1, %Path%
	Global exDock, hGUI1, hGUI2
	IfExist, %Path%
		{
		GuiControl, 2:, PreviewPicture, *w0 *h0 %Path%
		GuiControlGet, Pic, 2:Pos, PreviewPicture
		Gui, 2:Show, % "w" PicW " h" PicH, % ""
		Gui, 1:Show
		;~ exDock.Add(hGUI1,hGUI2)
		}
	Else
		{
		;~ exDock.Unhook()
		Gui, 2:Show, w0 h0, % ""
		Gui, 1:Show
		}
}

GetAnimationFirstName(AnimationList){
	For k,v in AnimationList
		If (v["Availability"]<>"o")
			Return v["Name"]
}

GetAnimationUsageStats(AnimationList){
	Local
	Stats:={}, Total:=Free:=Used:=Partial:=0
	For k,v in AnimationList
		{
		If (v["Availability"]="o")
			Free++
		Else If (v["Availability"]="p")
			Partial++
		Else
			Used++
		Total++
		}
	Stats["Total"]:=Total, Stats["Free"]:=Free, Stats["Used"]:=Used, Stats["Partial"]:=Partial, 
	Stats["PercentFree"]:=Round(Free/Total*100), Stats["PercentUsed"]:=Round(Used/Total*100), Stats["PercentPartial"]:=Round(Partial/Total*100)
	Return Stats
}

ParseAnimsList(PathToAnimsList:=""){
	If !PathToAnimsList
		PathToAnimsList:=A_ScriptDir "\anims.list"
	AnimationList:={}
	IfNotExist, %PathToAnimsList%
		throw { what: (IsFunc(A_ThisFunc)?"function: " A_ThisFunc "()":"") A_Space (IsLabel(A_ThisLabel)?"label: " A_ThisLabel:""), file: A_LineFile, line: A_LineNumber, message: "anims.list not found.  Program will exit.", extra: "Search Path='" PathToAnimsList "'`n`n" Traceback()}
	file:=FileOpen(PathToAnimsList,"r-d")
		List:=Trim(file.Read(file.Length)," `t`r`n")	;file.Read(file.Length)
	file.Close()
	Loop, Parse, List, `n, `r%A_Space%%A_Tab%	; For each line
		{
		Params:=StrSplit(A_LoopField,A_Tab,A_Space)		; Split by tabs
		IDS:=Format("{:L}",Params[1])
		AnimationList["_" IDS,"IDS"]:=IDS
		AnimationList["_" IDS,"Label"]:=Format("{:U}",Params[2])
		AnimationList["_" IDS,"Name"]:=FormatNameBGII(Format("{:U}",Params[3]))
		AnimationList["_" IDS,"FootCircleSize"]:=Format("{:U}",SubStr(Params[4],1,8))
		AnimationList["_" IDS,"Type"]:=Format("{:U}",SubStr(Params[4],10,1))
		AnimationList["_" IDS,"Availability"]:=Format("{:L}",SubStr(Params[4],11,1))
		ParamsB:=SubStr(Params[4],14)
		FoundStr:=""
		FoundPos:=RegExMatch(ParamsB,"i)([Ww][PpQq][LlMmNnSs][ ])*(un)*paletted",FoundStr)
		If FoundPos
			{
			AnimationList["_" IDS,"Palette"]:=FoundStr
			ParamsB:=StrReplace(ParamsB,FoundStr)
			}
		AnimationList["_" IDS,"AnimationType"]:=Format("{:U}",Trim(ParamsB," `t"))
		}
	VerifyAnimationList(AnimationList)
	Return AnimationList
}

ParseAnimsListLessRestrictive(Internal:=1,PathToAnimsList:=""){
	AnimationList:={}
	If Internal
		{
		GuiControlGet, List, 1:, IAListEdit
		List:=Trim(List," `t`r`n")
		}
	Else
		{
		If !PathToAnimsList
			PathToAnimsList:=A_ScriptDir "\anims.list"
		IfNotExist, %PathToAnimsList%
			throw { what: (IsFunc(A_ThisFunc)?"function: " A_ThisFunc "()":"") A_Space (IsLabel(A_ThisLabel)?"label: " A_ThisLabel:""), file: A_LineFile, line: A_LineNumber, message: "anims.list not found.  Program will exit.", extra: "Search Path='" PathToAnimsList "'`n`n" Traceback()}
		file:=FileOpen(PathToAnimsList,"r-d")
			List:=Trim(file.Read(file.Length)," `t`r`n")	;file.Read(file.Length)
		file.Close()
		}
	Loop, Parse, List, `n, `r%A_Space%%A_Tab%	; For each line
		{
		Line:=Trim(A_LoopField," `t")
		Name:=Label:=IDS:=FootCircleSize:=Type:=Availability:=AnimationType:=Palette:=""
		If FoundPos:=RegExMatch(Line,"i)([Ww][PpQq][LlMmNnSs][ ])*(un)*paletted$",FoundStr:="")
			{
			Palette:=FoundStr
			Line:=SubStr(Line,1,FoundPos-1)
			Line:=Trim(Line," `t")
			}
		If FoundPos:=RegExMatch(Line,"i)(BGI MONSTER LONG|BGI MONSTER LONG 4 PART|BGI SIMPLE CASTER \(BOW\)|BGI SIMPLE CASTER \(S1\)|BGI SIMPLE MONSTER|BGII SPLIT|BGII SPLIT 4 PART|BGII UNSPLIT EXT.|BROKEN ANKHEG|CHARACTER BGI|CHARACTER BGII|DRAGONS \(XDR\)|IWD LARGE|IWD SMALL){1}$",FoundStr:="")
			{
			AnimationType:=FoundStr
			Line:=SubStr(Line,1,FoundPos-1)
			Line:=Trim(Line," `t")
			}
		If FoundPos:=RegExMatch(Line,"i)[OoPpTtXx]{1}$",FoundStr:="")
			{
			Availability:=FoundStr
			Line:=SubStr(Line,1,FoundPos-1)
			Line:=Trim(Line," `t")
			}
		If FoundPos:=RegExMatch(Line,"i)[BbCcDdIiLlXx]{1}$",FoundStr:="")
			{
			Type:=FoundStr
			Line:=SubStr(Line,1,FoundPos-1)
			Line:=Trim(Line," `t")
			}
		If FoundPos:=RegExMatch(Line,"i)[AaDd35]{1}$",FoundStr:="")
			{
			FootCircleSize:=FoundStr
			Line:=SubStr(Line,1,FoundPos-1)
			Line:=Trim(Line," `t")
			}
		If FoundPos:=RegExMatch(Line,"i)(HUGE|LARGE|NORMAL){1}$",FoundStr:="")
			{
			FootCircleSize:=Format("{:-7}" FootCircleSize,FoundStr)
			Line:=SubStr(Line,1,FoundPos-1)
			Line:=Trim(Line," `t")
			}
		If FoundPos:=RegExMatch(Line,"i)^0[Xx][0-9A-Fa-f]{4}",FoundStr:="")
			{
			IDS:=FoundStr
			Line:=SubStr(Line,StrLen(FoundStr)+1)
			Line:=Trim(Line," `t")
			}
		If FoundPos:=RegExMatch(Line,"i)^\S{3,4}",FoundStr:="")
			{
			Label:=FoundStr
			Line:=SubStr(Line,StrLen(FoundStr)+1)
			Line:=Trim(Line," `t")
			}
		Name:=FormatNameBGII(Line)
		Palette:=Format("{:U}",StrReplace(StrReplace(Palette,"PALETTED","paletted"),"UNPALETTED","unpaletted"))
		AnimationList["_" IDS,"Palette"]:=Palette
		AnimationList["_" IDS,"AnimationType"]:=Format("{:U}",AnimationType)
		AnimationList["_" IDS,"Availability"]:=Format("{:L}",Availability)
		AnimationList["_" IDS,"Type"]:=Format("{:U}",Type)
		AnimationList["_" IDS,"FootCircleSize"]:=Format("{:U}",FootCircleSize)
		AnimationList["_" IDS,"IDS"]:=Format("{:L}",IDS)
		AnimationList["_" IDS,"Label"]:=Format("{:U}",Label)
		AnimationList["_" IDS,"Name"]:=Format("{:U}",Name)
		}
	VerifyAnimationList(AnimationList)
	Return AnimationList
}

VerifyAnimationList(AnimationList){
	For k,v in AnimationList
		{
		tmp:=v["IDS"]
		If tmp is not Integer
			throw { what: (IsFunc(A_ThisFunc)?"function: " A_ThisFunc "()":"") A_Space (IsLabel(A_ThisLabel)?"label: " A_ThisLabel:""), file: A_LineFile, line: A_LineNumber, message: "Contents of anims.list failed verification.  Program will exit.", extra: "IDS on line " A_Index " is " v["IDS"] " which does not look like an integer.`n`n" Traceback()}
		Else If (Len:=StrLen(v["Label"])<3) OR (Len>4)
			throw { what: (IsFunc(A_ThisFunc)?"function: " A_ThisFunc "()":"") A_Space (IsLabel(A_ThisLabel)?"label: " A_ThisLabel:""), file: A_LineFile, line: A_LineNumber, message: "Contents of anims.list failed verification.  Program will exit.", extra: "Label on line " A_Index " is " v["Label"] " but must be 3 or 4 characters long.`n`n" Traceback()}
		Else If !v["Name"]
			throw { what: (IsFunc(A_ThisFunc)?"function: " A_ThisFunc "()":"") A_Space (IsLabel(A_ThisLabel)?"label: " A_ThisLabel:""), file: A_LineFile, line: A_LineNumber, message: "Contents of anims.list failed verification.  Program will exit.", extra: "Name on line " A_Index " is blank.`n`n" Traceback()}
		Else If (v["FootCircleSize"]<>"LARGE  5") AND (v["FootCircleSize"]<>"HUGE   A") AND (v["FootCircleSize"]<>"HUGE   D") AND (v["FootCircleSize"]<>"NORMAL 3")
			throw { what: (IsFunc(A_ThisFunc)?"function: " A_ThisFunc "()":"") A_Space (IsLabel(A_ThisLabel)?"label: " A_ThisLabel:""), file: A_LineFile, line: A_LineNumber, message: "Contents of anims.list failed verification.  Program will exit.", extra: "FootCircleSize on line " A_Index " is " v["FootCircleSize"] " which is not valid.`n`n" Traceback()}
		Else If !InStr("BCDILX",v["Type"])
			throw { what: (IsFunc(A_ThisFunc)?"function: " A_ThisFunc "()":"") A_Space (IsLabel(A_ThisLabel)?"label: " A_ThisLabel:""), file: A_LineFile, line: A_LineNumber, message: "Contents of anims.list failed verification.  Program will exit.", extra: "Type on line " A_Index " is " v["Type"] " which is not valid.`n`n" Traceback()}
		Else If !InStr("optx",v["Availability"])
			throw { what: (IsFunc(A_ThisFunc)?"function: " A_ThisFunc "()":"") A_Space (IsLabel(A_ThisLabel)?"label: " A_ThisLabel:""), file: A_LineFile, line: A_LineNumber, message: "Contents of anims.list failed verification.  Program will exit.", extra: "Availability on line " A_Index " is " v["Availability"] " which is not valid.`n`n" Traceback()}
		Else If !v["AnimationType"]
			throw { what: (IsFunc(A_ThisFunc)?"function: " A_ThisFunc "()":"") A_Space (IsLabel(A_ThisLabel)?"label: " A_ThisLabel:""), file: A_LineFile, line: A_LineNumber, message: "Contents of anims.list failed verification.  Program will exit.", extra: "AnimationType on line " A_Index " is blank.`n`n" Traceback()}
		Else If !InStr(v["Palette"],"paletted")	; (v["Palette"]<>"unpaletted") AND (v["Palette"]<>"paletted")
			throw { what: (IsFunc(A_ThisFunc)?"function: " A_ThisFunc "()":"") A_Space (IsLabel(A_ThisLabel)?"label: " A_ThisLabel:""), file: A_LineFile, line: A_LineNumber, message: "Contents of anims.list failed verification.  Program will exit.", extra: "Palette on line " A_Index " is " v["Palette"] " which is not valid.`n`n" Traceback()}
		}
}

FormatAnimsList(AnimationList){
	VarSetCapacity(List,800000)
	For k,v in AnimationList	;IDS	Label	Name	FootCircleSize	Type	Availability	AnimationType	Palette
		List.=v["IDS"] A_Tab Format("{:-4}",v["Label"]) A_Tab Format("{:-34}",v["Name"]) A_Tab v["FootCircleSize"] A_Space v["Type"] v["Availability"] A_Space A_Space v["AnimationType"] A_Space v["Palette"] "`r`n"
	Return Trim(List," `t`r`n")
}

FormatAnimsListShort(AnimationList){
	VarSetCapacity(List,800000)
	For k,v in AnimationList	;IDS	Label	Name	FootCircleSize	Type	Availability	AnimationType	Palette
		If (v["Name"]<>"EMPTY") OR (v["Availability"]<>"o")
			List.=v["IDS"] A_Tab Format("{:-4}",v["Label"]) A_Tab Format("{:-34}",v["Name"]) A_Tab v["FootCircleSize"] A_Space v["Type"] v["Availability"] A_Space A_Space v["AnimationType"] A_Space v["Palette"] "`r`n"
	Return Trim(List," `t`r`n")
}

FormatAnimsListDelimited(AnimationList,delimiter:="`t"){
	VarSetCapacity(List,800000)
	For k,v in AnimationList	;IDS	Label	Name	FootCircleSize	Type	Availability	AnimationType	Palette	Paperdoll	Date
		List.=v["IDS"] delimiter v["Label"] delimiter v["Name"] delimiter v["FootCircleSize"] delimiter v["Type"] delimiter v["Availability"] delimiter v["AnimationType"] delimiter v["Palette"] delimiter v["Paperdoll"] (v.HasKey("Date")?delimiter v["Date"]:"") "`r`n"
	Return Trim(List," `t`r`n" delimiter)
}

IntegrateUsedAnimsList(FullAnimationList,UsedAnimationList){
	For k,v in UsedAnimationList	;IDS	Label	Name	FootCircleSize	Type	Availability	AnimationType	Palette
		{
		FullAnimationList[k,"Name"]:=v["Name"]
		FullAnimationList[k,"Availability"]:=v["Availability"]
		; Could also perform some further verificattion checks on other keys to ensure nothing amiss, but this would take more computation time...
		}
}

IntegrateUsedAnimsListWithDates(FullAnimationList,UsedAnimationList,ListName){
	For k,v in UsedAnimationList	;IDS	Label	Name	FootCircleSize	Type	Availability	AnimationType	Palette
		{
		FullAnimationList[k,"Name"]:=v["Name"]
		FullAnimationList[k,"Availability"]:=v["Availability"]
		SplitPath, ListName, , , , OutNameNoExt
		If !FullAnimationList[k].HasKey("Date")
			FullAnimationList[k,"Date"]:=OutNameNoExt
		; Could also perform some further verificattion checks on other keys to ensure nothing amiss, but this would take more computation time...
		}
}

GenerateNamespaceLUT(AnimationList){
	LUT:={}
	For k,v in AnimationList
		{
		If !IsObject(LUT[v["Label"]])
			LUT[v["Label"]]:={}
		LUT[v["Label"],LUT[v["Label"]].Count()+1]:="_" v["IDS"]
		}
	Return LUT
}

VerifyAvailability(AnimationList,LUT){
	ConflictList:=""
	For Label,List in LUT	; For each Label
		{
		If (List.Count()>1)	; If more than one animation shares the same namespace
			{
			For n,_IDS in List	; For each IDS using that Label
				{
				For nn,__Ids in List	; For each IDS using that Label
					{
					If (n<>nn) AND ArrayHasCommonValue(Conflict[AnimationList[_IDS,"AnimationType"]],Conflict[AnimationList[__IDS,"AnimationType"]])	; Not itself and there is a conflict
						{
						If (AnimationList[__IDS,"Availability"]="o") AND (AnimationList[_IDS,"Availability"]<>"o")
							ConflictList.=A_Tab Label "`r`n"
						}
					}
				}
			}
		}
	If ConflictList
		{
		Gui +OwnDialogs
		MsgBox, 262192, % GetLangStr("T102"), % GetLangStr("T103") "`n" ConflictList	;//Conflicts were found in the following namespaces:`r`n%ConflictList%
		}
}

RequestedPaperdoll(IDS,AnimationList,LUT){
	If (AnimationList["_" IDS,"Name"]="EMPTY") OR (AnimationList["_" IDS,"Name"]="-----") OR (AnimationList["_" IDS,"Availability"]<>"x")
		Return "No"	; Can only have requested a paperdoll if Availability=x
	Label:=AnimationList["_" IDS,"Label"], PPDConflict:=0
	For n,_IDS in LUT[Label]	; For each IDS using that Label
		{
		If (AnimationList[_IDS,"Name"]<>"-----") AND (AnimationList[_IDS,"Availability"]="x") AND (AnimationList[_IDS,"IDS"]<>IDS)
			PPDConflict++
		}
	If (PPDConflict=0)	; IDS was the only one in its namespace with Availability=x
		Return "Yes"
	Else
		Return "Maybe"
}

AnalyzePaperdollRequests(AnimationList,LUT){
	For k,v in AnimationList
		v["Paperdoll"]:=RequestedPaperdoll(v["IDS"],AnimationList,LUT)
}

LoadIDS(){
	file:=FileOpen(A_ScriptDir "\animateIDS.list","r-d")
		animateIDS:=file.Read()
	file.Close()
	file:=FileOpen(A_ScriptDir "\animateIDSp.list","r-d")
		animateIDSp:=file.Read()
	file.Close()
	file:=FileOpen(A_ScriptDir "\anisndIDS.list","r-d")
		anisndIDS:=file.Read()
	file.Close()
}

UpdateIDS(AnimationList){	; animateIDS=126`r`n, anisndIDS=IDS`r`n `r`n
	For k,v in AnimationList
		{
		Name:=v["Name"]
		If (Name<>"EMPTY") AND (Name<>"-----") AND (v["Availability"]<>"o")
			{
			IDS:=Format("{:U}",v["IDS"]), IDS:=StrReplace(IDS,"0X","0x")
			If !InStr(animateIDS,IDS)
				animateIDS.="`r`n" IDS A_Space FormatNameBGII(Name)
			If !InStr(animateIDSp,IDS)
				animateIDSp.="`r`n" IDS A_Space FormatNameIWD(Name)
			If !InStr(anisndIDS,IDS)
				anisndIDS.="`r`n" IDS A_Space Format("{:-9}",Format("{:U}",v["Label"])) "CGAMEANIMATIONTYPE_" FormatNameBGII(Name)
			}
		}
	
	animateIDS:=TempFormatIDS1(animateIDS), animateIDSLUT:={}
	Loop, Parse, AnimateIDS, `n, `r
		Str:=StrSplit(A_LoopField,A_Space), animateIDSLUT["_" Str[1]]:=Str[2]
	For k,v in AnimationList
		If animateIDSLUT.HasKey(k)
			v["Name"]:=animateIDSLUT[k]
	
	anisndIDS:=TempFormatIDS2(anisndIDS) ;, anisndIDSLUT:={}, Diff:=""
	;~ Loop, Parse, AnisndIDS, `n, `r
		;~ Str:=StrSplit(A_LoopField,A_Space), anisndIDSLUT["_" Str[1]]:=Str[2]
	;~ For k,v in AnimationList
		;~ If anisndIDSLUT.HasKey(k) AND (v["Label"]<>anisndIDSLUT[k])
			;~ Diff.=v["Label"] " <> " anisndIDSLUT[k] "`n"
	;~ If Diff
		;~ MsgBox, , anisnd.ids Diff, %Diff%
	
	
	Sort, animateIDS
	Sort, animateIDSp
	Sort, anisndIDS
}

TempFormatIDS1(Data){
	Data:=RegExReplace(Data,"i)(^[ \t]+|[ \t\r]+$)")	; Remove leading and trailing whitespace
	Data:=RegExReplace(Data,"i)[\r]+")
	Data:=RegExReplace(Data,"i)[\n][ \t]+[\n]","`n")
	Data.="`n"
	
	Data:=RegExReplace(Data,"iU)0x1001[ \t]+NABASSU[\n]","0x1001 FIEND_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x1002[ \t]+DEMON_BLUE[\n]","0x1002 FIEND_BLUE`n")
	Data:=RegExReplace(Data,"iU)0x1004[ \t]+SHARK_SANDBARD[\n]","0x1004 GW_SHARK_SANDBARD`n")
	Data:=RegExReplace(Data,"iU)0x1005[ \t]+OVERSEER_WARRIOR1[\n]","0x1005 GW_OVERSEER_WARRIOR1`n")
	Data:=RegExReplace(Data,"iU)0x1006[ \t]+OVERSEER_WARRIOR2[\n]","0x1006 GW_OVERSEER_WARRIOR2`n")
	Data:=RegExReplace(Data,"iU)0x1007[ \t]+OVERSEER_WARRIOR3[\n]","0x1007 GW_OVERSEER_WARRIOR3`n")
	Data:=RegExReplace(Data,"iU)0x1008[ \t]+OVERSEER_CAPTAIN[\n]","0x1008 GW_OVERSEER_CAPTAIN`n")
	Data:=RegExReplace(Data,"iU)0x1009[ \t]+OVERSEER_NUDE[\n]","0x1009 GW_OVERSEER_NUDE`n")
	Data:=RegExReplace(Data,"iU)0x1101[ \t]+DRAGON_WHITE_YOUNG[\n]","0x1101 DRAGON_WHITE`n")
	Data:=RegExReplace(Data,"iU)0x1102[ \t]+CATAPULT[\n]","0x1102 GW_CATAPULT`n")
	Data:=RegExReplace(Data,"iU)0x1209[ \t]+TARASQUE[\n]","0x1209 GW_TARASQUE`n")
	Data:=RegExReplace(Data,"iU)0x120A[ \t]+TARASQUE_BLUE[\n]","0x120A GW_TARASQUE_BLUE`n")
	Data:=RegExReplace(Data,"iU)0x120B[ \t]+TARASQUE_GREEN[\n]","0x120B GW_TARASQUE_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x120C[ \t]+TARASQUE_PURPLE[\n]","0x120C GW_TARASQUE_PURPLE`n")
	Data:=RegExReplace(Data,"iU)0x120D[ \t]+TARASQUE_RED[\n]","0x120D GW_TARASQUE_RED`n")
	Data:=RegExReplace(Data,"iU)0x1300[ \t]+DEMIGORGON[\n]","0x1300 DEMOGORGON`n")
	Data:=RegExReplace(Data,"iU)0x1301[ \t]+DRAGON_MECANIC[\n]","0x1301 GW_DRAGON_MECHANIC`n")
	Data:=RegExReplace(Data,"iU)0x1301[ \t]+GW_DRAGON_MECANIC[\n]","0x1301 GW_DRAGON_MECHANIC`n")
	Data:=RegExReplace(Data,"iU)0x5018[ \t]+GOBLIN_WORGRIDER[\n]","0x5018 GOBLIN_WORG`n")
	Data:=RegExReplace(Data,"iU)0x5019[ \t]+GOBLIN_WORGRIDER_CAPTAIN[\n]","0x5019 GOBLIN_WORG_CAPTAIN`n")
	Data:=RegExReplace(Data,"iU)0x502B[ \t]+FROST_GIANT[\n]","0x502B GIANT_FROST`n")
	Data:=RegExReplace(Data,"iU)0x504A[ \t]+FIRE_GIANT_IWD[\n]","0x504A GIANT_FIRE_IWD`n")
	Data:=RegExReplace(Data,"iU)0x504B[ \t]+IRON_GOLEM_IWD[\n]","0x504B GOLEM_IRON_IWD`n")
	Data:=RegExReplace(Data,"iU)0x5050[ \t]+VERBEEG[\n]","0x5050 GIANT_VERBEEG`n")
	Data:=RegExReplace(Data,"iU)0x505C[ \t]+OVERSEER_MAGE[\n]","0x505C GW_OVERSEER_MAGE`n")
	Data:=RegExReplace(Data,"iU)0x505D[ \t]+FROZEN_HORROR[\n]","0x505D GW_FROZEN_HORROR`n")
	Data:=RegExReplace(Data,"iU)0x505E[ \t]+TROLL_AVATAR_DARKNESS[\n]","0x505E GW_TROLL_AVATAR_DARKNESS`n")
	Data:=RegExReplace(Data,"iU)0x505F[ \t]+TROLL_AVATAR_BLUE[\n]","0x505F GW_TROLL_AVATAR_BLUE`n")
	Data:=RegExReplace(Data,"iU)0x5060[ \t]+TROLL_AVATAR_GREEN[\n]","0x5060 GW_TROLL_AVATAR_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x5061[ \t]+TROLL_AVATAR_RED[\n]","0x5061 GW_TROLL_AVATAR_RED`n")
	Data:=RegExReplace(Data,"iU)0x5062[ \t]+COW_BLACK_AND_WHITE[\n]","0x5062 GW_COW_BLACK_AND_WHITE`n")
	Data:=RegExReplace(Data,"iU)0x5063[ \t]+COW_BROWN_AND_BLACK[\n]","0x5063 GW_COW_BROWN_AND_BLACK`n")
	Data:=RegExReplace(Data,"iU)0x5063[ \t]+COW_BROWN_AND_WHITE[\n]","0x5063 GW_COW_BROWN_AND_WHITE`n")
	Data:=RegExReplace(Data,"iU)0x5097[ \t]+JACKAL_GUARDIAN[\n]","0x5097 GW_JACKAL_GUARDIAN`n")
	Data:=RegExReplace(Data,"iU)0x5098[ \t]+ZOMBIE_GUARDIAN[\n]","0x5098 GW_ZOMBIE_GUARDIAN`n")
	Data:=RegExReplace(Data,"iU)0x50A2[ \t]+SAND_BEETLE_GIANT[\n]","0x50A2 GW_SAND_BEETLE_GIANT`n")
	Data:=RegExReplace(Data,"iU)0x50A3[ \t]+MAGGOT_GIANT_BLUE[\n]","0x50A3 GW_MAGGOT_GIANT_BLUE`n")
	Data:=RegExReplace(Data,"iU)0x50A4[ \t]+MAGGOT_GIANT_GREEN[\n]","0x50A4 GW_MAGGOT_GIANT_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x50A5[ \t]+MAGGOT_GIANT_RED[\n]","0x50A5 GW_MAGGOT_GIANT_RED`n")
	Data:=RegExReplace(Data,"iU)0x50A6[ \t]+MAGGOT_GIANT_BLACK[\n]","0x50A6 GW_MAGGOT_GIANT_BLACK`n")
	Data:=RegExReplace(Data,"iU)0x50A7[ \t]+MAGGOT_GIANT_BLACK_BLUE[\n]","0x50A7 GW_MAGGOT_GIANT_GOLDEN_BLUE`n")
	Data:=RegExReplace(Data,"iU)0x50A8[ \t]+MAGGOT_GIANT_BLACK_RED[\n]","0x50A8 GW_MAGGOT_GIANT_GOLDEN_RED`n")
	Data:=RegExReplace(Data,"iU)0x50A9[ \t]+MAGGOT_GIANT_BLACK_GOLD[\n]","0x50A9 GW_MAGGOT_GIANT_GOLD`n")
	Data:=RegExReplace(Data,"iU)0x50B7[ \t]+RAZOR_SPINE_GIANT[\n]","0x50B7 GW_RAZOR_SPINE_GIANT`n")
	Data:=RegExReplace(Data,"iU)0x50BE[ \t]+FROG_DEMON_GIANT[\n]","0x50BE GW_FROG_DEMON_GIANT`n")
	Data:=RegExReplace(Data,"iU)0x50BF[ \t]+FROG_DEMON_GIANT_BLUE[\n]","0x50BF GW_FROG_DEMON_GIANT_BLUE`n")
	Data:=RegExReplace(Data,"iU)0x50C0[ \t]+FROG_DEMON_GIANT_GREEN[\n]","0x50C0 GW_FROG_DEMON_GIANT_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x50C1[ \t]+FROG_DEMON_GIANT_PURPLE[\n]","0x50C1 GW_FROG_DEMON_GIANT_PURPLE`n")
	Data:=RegExReplace(Data,"iU)0x50C2[ \t]+FROG_DEMON_GIANT_RED[\n]","0x50C2 GW_FROG_DEMON_GIANT_RED`n")
	Data:=RegExReplace(Data,"iU)0x50C3[ \t]+FROG_DEMON_GIANT_YELLOW[\n]","0x50C3 GW_FROG_DEMON_GIANT_YELLOW`n")
	Data:=RegExReplace(Data,"iU)0x50D0[ \t]+LOLTH_AVATAR[\n]","0x50D0 GW_LOLTH_AVATAR`n")
	Data:=RegExReplace(Data,"iU)0x50D1[ \t]+DEMON_ANDARIEL[\n]","0x50D1 GW_DEMON_ANDARIEL`n")
	Data:=RegExReplace(Data,"iU)0x50D2[ \t]+DEMON_DIABLO[\n]","0x50D2 GW_DEMON_DIABLO`n")
	Data:=RegExReplace(Data,"iU)0x523D[ \t]+DARK_TREANT[\n]","0x523D TREANT_DARK`n")
	Data:=RegExReplace(Data,"iU)0x523D[ \t]+DARK_TREE[\n]","0x523D TREANT_DARK`n")
	Data:=RegExReplace(Data,"iU)0x5240[ \t]+HALF-DRAGON_BLACK[\n]","0x5240 HALFDRAGON_BLACK`n")
	Data:=RegExReplace(Data,"iU)0x5241[ \t]+HALF-DRAGON_RED[\n]","0x5241 HALFDRAGON_RED`n")
	Data:=RegExReplace(Data,"iU)0x5248[ \t]+YUAN-TI_HALFBREED[\n]","0x5248 YUAN-TI_HALF`n")
	Data:=RegExReplace(Data,"iU)0x5253[ \t]+GOBLINELITE_AXE_IWD[\n]","0x5253 GOBLINELITE_AXE_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x5254[ \t]+GOBLINELITE_BOW_IWD[\n]","0x5254 GOBLINELITE_BOW_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x5258[ \t]+GOBLIN_AXE_IWD[\n]","0x5258 GOBLIN_AXE_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x5259[ \t]+GOBLIN_BOW_IWD[\n]","0x5259 GOBLIN_BOW_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x525B[ \t]+KEG_1[\n]","0x525B KEG1`n")
	Data:=RegExReplace(Data,"iU)0x525C[ \t]+KEG_2[\n]","0x525C KEG2`n")
	Data:=RegExReplace(Data,"iU)0x525D[ \t]+KEG_3[\n]","0x525D KEG3`n")
	Data:=RegExReplace(Data,"iU)0x525F[ \t]+NEO-OROG_SHAMAN[\n]","0x525F OROG_SHAMAN`n")
	Data:=RegExReplace(Data,"iU)0x5262[ \t]+WORG_IWD[\n]","0x5262 WORG`n")
	Data:=RegExReplace(Data,"iU)0x5264[ \t]+SVIRFNEBLIN_PALE_NO_AXE[\n]","0x5264 SVIRFNEBLIN_PALE_NOAXE`n")
	Data:=RegExReplace(Data,"iU)0x5266[ \t]+SVIRFNEBLIN_DARK_NO_AXE[\n]","0x5266 SVIRFNEBLIN_DARK_NOAXE`n")
	Data:=RegExReplace(Data,"iU)0x526A[ \t]+SHADOW_1_MURKY[\n]","0x526A SHADOW_SMALL_MURKY`n")
	Data:=RegExReplace(Data,"iU)0x526B[ \t]+SHADOW_2_MURKY[\n]","0x526B SHADOW_LARGE_MURKY`n")
	Data:=RegExReplace(Data,"iU)0x5279[ \t]+ANIMATED_PLATE_1[\n]","0x5279 ANIMATED_PLATE_BRONZE_SMALL`n")
	Data:=RegExReplace(Data,"iU)0x5279[ \t]+ANIMATED_PLATE_BRONZE[\n]","0x5279 ANIMATED_PLATE_BRONZE_SMALL`n")
	Data:=RegExReplace(Data,"iU)0x527A[ \t]+ANIMATED_PLATE_2[\n]","0x527A ANIMATED_PLATE_DARK_SMALL`n")
	Data:=RegExReplace(Data,"iU)0x527A[ \t]+ANIMATED_PLATE_DARK[\n]","0x527A ANIMATED_PLATE_DARK_SMALL`n")
	Data:=RegExReplace(Data,"iU)0x527B[ \t]+ANIMATED_PLATE_3[\n]","0x527B ANIMATED_PLATE_GREEN_SMALL`n")
	Data:=RegExReplace(Data,"iU)0x527B[ \t]+ANIMATED_PLATE_GREEN[\n]","0x527B ANIMATED_PLATE_GREEN_SMALL`n")
	Data:=RegExReplace(Data,"iU)0x527D[ \t]+BARBARIAN_SHAMAN_1[\n]","0x527D BARBARIAN_SHAMAN_HAMMER`n")
	Data:=RegExReplace(Data,"iU)0x527E[ \t]+BARBARIAN_SHAMAN_2[\n]","0x527E BARBARIAN_SHAMAN_STAFF`n")
	Data:=RegExReplace(Data,"iU)0x527F[ \t]+BARBARIAN_SHAMAN_3[\n]","0x527F BARBARIAN_SHAMAN_CLUB`n")
	Data:=RegExReplace(Data,"iU)0x5280[ \t]+BARBARIAN_WARRIOR_1[\n]","0x5280 BARBARIAN_WARRIOR_TAN`n")
	Data:=RegExReplace(Data,"iU)0x5281[ \t]+BARBARIAN_WARRIOR_2[\n]","0x5281 BARBARIAN_WARRIOR_RED`n")
	Data:=RegExReplace(Data,"iU)0x5282[ \t]+BARBARIAN_WARRIOR_3[\n]","0x5282 BARBARIAN_WARRIOR_BROWN`n")
	Data:=RegExReplace(Data,"iU)0x528A[ \t]+SEER_IWD[\n]","0x528A SEER`n")
	Data:=RegExReplace(Data,"iU)0x528C[ \t]+UMBERHULK_VODYANOI[\n]","0x528C UMBER_HULK_VODYANOI`n")
	Data:=RegExReplace(Data,"iU)0x5291[ \t]+BOMBARDIER_BEETLE_NWN[\n]","0x5291 BEETLE_BOMBARDIER_NWN`n")
	Data:=RegExReplace(Data,"iU)0x5293[ \t]+PACKMULE[\n]","0x5293 PACK_MULE_WOW`n")
	Data:=RegExReplace(Data,"iU)0x5293[ \t]+PACKMULE_WOW[\n]","0x5293 PACK_MULE_WOW`n")
	Data:=RegExReplace(Data,"iU)0x5297[ \t]+HALFDRAGON_SILVER[\n]","0x5297 GW_HALFDRAGON_SILVER`n")
	Data:=RegExReplace(Data,"iU)0x5298[ \t]+OCTOPUS_TENTACLE[\n]","0x5298 GW_OCTOPUS_TENTACLE`n")
	Data:=RegExReplace(Data,"iU)0x52A1[ \t]+PIG[\n]","0x52A1 GW_PIG`n")
	Data:=RegExReplace(Data,"iU)0x52A2[ \t]+SHEEP[\n]","0x52A2 GW_SHEEP`n")
	Data:=RegExReplace(Data,"iU)0x52A3[ \t]+APE_BLACK[\n]","0x52A3 GW_APE_BLACK`n")
	Data:=RegExReplace(Data,"iU)0x52A4[ \t]+APE_BROWN[\n]","0x52A4 GW_APE_BROWN`n")
	Data:=RegExReplace(Data,"iU)0x52A5[ \t]+GARGOYLE[\n]","0x52A5 GW_GARGOYLE`n")
	Data:=RegExReplace(Data,"iU)0x52A6[ \t]+VARGOILLE[\n]","0x52A6 BONEBAT`n")
	Data:=RegExReplace(Data,"iU)0x52A7[ \t]+AMAZON_PRIESTESS_FLAIL[\n]","0x52A7 GW_AMAZON_PRIESTESS_FLAIL`n")
	Data:=RegExReplace(Data,"iU)0x52A8[ \t]+AMAZON_PRIESTESS_HAMMER[\n]","0x52A8 GW_AMAZON_PRIESTESS_HAMMER`n")
	Data:=RegExReplace(Data,"iU)0x52A9[ \t]+AMAZON_PRIESTESS_MACE[\n]","0x52A9 GW_AMAZON_PRIESTESS_MACE`n")
	Data:=RegExReplace(Data,"iU)0x52AA[ \t]+PYGMY_SHAMAN[\n]","0x52AA GW_PYGMY_SHAMAN`n")
	Data:=RegExReplace(Data,"iU)0x52C3[ \t]+DOOM_KNIGHT_PRIEST[\n]","0x52C3 GW_DOOM_KNIGHT_PRIEST`n")
	Data:=RegExReplace(Data,"iU)0x52C4[ \t]+DOOM_KNIGHT_PRIEST_COLD[\n]","0x52C4 GW_DOOM_KNIGHT_PRIEST_COLD`n")
	Data:=RegExReplace(Data,"iU)0x52C5[ \t]+DOOM_KNIGHT_PRIEST_FIRE[\n]","0x52C5 GW_DOOM_KNIGHT_PRIEST_FIRE`n")
	Data:=RegExReplace(Data,"iU)0x52C6[ \t]+DOOM_KNIGHT_PRIEST_POISON[\n]","0x52C6 GW_DOOM_KNIGHT_PRIEST_POISON`n")
	Data:=RegExReplace(Data,"iU)0x52C7[ \t]+DOOM_KNIGHT_PRIEST_UNHOLY[\n]","0x52C7 GW_DOOM_KNIGHT_PRIEST_UNHOLY`n")
	Data:=RegExReplace(Data,"iU)0x52C8[ \t]+DOOM_KNIGHT_MAGE[\n]","0x52C8 GW_DOOM_KNIGHT_MAGE`n")
	Data:=RegExReplace(Data,"iU)0x52C9[ \t]+DOOM_KNIGHT_MAGE_COLD[\n]","0x52C9 GW_DOOM_KNIGHT_MAGE_COLD`n")
	Data:=RegExReplace(Data,"iU)0x52CA[ \t]+DOOM_KNIGHT_MAGE_FIRE[\n]","0x52CA GW_DOOM_KNIGHT_MAGE_FIRE`n")
	Data:=RegExReplace(Data,"iU)0x52CB[ \t]+DOOM_KNIGHT_MAGE_POISON[\n]","0x52CB GW_DOOM_KNIGHT_MAGE_POISON`n")
	Data:=RegExReplace(Data,"iU)0x52CC[ \t]+PANTHER_WOMAN[\n]","0x52CC GW_PANTHER_WOMAN`n")
	Data:=RegExReplace(Data,"iU)0x52CD[ \t]+PANTHER_WOMAN_ELITE1[\n]","0x52CD GW_PANTHER_WOMAN_ELITE1`n")
	Data:=RegExReplace(Data,"iU)0x52CE[ \t]+PANTHER_WOMAN_ELITE2[\n]","0x52CE GW_PANTHER_WOMAN_ELITE2`n")
	Data:=RegExReplace(Data,"iU)0x52CF[ \t]+PANTHER_WOMAN_WHIP[\n]","0x52CF GW_PANTHER_WOMAN_WHIP`n")
	Data:=RegExReplace(Data,"iU)0x52D0[ \t]+PANTHER_WOMAN_WHIP_ELITE[\n]","0x52D0 GW_PANTHER_WOMAN_WHIP_ELITE`n")
	Data:=RegExReplace(Data,"iU)0x52D1[ \t]+PANTHER_WOMAN_CHIEF[\n]","0x52D1 GW_PANTHER_WOMAN_CHIEF`n")
	Data:=RegExReplace(Data,"iU)0x52D2[ \t]+PANTHER_WOMAN_RANGE[\n]","0x52D2 GW_PANTHER_WOMAN_RANGE`n")
	Data:=RegExReplace(Data,"iU)0x52D3[ \t]+PANTHER_WOMAN_RANGE_ELITE[\n]","0x52D3 GW_PANTHER_WOMAN_RANGE_ELITE`n")
	Data:=RegExReplace(Data,"iU)0x52D6[ \t]+MUMMY_PUTRID[\n]","0x52D6 GW_MUMMY_PUTRID`n")
	Data:=RegExReplace(Data,"iU)0x52D7[ \t]+LICH_FIRE[\n]","0x52D7 GW_LICH_FIRE`n")
	Data:=RegExReplace(Data,"iU)0x52D8[ \t]+GOATMAN_TWO_HANDED_AXE[\n]","0x52D8 GW_GOATMAN_TWO_HANDED_AXE`n")
	Data:=RegExReplace(Data,"iU)0x52D9[ \t]+GOATMAN_GREAT_MAUL[\n]","0x52D9 GW_GOATMAN_GREAT_MAUL`n")
	Data:=RegExReplace(Data,"iU)0x52DA[ \t]+SAND_BEETLE[\n]","0x52DA GW_SAND_BEETLE`n")
	Data:=RegExReplace(Data,"iU)0x52DB[ \t]+MAGGOT_BLUE[\n]","0x52DB GW_MAGGOT_BLUE`n")
	Data:=RegExReplace(Data,"iU)0x52DC[ \t]+MAGGOT_BLACK[\n]","0x52DC GW_MAGGOT_BLACK`n")
	Data:=RegExReplace(Data,"iU)0x52DD[ \t]+MAGGOT_RED[\n]","0x52DD GW_MAGGOT_RED`n")
	Data:=RegExReplace(Data,"iU)0x52DE[ \t]+MAGGOT_GOLD[\n]","0x52DE GW_MAGGOT_GOLD`n")
	Data:=RegExReplace(Data,"iU)0x52E7[ \t]+MAGGOT_EGG[\n]","0x52E7 GW_MAGGOT_EGG`n")
	Data:=RegExReplace(Data,"iU)0x52E8[ \t]+EVARD_TENTACLES[\n]","0x52E8 GW_EVARD_TENTACLES`n")
	Data:=RegExReplace(Data,"iU)0x52E9[ \t]+EVARD_FIRE_TENTACLES[\n]","0x52E9 GW_EVARD_FIRE_TENTACLES`n")
	Data:=RegExReplace(Data,"iU)0x52EA[ \t]+EVARD_BLACK_TENTACLES[\n]","0x52EA GW_EVARD_BLACK_TENTACLES`n")
	Data:=RegExReplace(Data,"iU)0x52EB[ \t]+PUTRID_DEFILER[\n]","0x52EB GW_PUTRID_DEFILER`n")
	Data:=RegExReplace(Data,"iU)0x52EC[ \t]+GOLEM_MECHANIC_BLUE[\n]","0x52EC GW_GOLEM_MECHANIC_BLUE`n")
	Data:=RegExReplace(Data,"iU)0x52ED[ \t]+GOLEM_MECHANIC_GREEN[\n]","0x52ED GW_GOLEM_MECHANIC_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x52EE[ \t]+GOLEM_MECHANIC_RED[\n]","0x52EE GW_GOLEM_MECHANIC_RED`n")
	Data:=RegExReplace(Data,"iU)0x52EF[ \t]+SPIDER_MECHANIC[\n]","0x52EF GW_SPIDER_MECHANIC`n")
	Data:=RegExReplace(Data,"iU)0x52F0[ \t]+SPIDER_MECHANIC_GREEN[\n]","0x52F0 GW_SPIDER_MECHANIC_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x52F1[ \t]+SPIDER_MECHANIC_RED[\n]","0x52F1 GW_SPIDER_MECHANIC_RED`n")
	Data:=RegExReplace(Data,"iU)0x52F2[ \t]+SPIDER_MECHANIC_YELLOW[\n]","0x52F2 GW_SPIDER_MECHANIC_YELLOW`n")
	Data:=RegExReplace(Data,"iU)0x52F3[ \t]+RAZOR_SPINE[\n]","0x52F3 GW_RAZOR_SPINE`n")
	Data:=RegExReplace(Data,"iU)0x52F5[ \t]+FROG_DEMON[\n]","0x52F5 GW_FROG_DEMON`n")
	Data:=RegExReplace(Data,"iU)0x52F6[ \t]+FROG_DEMON_BLUE[\n]","0x52F6 GW_FROG_DEMON_BLUE`n")
	Data:=RegExReplace(Data,"iU)0x52F7[ \t]+FROG_DEMON_GREEN[\n]","0x52F7 GW_FROG_DEMON_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x52F8[ \t]+FROG_DEMON_PURPLE[\n]","0x52F8 GW_FROG_DEMON_PURPLE`n")
	Data:=RegExReplace(Data,"iU)0x52F9[ \t]+FROG_DEMON_RED[\n]","0x52F9 GW_FROG_DEMON_RED`n")
	Data:=RegExReplace(Data,"iU)0x52FA[ \t]+FROG_DEMON_YELLOW[\n]","0x52FA GW_FROG_DEMON_YELLOW`n")
	Data:=RegExReplace(Data,"iU)0x5301[ \t]+BAT_DEMON[\n]","0x5301 GW_BAT_DEMON`n")
	Data:=RegExReplace(Data,"iU)0x5302[ \t]+BAT_DEMON_BLACK[\n]","0x5302 GW_BAT_DEMON_BLACK`n")
	Data:=RegExReplace(Data,"iU)0x5303[ \t]+BAT_DEMON_BLUE[\n]","0x5303 GW_BAT_DEMON_BLUE`n")
	Data:=RegExReplace(Data,"iU)0x5304[ \t]+BAT_DEMON_FIRE[\n]","0x5304 GW_BAT_DEMON_FIRE`n")
	Data:=RegExReplace(Data,"iU)0x5305[ \t]+BAT_DEMON_SMALL[\n]","0x5305 GW_BAT_DEMON_SMALL`n")
	Data:=RegExReplace(Data,"iU)0x5306[ \t]+IMP_GREMLIN[\n]","0x5306 GW_IMP_GREMLIN`n")
	Data:=RegExReplace(Data,"iU)0x5307[ \t]+IMP_GREMLIN_BLUE[\n]","0x5307 GW_IMP_GREMLIN_BLUE`n")
	Data:=RegExReplace(Data,"iU)0x5308[ \t]+IMP_GREMLIN_GREEN[\n]","0x5308 GW_IMP_GREMLIN_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x5309[ \t]+IMP_GREMLIN_RED[\n]","0x5309 GW_IMP_GREMLIN_RED`n")
	Data:=RegExReplace(Data,"iU)0x530A[ \t]+SUCCUBUS[\n]","0x530A GW_SUCCUBUS`n")
	Data:=RegExReplace(Data,"iU)0x530B[ \t]+SUCCUBUS_WITCH[\n]","0x530B GW_SUCCUBUS_WITCH`n")
	Data:=RegExReplace(Data,"iU)0x530C[ \t]+SUCCUBUS_SEXY[\n]","0x530C GW_SUCCUBUS_SEXY`n")
	Data:=RegExReplace(Data,"iU)0x5310[ \t]+DEMON_IZUAL[\n]","0x5310 GW_DEMON_IZUAL`n")
	Data:=RegExReplace(Data,"iU)0x5311[ \t]+DEMON_MEPHISTO[\n]","0x5311 GW_DEMON_MEPHISTO`n")
	Data:=RegExReplace(Data,"iU)0x5312[ \t]+MEGADEMON[\n]","0x5312 GW_MEGA_DEMON`n")
	Data:=RegExReplace(Data,"iU)0x5313[ \t]+MEGADEMON_FLAMBERGE[\n]","0x5313 GW_MEGA_DEMON_FLAMBERGE`n")
	Data:=RegExReplace(Data,"iU)0x5314[ \t]+MEGADEMON_SCYTHE[\n]","0x5314 GW_MEGA_DEMON_SCYTHE`n")
	Data:=RegExReplace(Data,"iU)0x5315[ \t]+MEGADEMON_SWORD[\n]","0x5315 GW_MEGA_DEMON_SWORD`n")
	Data:=RegExReplace(Data,"iU)0x5316[ \t]+MEGADEMON_WAR_AXE[\n]","0x5316 GW_MEGA_DEMON_WAR_AXE`n")
	Data:=RegExReplace(Data,"iU)0x5317[ \t]+WERERAT_MANTUOCK_PST[\n]","0x5317 GW_WERERAT_MANTUOCK_PST`n")
	Data:=RegExReplace(Data,"iU)0x5318[ \t]+WERERAT_BLUE_PST[\n]","0x5318 GW_WERERAT_BLUE_PST`n")
	Data:=RegExReplace(Data,"iU)0x5319[ \t]+WERERAT_GREEN_PST[\n]","0x5319 GW_WERERAT_GREEN_PST`n")
	Data:=RegExReplace(Data,"iU)0x531A[ \t]+WERERAT_OCHRE_PST[\n]","0x531A GW_WERERAT_OCHRE_PST`n")
	Data:=RegExReplace(Data,"iU)0x531B[ \t]+WERERAT_DARK_OCHRE_PST[\n]","0x531B GW_WERERAT_DARK_OCHRE_PST`n")
	Data:=RegExReplace(Data,"iU)0x531C[ \t]+WERERAT_YELLOW_PST[\n]","0x531C GW_WERERAT_YELLOW_PST`n")
	Data:=RegExReplace(Data,"iU)0x531D[ \t]+WERERAT_GIANT_BLUE_PST[\n]","0x531D GW_WERERAT_GIANT_BLUE_PST`n")
	Data:=RegExReplace(Data,"iU)0x531E[ \t]+WERERAT_GIANT_GREEN_PST[\n]","0x531E GW_WERERAT_GIANT_GREEN_PST`n")
	Data:=RegExReplace(Data,"iU)0x531F[ \t]+WERERAT_GIANT_OCHRE_PST[\n]","0x531F GW_WERERAT_GIANT_OCHRE_PST`n")
	Data:=RegExReplace(Data,"iU)0x5320[ \t]+WERERAT_GIANT_DARK_OCHRE_PST[\n]","0x5320 GW_WERERAT_GIANT_DARK_OCHRE_PST`n")
	Data:=RegExReplace(Data,"iU)0x5321[ \t]+WERERAT_GIANT_YELLOW_PST[\n]","0x5321 GW_WERERAT_GIANT_YELLOW_PST`n")
	Data:=RegExReplace(Data,"iU)0x5322[ \t]+BLADE_CREEPER[\n]","0x5322 GW_BLADE_CREEPER`n")
	Data:=RegExReplace(Data,"iU)0x5328[ \t]+ANIMATED_PLATE_BRONZE_LARGE[\n]","0x5328 ANIMATED_PLATE_BRONZE`n")
	Data:=RegExReplace(Data,"iU)0x5329[ \t]+ANIMATED_PLATE_DARK_LARGE[\n]","0x5329 ANIMATED_PLATE_DARK`n")
	Data:=RegExReplace(Data,"iU)0x532A[ \t]+ANIMATED_PLATE_GREEN_LARGE[\n]","0x532A ANIMATED_PLATE_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x5338[ \t]+HYDRA[\n]","0x5338 GW_HYDRA_FIRE`n")
	Data:=RegExReplace(Data,"iU)0x547D[ \t]+GUARD1_GLAIVE_D2[\n]","0x547D GW_GUARD1_GLAIVE_D2`n")
	Data:=RegExReplace(Data,"iU)0x547E[ \t]+GUARD1_SPEAR_D2[\n]","0x547E GW_GUARD1_SPEAR_D2`n")
	Data:=RegExReplace(Data,"iU)0x547F[ \t]+GUARD2_GLAIVE_D2[\n]","0x547F GW_GUARD2_GLAIVE_D2`n")
	Data:=RegExReplace(Data,"iU)0x5480[ \t]+GUARD2_SPEAR_D2[\n]","0x5480 GW_GUARD2_SPEAR_D2`n")
	Data:=RegExReplace(Data,"iU)0x5481[ \t]+SNAKE_SEA[\n]","0x5481 GW_SNAKE_SEA`n")
	Data:=RegExReplace(Data,"iU)0x5482[ \t]+JELLYFISH_BLUE[\n]","0x5482 GW_JELLYFISH_BLUE`n")
	Data:=RegExReplace(Data,"iU)0x5483[ \t]+JELLYFISH_GREEN[\n]","0x5483 GW_JELLYFISH_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x5484[ \t]+JELLYFISH_PURPLE[\n]","0x5484 GW_JELLYFISH_PURPLE`n")
	Data:=RegExReplace(Data,"iU)0x5485[ \t]+JELLYFISH_YELLOW[\n]","0x5485 GW_JELLYFISH_YELLOW`n")
	Data:=RegExReplace(Data,"iU)0x5486[ \t]+JELLYFISH_BLUE_LARGE[\n]","0x5486 GW_JELLYFISH_BLUE_LARGE`n")
	Data:=RegExReplace(Data,"iU)0x5487[ \t]+JELLYFISH_GREEN_LARGE[\n]","0x5487 GW_JELLYFISH_GREEN_LARGE`n")
	Data:=RegExReplace(Data,"iU)0x5488[ \t]+JELLYFISH_PURPLE_LARGE[\n]","0x5488 GW_JELLYFISH_PURPLE_LARGE`n")
	Data:=RegExReplace(Data,"iU)0x5489[ \t]+JELLYFISH_YELLOW_LARGE[\n]","0x5489 GW_JELLYFISH_YELLOW_LARGE`n")
	Data:=RegExReplace(Data,"iU)0x548A[ \t]+GUARD_ZEALOT_AXE[\n]","0x548A GW_GUARD_ZEALOT_AXE`n")
	Data:=RegExReplace(Data,"iU)0x548B[ \t]+GUARD_ZEALOT_VOULGE[\n]","0x548B GW_GUARD_ZEALOT_VOULGE`n")
	Data:=RegExReplace(Data,"iU)0x548C[ \t]+GUARD_ZEALOT_POLEAXE[\n]","0x548C GW_GUARD_ZEALOT_POLEAXE`n")
	Data:=RegExReplace(Data,"iU)0x548D[ \t]+GUARD_ZEALOT_SCYTHE[\n]","0x548D GW_GUARD_ZEALOT_SCYTHE`n")
	Data:=RegExReplace(Data,"iU)0x548E[ \t]+CHICKEN_WHITE[\n]","0x548E GW_CHICKEN_WHITE`n")
	Data:=RegExReplace(Data,"iU)0x548F[ \t]+CHICKEN_GREY[\n]","0x548F GW_CHICKEN_GREY`n")
	Data:=RegExReplace(Data,"iU)0x5490[ \t]+CHICKEN_BLACK[\n]","0x5490 GW_CHICKEN_BLACK`n")
	Data:=RegExReplace(Data,"iU)0x5491[ \t]+RAT_PST[\n]","0x5491 GW_RAT_WILD_PST`n")
	Data:=RegExReplace(Data,"iU)0x5491[ \t]+RAT_WILD[\n]","0x5491 GW_RAT_WILD_PST`n")
	Data:=RegExReplace(Data,"iU)0x5492[ \t]+MOSQUITO_GIANT[\n]","0x5492 GW_MOSQUITO_GIANT`n")
	Data:=RegExReplace(Data,"iU)0x5493[ \t]+VULTURE_DEMON[\n]","0x5493 GW_VULTURE_DEMON`n")
	Data:=RegExReplace(Data,"iU)0x5494[ \t]+MINOTAUR_ARMOR_2_AXES[\n]","0x5494 GW_MINOTAUR_ARMOR_2_AXES`n")
	Data:=RegExReplace(Data,"iU)0x5495[ \t]+MINOTAUR_ARMOR_2_FLAILS[\n]","0x5495 GW_MINOTAUR_ARMOR_2_FLAILS`n")
	Data:=RegExReplace(Data,"iU)0x5496[ \t]+MINOTAUR_ARMOR_AXE_AND_FLAIL[\n]","0x5496 GW_MINOTAUR_ARMOR_AXE_AND_FLAIL`n")
	Data:=RegExReplace(Data,"iU)0x5497[ \t]+MINOTAUR_2_AXES[\n]","0x5497 GW_MINOTAUR_2_AXES`n")
	Data:=RegExReplace(Data,"iU)0x5498[ \t]+MINOTAUR_2_FLAILS[\n]","0x5498 GW_MINOTAUR_2_FLAILS`n")
	Data:=RegExReplace(Data,"iU)0x5499[ \t]+MINOTAUR_AXE_AND_FLAIL[\n]","0x5499 GW_MINOTAUR_AXE_AND_FLAIL`n")
	Data:=RegExReplace(Data,"iU)0x549A[ \t]+AMAZON_SCIMITAR[\n]","0x549A GW_AMAZON_SCIMITAR`n")
	Data:=RegExReplace(Data,"iU)0x549B[ \t]+AMAZON_FALCHION[\n]","0x549B GW_AMAZON_FALCHION`n")
	Data:=RegExReplace(Data,"iU)0x549C[ \t]+AMAZON_SABER[\n]","0x549C GW_AMAZON_SABER`n")
	Data:=RegExReplace(Data,"iU)0x549D[ \t]+AMAZON_AXE[\n]","0x549D GW_AMAZON_AXE`n")
	Data:=RegExReplace(Data,"iU)0x549E[ \t]+AMAZON_PIKE[\n]","0x549E GW_AMAZON_PIKE`n")
	Data:=RegExReplace(Data,"iU)0x549F[ \t]+AMAZON_TRIDENT[\n]","0x549F GW_AMAZON_TRIDENT`n")
	Data:=RegExReplace(Data,"iU)0x54A0[ \t]+AMAZON_NOVICE[\n]","0x54A0 GW_AMAZON_NOVICE`n")
	Data:=RegExReplace(Data,"iU)0x54A1[ \t]+AMAZON_ARCHER[\n]","0x54A1 GW_AMAZON_ARCHER`n")
	Data:=RegExReplace(Data,"iU)0x54A2[ \t]+PYGMY[\n]","0x54A2 GW_PYGMY`n")
	Data:=RegExReplace(Data,"iU)0x54A3[ \t]+PYGMY_BLOWPIPE[\n]","0x54A3 GW_PYGMY_BLOWPIPE`n")
	Data:=RegExReplace(Data,"iU)0x54A4[ \t]+DOOM_KNIGHT[\n]","0x54A4 GW_DOOM_KNIGHT`n")
	Data:=RegExReplace(Data,"iU)0x54A5[ \t]+DOOM_KNIGHT_ONE_ARMED[\n]","0x54A5 GW_DOOM_KNIGHT_ONE_ARMED`n")
	Data:=RegExReplace(Data,"iU)0x54A6[ \t]+DOOM_KNIGHT_BEHEADED[\n]","0x54A6 GW_DOOM_KNIGHT_BEHEADED`n")
	Data:=RegExReplace(Data,"iU)0x54A7[ \t]+DOOM_KNIGHT_RIPPED_OUT[\n]","0x54A7 GW_DOOM_KNIGHT_RIPPED_OUT`n")
	Data:=RegExReplace(Data,"iU)0x54A8[ \t]+REANIMATED_HORDE[\n]","0x54A8 GW_REANIMATED_HORDE`n")
	Data:=RegExReplace(Data,"iU)0x54A9[ \t]+REANIMATED_HORDE_BEHEADED[\n]","0x54A9 GW_REANIMATED_HORDE_BEHEADED`n")
	Data:=RegExReplace(Data,"iU)0x54AA[ \t]+DEMON_BABOON[\n]","0x54AA GW_DEMON_BABOON`n")
	Data:=RegExReplace(Data,"iU)0x54AB[ \t]+BAURIER_BROWN_PST[\n]","0x54AB GW_BAURIER_BROWN_PST`n")
	Data:=RegExReplace(Data,"iU)0x54AC[ \t]+BAURIER_CHESTNUT_PST[\n]","0x54AC GW_BAURIER_CHESTNUT_PST`n")
	Data:=RegExReplace(Data,"iU)0x54AD[ \t]+BAURIER_WHITE_PST[\n]","0x54AD GW_BAURIER_WHITE_PST`n")
	Data:=RegExReplace(Data,"iU)0x557C[ \t]+THORNED_HULK1[\n]","0x557C GW_THORNED_HULK1`n")
	Data:=RegExReplace(Data,"iU)0x557D[ \t]+THORNED_HULK2[\n]","0x557D GW_THORNED_HULK2`n")
	Data:=RegExReplace(Data,"iU)0x557E[ \t]+THORNED_HULK3[\n]","0x557E GW_THORNED_HULK3`n")
	Data:=RegExReplace(Data,"iU)0x557F[ \t]+THORNED_HULK4[\n]","0x557F GW_THORNED_HULK4`n")
	Data:=RegExReplace(Data,"iU)0x5580[ \t]+THORNED_HULK5[\n]","0x5580 GW_THORNED_HULK5`n")
	Data:=RegExReplace(Data,"iU)0x5581[ \t]+SNOW_YETI[\n]","0x5581 GW_SNOW_YETI`n")
	Data:=RegExReplace(Data,"iU)0x5582[ \t]+REGURGITATOR[\n]","0x5582 GW_REGURGITATOR`n")
	Data:=RegExReplace(Data,"iU)0x5583[ \t]+MOSQUITO_NEST[\n]","0x5583 GW_MOSQUITO_NEST`n")
	Data:=RegExReplace(Data,"iU)0x5584[ \t]+SIEGE_BEAST[\n]","0x5584 GW_SIEGE_BEAST`n")
	Data:=RegExReplace(Data,"iU)0x5585[ \t]+DEMON_DURIEL[\n]","0x5585 GW_DEMON_DURIEL`n")
	Data:=RegExReplace(Data,"iU)0x5B00[ \t]+ELLESIME_WHITE-HAIRED[\n]","0x5B00 ELLESIME_WHITE`n")
	Data:=RegExReplace(Data,"iU)0x5B09[ \t]+ANNIS[\n]","0x5B09 HAG_ANNIS`n")
	Data:=RegExReplace(Data,"iU)0x5B0A[ \t]+NIGHT_HAG[\n]","0x5B0A HAG_NIGHT`n")
	Data:=RegExReplace(Data,"iU)0x5B0B[ \t]+GREEN_HAG[\n]","0x5B0B HAG_GREEN`n")
	Data:=RegExReplace(Data,"iU)0x5B0C[ \t]+SEA_HAG[\n]","0x5B0C HAG_SEA`n")
	Data:=RegExReplace(Data,"iU)0x5B28[ \t]+DESTRIER_BLACK_AND_WHITE[\n]","0x5B28 GW_DESTRIER_BLACK_AND_WHITE`n")
	Data:=RegExReplace(Data,"iU)0x5C01[ \t]+FIRE_GIANT_2[\n]","0x5C01 GIANT_FIRE_2`n")
	Data:=RegExReplace(Data,"iU)0x5C03[ \t]+FIRE_GIANT_FEMALE[\n]","0x5C03 GIANT_FIRE_FEMALE`n")
	Data:=RegExReplace(Data,"iU)0x5C04[ \t]+FROST_GIANT_FEMALE[\n]","0x5C04 GIANT_FROST_FEMALE`n")
	Data:=RegExReplace(Data,"iU)0x5D4C[ \t]+CURST_TOWNIE_FEMALE_PST[\n]","0x5D4C TOWNIE_CURST_FEMALE_PST`n")
	Data:=RegExReplace(Data,"iU)0x5D4D[ \t]+CURST_TOWNIE_MALE_PST[\n]","0x5D4D TOWNIE_CURST_MALE_PST`n")
	Data:=RegExReplace(Data,"iU)0x5D54[ \t]+LARGE_THUG_PST[\n]","0x5D54 THUG_LARGE_PST`n")
	Data:=RegExReplace(Data,"iU)0x5D55[ \t]+LOWER_CLASS_TOWNIE_FEMALE_PST[\n]","0x5D55 TOWNIE_LOWER_CLASS_FEMALE_PST`n")
	Data:=RegExReplace(Data,"iU)0x5D56[ \t]+LOWER_CLASS_TOWNIE_MALE_PST[\n]","0x5D56 TOWNIE_LOWER_CLASS_MALE_PST`n")
	Data:=RegExReplace(Data,"iU)0x5D59[ \t]+PROSTITUTE_PST[\n]","0x5D59 HARLOT_PST`n")
	Data:=RegExReplace(Data,"iU)0x5D61[ \t]+UPPER_CLASS_TOWNIE_FEMALE_PST[\n]","0x5D61 TOWNIE_UPPER_CLASS_FEMALE_PST`n")
	Data:=RegExReplace(Data,"iU)0x5D62[ \t]+UPPER_CLASS_TOWNIE_MALE_PST[\n]","0x5D62 TOWNIE_UPPER_CLASS_MALE_PST`n")
	Data:=RegExReplace(Data,"iU)0x5FC4[ \t]+GOLEM_AMBER[\n]","0x5FC4 GW_GOLEM_AMBER`n")
	Data:=RegExReplace(Data,"iU)0x5FC5[ \t]+UNICORN_WHITE[\n]","0x5FC5 GW_UNICORN_WHITE`n")
	Data:=RegExReplace(Data,"iU)0x5FC6[ \t]+UNICORN_BLACK[\n]","0x5FC6 GW_UNICORN_BLACK`n")
	Data:=RegExReplace(Data,"iU)0x5FC7[ \t]+UNICORN_NIGHTMARE[\n]","0x5FC7 GW_UNICORN_NIGHTMARE`n")
	Data:=RegExReplace(Data,"iU)0x5FC8[ \t]+HORSE_BLACK_AND_WHITE[\n]","0x5FC8 GW_HORSE_BLACK_AND_WHITE`n")
	Data:=RegExReplace(Data,"iU)0x5FC9[ \t]+HORSE_BAIE[\n]","0x5FC9 GW_HORSE_BAIE`n")
	Data:=RegExReplace(Data,"iU)0x5FCA[ \t]+HORSE_CHESTNUT[\n]","0x5FCA GW_HORSE_CHESTNUT`n")
	Data:=RegExReplace(Data,"iU)0x5FCB[ \t]+HORSE_BLANKET_BAIE[\n]","0x5FCB GW_HORSE_BLANKET_BAIE`n")
	Data:=RegExReplace(Data,"iU)0x5FCC[ \t]+HORSE_GRULLO[\n]","0x5FCC GW_HORSE_GRULLO`n")
	Data:=RegExReplace(Data,"iU)0x5FCD[ \t]+HORSE_BLUE_ROANNED[\n]","0x5FCD GW_HORSE_BLUE_ROANNED`n")
	Data:=RegExReplace(Data,"iU)0x5FCE[ \t]+WAR_HORSE_BAIE[\n]","0x5FCE GW_WAR_HORSE_BAIE`n")
	Data:=RegExReplace(Data,"iU)0x5FCF[ \t]+WAR_HORSE_BAIE_AND_WHITE[\n]","0x5FCF GW_WAR_HORSE_BAIE_AND_WHITE`n")
	Data:=RegExReplace(Data,"iU)0x5FD0[ \t]+WAR_HORSE_BLACK[\n]","0x5FD0 GW_WAR_HORSE_BLACK`n")
	Data:=RegExReplace(Data,"iU)0x5FD1[ \t]+WAR_HORSE_GREY[\n]","0x5FD1 GW_WAR_HORSE_GREY`n")
	Data:=RegExReplace(Data,"iU)0x5FD2[ \t]+TROLL_DARKNESS[\n]","0x5FD2 GW_TROLL_DARKNESS`n")
	Data:=RegExReplace(Data,"iU)0x5FD3[ \t]+TROLL_SMALL_DARKNESS[\n]","0x5FD3 GW_TROLL_SMALL_DARKNESS`n")
	Data:=RegExReplace(Data,"iU)0x6410[ \t]+L_CLERIC_MALE_HUMAN[\n]","0x6410 CLERIC_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6411[ \t]+L_CLERIC_FEMALE_HUMAN[\n]","0x6411 CLERIC_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6412[ \t]+L_CLERIC_MALE_ELF[\n]","0x6412 CLERIC_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6413[ \t]+L_CLERIC_FEMALE_ELF[\n]","0x6413 CLERIC_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6414[ \t]+L_CLERIC_MALE_DWARF[\n]","0x6414 CLERIC_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6415[ \t]+L_CLERIC_FEMALE_DWARF[\n]","0x6415 CLERIC_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6416[ \t]+L_CLERIC_MALE_HALFLING[\n]","0x6416 CLERIC_MALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6417[ \t]+L_CLERIC_FEMALE_HALFLING[\n]","0x6417 CLERIC_FEMALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6420[ \t]+L_FIGHTER_MALE_HUMAN[\n]","0x6420 FIGHTER_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6421[ \t]+L_FIGHTER_FEMALE_HUMAN[\n]","0x6421 FIGHTER_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6422[ \t]+L_FIGHTER_MALE_ELF[\n]","0x6422 FIGHTER_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6423[ \t]+L_FIGHTER_FEMALE_ELF[\n]","0x6423 FIGHTER_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6424[ \t]+L_FIGHTER_MALE_DWARF[\n]","0x6424 FIGHTER_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6425[ \t]+L_FIGHTER_FEMALE_DWARF[\n]","0x6425 FIGHTER_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6426[ \t]+L_FIGHTER_MALE_HALFLING[\n]","0x6426 FIGHTER_MALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6427[ \t]+L_FIGHTER_FEMALE_HALFLING[\n]","0x6427 FIGHTER_FEMALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6430[ \t]+L_MAGE_MALE_HUMAN[\n]","0x6430 MAGE_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6431[ \t]+L_MAGE_FEMALE_HUMAN[\n]","0x6431 MAGE_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6432[ \t]+L_MAGE_MALE_ELF[\n]","0x6432 MAGE_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6433[ \t]+L_MAGE_FEMALE_ELF[\n]","0x6433 MAGE_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6434[ \t]+L_MAGE_MALE_DWARF[\n]","0x6434 MAGE_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6435[ \t]+L_MAGE_FEMALE_DWARF[\n]","0x6435 MAGE_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6440[ \t]+L_THIEF_MALE_HUMAN[\n]","0x6440 THIEF_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6441[ \t]+L_THIEF_FEMALE_HUMAN[\n]","0x6441 THIEF_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6442[ \t]+L_THIEF_MALE_ELF[\n]","0x6442 THIEF_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6443[ \t]+L_THIEF_FEMALE_ELF[\n]","0x6443 THIEF_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6444[ \t]+L_THIEF_MALE_DWARF[\n]","0x6444 THIEF_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6445[ \t]+L_THIEF_FEMALE_DWARF[\n]","0x6445 THIEF_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6446[ \t]+L_THIEF_MALE_HALFLING[\n]","0x6446 THIEF_MALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6447[ \t]+L_THIEF_FEMALE_HALFLING[\n]","0x6447 THIEF_FEMALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6410[ \t]+CLERIC_MALE_HUMAN_LOW[\n]","0x6410 CLERIC_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6411[ \t]+CLERIC_FEMALE_HUMAN_LOW[\n]","0x6411 CLERIC_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6412[ \t]+CLERIC_MALE_ELF_LOW[\n]","0x6412 CLERIC_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6413[ \t]+CLERIC_FEMALE_ELF_LOW[\n]","0x6413 CLERIC_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6414[ \t]+CLERIC_MALE_DWARF_LOW[\n]","0x6414 CLERIC_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6415[ \t]+CLERIC_FEMALE_DWARF_LOW[\n]","0x6415 CLERIC_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6416[ \t]+CLERIC_MALE_HALFLING_LOW[\n]","0x6416 CLERIC_MALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6417[ \t]+CLERIC_FEMALE_HALFLING_LOW[\n]","0x6417 CLERIC_FEMALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6420[ \t]+FIGHTER_MALE_HUMAN_LOW[\n]","0x6420 FIGHTER_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6421[ \t]+FIGHTER_FEMALE_HUMAN_LOW[\n]","0x6421 FIGHTER_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6422[ \t]+FIGHTER_MALE_ELF_LOW[\n]","0x6422 FIGHTER_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6423[ \t]+FIGHTER_FEMALE_ELF_LOW[\n]","0x6423 FIGHTER_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6424[ \t]+FIGHTER_MALE_DWARF_LOW[\n]","0x6424 FIGHTER_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6425[ \t]+FIGHTER_FEMALE_DWARF_LOW[\n]","0x6425 FIGHTER_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6426[ \t]+FIGHTER_MALE_HALFLING_LOW[\n]","0x6426 FIGHTER_MALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6427[ \t]+FIGHTER_FEMALE_HALFLING_LOW[\n]","0x6427 FIGHTER_FEMALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6430[ \t]+MAGE_MALE_HUMAN_LOW[\n]","0x6430 MAGE_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6431[ \t]+MAGE_FEMALE_HUMAN_LOW[\n]","0x6431 MAGE_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6432[ \t]+MAGE_MALE_ELF_LOW[\n]","0x6432 MAGE_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6433[ \t]+MAGE_FEMALE_ELF_LOW[\n]","0x6433 MAGE_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6434[ \t]+MAGE_MALE_DWARF_LOW[\n]","0x6434 MAGE_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6435[ \t]+MAGE_FEMALE_DWARF_LOW[\n]","0x6435 MAGE_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6440[ \t]+THIEF_MALE_HUMAN_LOW[\n]","0x6440 THIEF_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6441[ \t]+THIEF_FEMALE_HUMAN_LOW[\n]","0x6441 THIEF_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6442[ \t]+THIEF_MALE_ELF_LOW[\n]","0x6442 THIEF_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6443[ \t]+THIEF_FEMALE_ELF_LOW[\n]","0x6443 THIEF_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6444[ \t]+THIEF_MALE_DWARF_LOW[\n]","0x6444 THIEF_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6445[ \t]+THIEF_FEMALE_DWARF_LOW[\n]","0x6445 THIEF_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6446[ \t]+THIEF_MALE_HALFLING_LOW[\n]","0x6446 THIEF_MALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)0x6447[ \t]+THIEF_FEMALE_HALFLING_LOW[\n]","0x6447 THIEF_FEMALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)0x683D[ \t]+MOINESSE_MALE_HUMAN_BARBARIAN_1[\n]","0x683D MOINESSE_BARBARIAN_MALE_HUMAN`n")
	Data:=RegExReplace(Data,"iU)0x683E[ \t]+MOINESSE_MALE_HUMAN_NINJA_1[\n]","0x683E MOINESSE_NINJA_MALE_HUMAN`n")
	Data:=RegExReplace(Data,"iU)0x683F[ \t]+MOINESSE_MALE_EX-HUMAN_VAMPIRE_1[\n]","0x683F MOINESSE_VAMPIRE`n")
	Data:=RegExReplace(Data,"iU)0x6841[ \t]+MOINESSE_FEMALE_ELF_MAGE_1[\n]","0x6841 MOINESSE_MAGE_FEMALE_ELF`n")
	Data:=RegExReplace(Data,"iU)0x6845[ \t]+MOINESSE_FEMALE_HUMAN_DRUID_4[\n]","0x6845 MOINESSE_DRUID_FEMALE_HUMAN`n")
	Data:=RegExReplace(Data,"iU)0x6846[ \t]+MOINESSE_FEMALE_HUMAN_FIGHTER_4[\n]","0x6846 MOINESSE_FIGHTER_FEMALE_HUMAN`n")
	Data:=RegExReplace(Data,"iU)0x6847[ \t]+MOINESSE_FEMALE_HUMAN_MAGE_3[\n]","0x6847 MOINESSE_MAGE_FEMALE_HUMAN`n")
	Data:=RegExReplace(Data,"iU)0x6848[ \t]+MOINESSE_FEMALE_HUMAN_THIEF_1[\n]","0x6848 MOINESSE_THIEF_FEMALE_HUMAN`n")
	Data:=RegExReplace(Data,"iU)0x7000[ \t]+OGRE_HALF[\n]","0x7000 HALF_OGRE`n")
	Data:=RegExReplace(Data,"iU)0x7701[ \t]+GHOUL_REVEANT[\n]","0x7701 REVENANT`n")
	Data:=RegExReplace(Data,"iU)0x7701[ \t]+REVEANT[\n]","0x7701 REVENANT`n")
	Data:=RegExReplace(Data,"iU)0x7702[ \t]+GHOUL_GHAST[\n]","0x7702 GHAST`n")
	Data:=RegExReplace(Data,"iU)0x7703[ \t]+GHOUL_SHADOW[\n]","0x7703 SHADOW`n")
	Data:=RegExReplace(Data,"iU)0x7B04[ \t]+WOLF_VAMPIRE[\n]","0x7B04 WOLF_VAMPIRIC`n")
	Data:=RegExReplace(Data,"iU)0x7F09[ \t]+SAHAUGIN[\n]","0x7F09 SAHUAGIN`n")
	Data:=RegExReplace(Data,"iU)0x7F23[ \t]+SAHAUGIN_LARGE[\n]","0x7F23 SAHUAGIN_LARGE`n")
	Data:=RegExReplace(Data,"iU)0x7F2C[ \t]+AMISH_SOLDIER[\n]","0x7F2C AMNIAN_SOLDIER`n")
	Data:=RegExReplace(Data,"iU)0x7F2C[ \t]+AMNISH_SOLDIER[\n]","0x7F2C AMNIAN_SOLDIER`n")
	Data:=RegExReplace(Data,"iU)0x7F3A[ \t]+HULA_WIZARD[\n]","0x7F3A IRENICUS_ROBED`n")
	Data:=RegExReplace(Data,"iU)0x7F3C[ \t]+ANTISOLAR[\n]","0x7F3C DEVA_MONADIC`n")
	Data:=RegExReplace(Data,"iU)0x7F3E[ \t]+FIRE_GIANT[\n]","0x7F3E GIANT_FIRE`n")
	Data:=RegExReplace(Data,"iU)0x7F3F[ \t]+FIRE_GIANT_YAGA_SHURA[\n]","0x7F3F GIANT_YAGA-SHURA`n")
	Data:=RegExReplace(Data,"iU)0xA100[ \t]+CARRIONCRAWLER[\n]","0xA100 CARRION_CRAWLER`n")
	Data:=RegExReplace(Data,"iU)0xA101[ \t]+SHARK_LEOPARD[\n]","0xA101 GW_SHARK_LEOPARD`n")
	Data:=RegExReplace(Data,"iU)0xE000[ \t]+CYCLOP[\n]","0xE000 CYCLOPS`n")
	Data:=RegExReplace(Data,"iU)0xE010[ \t]+IC_ETTIN[\n]","0xE010 ETTIN`n")
	Data:=RegExReplace(Data,"iU)0xE050[ \t]+IC_LICHBLACK[\n]","0xE050 LICH_BLACK`n")
	Data:=RegExReplace(Data,"iU)0xE050[ \t]+LICHBLACK[\n]","0xE050 LICH_BLACK`n")
	Data:=RegExReplace(Data,"iU)0xE060[ \t]+LICH_IWD[\n]","0xE060 LICH_WHITE`n")
	Data:=RegExReplace(Data,"iU)0xE070[ \t]+IC_MINOTAUR[\n]","0xE070 MINOTAUR`n")
	Data:=RegExReplace(Data,"iU)0xE080[ \t]+IC_MUMMY[\n]","0xE080 MUMMY`n")
	Data:=RegExReplace(Data,"iU)0xE090[ \t]+IC_MERILITH[\n]","0xE090 MARILITH`n")
	Data:=RegExReplace(Data,"iU)0xE090[ \t]+MERILITH[\n]","0xE090 MARILITH`n")
	Data:=RegExReplace(Data,"iU)0xE0A0[ \t]+ICE_TROLL[\n]","0xE0A0 TROLL_ICE`n")
	Data:=RegExReplace(Data,"iU)0xE0B0[ \t]+IC_TROLL1[\n]","0xE0B0 TROLL_BLUE`n")
	Data:=RegExReplace(Data,"iU)0xE0B0[ \t]+TROLL1_IWD[\n]","0xE0B0 TROLL_BLUE`n")
	Data:=RegExReplace(Data,"iU)0xE0C0[ \t]+SNOW_TROLL[\n]","0xE0C0 TROLL_SNOW`n")
	Data:=RegExReplace(Data,"iU)0xE0D0[ \t]+UMBERHULK_IWD[\n]","0xE0D0 UMBER_HULK_ELDER`n")
	Data:=RegExReplace(Data,"iU)0xE0E0[ \t]+CORNUGONSKI[\n]","0xE0E0 CORNUGON`n")
	Data:=RegExReplace(Data,"iU)0xE0E0[ \t]+IC_CORNUGONSKI[\n]","0xE0E0 CORNUGON`n")
	Data:=RegExReplace(Data,"iU)0xE0F0[ \t]+IC_ICE_GOLEM[\n]","0xE0F0 GOLEM_ICE`n")
	Data:=RegExReplace(Data,"iU)0xE0F0[ \t]+ICE_GOLEM[\n]","0xE0F0 GOLEM_ICE`n")
	Data:=RegExReplace(Data,"iU)0xE0F1[ \t]+IC_GLAB[\n]","0xE0F1 GLABREZU`n")
	Data:=RegExReplace(Data,"iU)0xE0F2[ \t]+IC_WAILING_VIRGIN[\n]","0xE0F2 WAILING_VIRGIN`n")
	Data:=RegExReplace(Data,"iU)0xE200[ \t]+BEETLE[\n]","0xE200 BEETLE_BORING`n")
	Data:=RegExReplace(Data,"iU)0xE200[ \t]+BEETLE_COPPER[\n]","0xE200 BEETLE_BORING`n")
	Data:=RegExReplace(Data,"iU)0xE220[ \t]+BEETLE_BLACK[\n]","0xE220 BEETLE_BOMBARDIER`n")
	Data:=RegExReplace(Data,"iU)0xE220[ \t]+BEETLE_BOMBADIER[\n]","0xE220 BEETLE_BOMBARDIER`n")
	Data:=RegExReplace(Data,"iU)0xE300[ \t]+GHOST_IWD[\n]","0xE300 GHOST`n")
	Data:=RegExReplace(Data,"iU)0xE310[ \t]+GHOUL_IWD[\n]","0xE310 GHOUL_GREATER`n")
	Data:=RegExReplace(Data,"iU)0xE320[ \t]+GHAST_IWD[\n]","0xE320 GHAST_GREATER`n")
	Data:=RegExReplace(Data,"iU)0xE400[ \t]+IC_GOBLIN_AXE[\n]","0xE400 GOBLIN_AXE`n")
	Data:=RegExReplace(Data,"iU)0xE410[ \t]+IC_GOBLIN_BOW[\n]","0xE410 GOBLIN_BOW`n")
	Data:=RegExReplace(Data,"iU)0xE420[ \t]+GOBLINELITE_AXE[\n]","0xE420 GOBLIN_ELITE_AXE`n")
	Data:=RegExReplace(Data,"iU)0xE420[ \t]+IC_GOBLINELITE_AXE[\n]","0xE420 GOBLIN_ELITE_AXE`n")
	Data:=RegExReplace(Data,"iU)0xE430[ \t]+GOBLINELITE_BOW[\n]","0xE430 GOBLIN_ELITE_BOW`n")
	Data:=RegExReplace(Data,"iU)0xE430[ \t]+IC_GOBLINELITE_BOW[\n]","0xE430 GOBLIN_ELITE_BOW`n")
	Data:=RegExReplace(Data,"iU)0xE500[ \t]+IC_LIZARDCASTER1[\n]","0xE500 LIZARD_MAN_ELITE`n")
	Data:=RegExReplace(Data,"iU)0xE500[ \t]+LIZARDCASTER1[\n]","0xE500 LIZARD_MAN_ELITE`n")
	Data:=RegExReplace(Data,"iU)0xE500[ \t]+LIZARDMAN_BROWN[\n]","0xE500 LIZARD_MAN_ELITE`n")
	Data:=RegExReplace(Data,"iU)0xE510[ \t]+IC_LIZARDCASTER2[\n]","0xE510 LIZARD_MAN`n")
	Data:=RegExReplace(Data,"iU)0xE510[ \t]+LIZARDCASTER2[\n]","0xE510 LIZARD_MAN`n")
	Data:=RegExReplace(Data,"iU)0xE510[ \t]+LIZARDMAN_GREEN[\n]","0xE510 LIZARD_MAN`n")
	Data:=RegExReplace(Data,"iU)0xE520[ \t]+IC_LIZARDCASTER3[\n]","0xE520 LIZARD_KING`n")
	Data:=RegExReplace(Data,"iU)0xE520[ \t]+LIZARDCASTER3[\n]","0xE520 LIZARD_KING`n")
	Data:=RegExReplace(Data,"iU)0xE600[ \t]+IC_MYCONID[\n]","0xE600 MYCONID_RED`n")
	Data:=RegExReplace(Data,"iU)0xE600[ \t]+MYCONID[\n]","0xE600 MYCONID_RED`n")
	Data:=RegExReplace(Data,"iU)0xE610[ \t]+IC_MYCONID2[\n]","0xE610 MYCONID_BLUE`n")
	Data:=RegExReplace(Data,"iU)0xE610[ \t]+MYCONID2[\n]","0xE610 MYCONID_BLUE`n")
	Data:=RegExReplace(Data,"iU)0xE700[ \t]+IC_OROG1[\n]","0xE700 OROG`n")
	Data:=RegExReplace(Data,"iU)0xE700[ \t]+OROG1[\n]","0xE700 OROG`n")
	Data:=RegExReplace(Data,"iU)0xE710[ \t]+IC_OROG2[\n]","0xE710 OROG_ELITE`n")
	Data:=RegExReplace(Data,"iU)0xE710[ \t]+OROG2[\n]","0xE710 OROG_ELITE`n")
	Data:=RegExReplace(Data,"iU)0xE720[ \t]+IC_OROG3[\n]","0xE720 OROG_CHIEFTAIN`n")
	Data:=RegExReplace(Data,"iU)0xE720[ \t]+OROG3[\n]","0xE720 OROG_CHIEFTAIN`n")
	Data:=RegExReplace(Data,"iU)0xE800[ \t]+IC_ORC_MELEE1[\n]","0xE800 ORC_MELEE`n")
	Data:=RegExReplace(Data,"iU)0xE800[ \t]+ORC_MELEE1[\n]","0xE800 ORC_MELEE`n")
	Data:=RegExReplace(Data,"iU)0xE810[ \t]+IC_ORC_RANGE2[\n]","0xE810 ORC_RANGE`n")
	Data:=RegExReplace(Data,"iU)0xE810[ \t]+ORC_RANGE2[\n]","0xE810 ORC_RANGE`n")
	Data:=RegExReplace(Data,"iU)0xE820[ \t]+IC_ORC_MELEE3[\n]","0xE820 ORC_ELITE_MELEE`n")
	Data:=RegExReplace(Data,"iU)0xE820[ \t]+ORC_MELEE3[\n]","0xE820 ORC_ELITE_MELEE`n")
	Data:=RegExReplace(Data,"iU)0xE830[ \t]+IC_ORC_RANGE4[\n]","0xE830 ORC_ELITE_RANGE`n")
	Data:=RegExReplace(Data,"iU)0xE830[ \t]+ORC_RANGE4[\n]","0xE830 ORC_ELITE_RANGE`n")
	Data:=RegExReplace(Data,"iU)0xE840[ \t]+IC_ORC_SHAMAN[\n]","0xE840 ORC_SHAMAN`n")
	Data:=RegExReplace(Data,"iU)0xE900[ \t]+IC_SALAMANDER[\n]","0xE900 SALAMANDER_FIRE`n")
	Data:=RegExReplace(Data,"iU)0xE900[ \t]+SALAMANDER[\n]","0xE900 SALAMANDER_FIRE`n")
	Data:=RegExReplace(Data,"iU)0xE910[ \t]+IC_SALAMANDER2[\n]","0xE910 SALAMANDER_FROST`n")
	Data:=RegExReplace(Data,"iU)0xE910[ \t]+SALAMANDER2[\n]","0xE910 SALAMANDER_FROST`n")
	Data:=RegExReplace(Data,"iU)0xEA00[ \t]+IC_SHROOM[\n]","0xEA00 SHRIEKER`n")
	Data:=RegExReplace(Data,"iU)0xEA00[ \t]+SHROOM[\n]","0xEA00 SHRIEKER`n")
	Data:=RegExReplace(Data,"iU)0xEA10[ \t]+GHOST_SHADOW[\n]","0xEA10 SHADOW_SMALL`n")
	Data:=RegExReplace(Data,"iU)0xEA10[ \t]+SHADE_IWD[\n]","0xEA10 SHADOW_SMALL`n")
	Data:=RegExReplace(Data,"iU)0xEA10[ \t]+SHADOW_SMALL_IWD[\n]","0xEA10 SHADOW_SMALL`n")
	Data:=RegExReplace(Data,"iU)0xEA20[ \t]+GHOST_SHADE[\n]","0xEA20 SHADOW_LARGE`n")
	Data:=RegExReplace(Data,"iU)0xEA20[ \t]+SHADE2_IWD[\n]","0xEA20 SHADOW_LARGE`n")
	Data:=RegExReplace(Data,"iU)0xEA20[ \t]+SHADOW_LARGE_IWD[\n]","0xEA20 SHADOW_LARGE`n")
	Data:=RegExReplace(Data,"iU)0xEB00[ \t]+IC_SKELETON0[\n]","0xEB00 SKELETON_MONSTER`n")
	Data:=RegExReplace(Data,"iU)0xEB00[ \t]+SKELETON0[\n]","0xEB00 SKELETON_MONSTER`n")
	Data:=RegExReplace(Data,"iU)0xEB10[ \t]+IC_SKELETONA[\n]","0xEB10 SKELETON_WARRIOR`n")
	Data:=RegExReplace(Data,"iU)0xEB10[ \t]+SKELETONA[\n]","0xEB10 SKELETON_WARRIOR`n")
	Data:=RegExReplace(Data,"iU)0xEB20[ \t]+IC_SKELETONB[\n]","0xEB20 SKELETON_FIEND`n")
	Data:=RegExReplace(Data,"iU)0xEB20[ \t]+SKELETONB[\n]","0xEB20 SKELETON_FIEND`n")
	Data:=RegExReplace(Data,"iU)0xEC00[ \t]+WIGHT[\n]","0xEC00 WIGHT_GRAY`n")
	Data:=RegExReplace(Data,"iU)0xEC10[ \t]+WIGHT_LESSER[\n]","0xEC10 WIGHT_GREEN`n")
	Data:=RegExReplace(Data,"iU)0xEC10[ \t]+WIGHT2[\n]","0xEC10 WIGHT_GREEN`n")
	Data:=RegExReplace(Data,"iU)0xEC20[ \t]+WIGHT_GREATER[\n]","0xEC20 WIGHT_YELLOW`n")
	Data:=RegExReplace(Data,"iU)0xEC20[ \t]+WIGHT3[\n]","0xEC20 WIGHT_YELLOW`n")
	Data:=RegExReplace(Data,"iU)0xED00[ \t]+IC_YUANTI[\n]","0xED00 YUAN-TI`n")
	Data:=RegExReplace(Data,"iU)0xED00[ \t]+YUANTI[\n]","0xED00 YUAN-TI`n")
	Data:=RegExReplace(Data,"iU)0xED10[ \t]+IC_YUANTI2[\n]","0xED10 YUAN-TI_ELITE`n")
	Data:=RegExReplace(Data,"iU)0xED10[ \t]+YUANTI2[\n]","0xED10 YUAN-TI_ELITE`n")
	Data:=RegExReplace(Data,"iU)0xED20[ \t]+IC_YUANTI3[\n]","0xED20 YUAN-TI_PRIEST`n")
	Data:=RegExReplace(Data,"iU)0xED20[ \t]+YUANTI3[\n]","0xED20 YUAN-TI_PRIEST`n")
	Data:=RegExReplace(Data,"iU)0xEE00[ \t]+ZOMBIE_IWD[\n]","0xEE00 ZOMBIE_YELLOW`n")
	Data:=RegExReplace(Data,"iU)0xEE00[ \t]+ZOMBIE_LESSER[\n]","0xEE00 ZOMBIE_YELLOW`n")
	Data:=RegExReplace(Data,"iU)0xEE00[ \t]+ZOMBIE_YELLOW_IWD[\n]","0xEE00 ZOMBIE_YELLOW`n")
	Data:=RegExReplace(Data,"iU)0xEE10[ \t]+ZOMBIE_BLUE_IWD[\n]","0xEE10 ZOMBIE_BLUE`n")
	Data:=RegExReplace(Data,"iU)0xEE10[ \t]+ZOMBIE_GREATER[\n]","0xEE10 ZOMBIE_BLUE`n")
	Data:=RegExReplace(Data,"iU)0xEE10[ \t]+ZOMBIE2_IWD[\n]","0xEE10 ZOMBIE_BLUE`n")
	Data:=RegExReplace(Data,"iU)0xEF10[ \t]+ELEMENTAL_WATER[\n]","0xEF10 WATER_WEIRD`n")

	Sort, Data
	Data:=Trim(Data,"`r`n")
	Return Data
}

TempFormatIDS2(Data){
	Data:=RegExReplace(Data,"i)(^[ \t]+|[ \t\r]+$)")	; Remove leading and trailing whitespace
	Data:=RegExReplace(Data,"i)[\r]+")
	Data:=RegExReplace(Data,"i)[\n][ \t]+[\n]","`n")
	Data.="`n"

	Data:=RegExReplace(Data,"iU)(0x6313[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THIEF_FEMALE_GNOME[\n]","0x6314 CDFB     CGAMEANIMATIONTYPE_THIEF_FEMALE_GNOME`n")
	Data:=RegExReplace(Data,"iU)(0x6313[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THIEF_FEMALE_HALFORC[\n]","0x6315 CHFB     CGAMEANIMATIONTYPE_THIEF_FEMALE_HALFORC`n")

	Data:=RegExReplace(Data,"iU)(0x1001[ \t]+.{0,9}CGAMEANIMATIONTYPE_)NABASSU[\n]","$1FIEND_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x1002[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DEMON_BLUE[\n]","$1FIEND_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0x1004[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SHARK_SANDBARD[\n]","$1GW_SHARK_SANDBARD`n")
	Data:=RegExReplace(Data,"iU)(0x1005[ \t]+.{0,9}CGAMEANIMATIONTYPE_)OVERSEER_WARRIOR1[\n]","$1GW_OVERSEER_WARRIOR1`n")
	Data:=RegExReplace(Data,"iU)(0x1006[ \t]+.{0,9}CGAMEANIMATIONTYPE_)OVERSEER_WARRIOR2[\n]","$1GW_OVERSEER_WARRIOR2`n")
	Data:=RegExReplace(Data,"iU)(0x1007[ \t]+.{0,9}CGAMEANIMATIONTYPE_)OVERSEER_WARRIOR3[\n]","$1GW_OVERSEER_WARRIOR3`n")
	Data:=RegExReplace(Data,"iU)(0x1008[ \t]+.{0,9}CGAMEANIMATIONTYPE_)OVERSEER_CAPTAIN[\n]","$1GW_OVERSEER_CAPTAIN`n")
	Data:=RegExReplace(Data,"iU)(0x1009[ \t]+.{0,9}CGAMEANIMATIONTYPE_)OVERSEER_NUDE[\n]","$1GW_OVERSEER_NUDE`n")
	Data:=RegExReplace(Data,"iU)(0x1101[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DRAGON_WHITE_YOUNG[\n]","$1DRAGON_WHITE`n")
	Data:=RegExReplace(Data,"iU)(0x1102[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CATAPULT[\n]","$1GW_CATAPULT`n")
	Data:=RegExReplace(Data,"iU)(0x1209[ \t]+.{0,9}CGAMEANIMATIONTYPE_)TARASQUE[\n]","$1GW_TARASQUE`n")
	Data:=RegExReplace(Data,"iU)(0x120A[ \t]+.{0,9}CGAMEANIMATIONTYPE_)TARASQUE_BLUE[\n]","$1GW_TARASQUE_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0x120B[ \t]+.{0,9}CGAMEANIMATIONTYPE_)TARASQUE_GREEN[\n]","$1GW_TARASQUE_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x120C[ \t]+.{0,9}CGAMEANIMATIONTYPE_)TARASQUE_PURPLE[\n]","$1GW_TARASQUE_PURPLE`n")
	Data:=RegExReplace(Data,"iU)(0x120D[ \t]+.{0,9}CGAMEANIMATIONTYPE_)TARASQUE_RED[\n]","$1GW_TARASQUE_RED`n")
	Data:=RegExReplace(Data,"iU)(0x1300[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DEMIGORGON[\n]","$1DEMOGORGON`n")
	Data:=RegExReplace(Data,"iU)(0x1301[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DRAGON_MECANIC[\n]","$1GW_DRAGON_MECHANIC`n")
	Data:=RegExReplace(Data,"iU)(0x1301[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GW_DRAGON_MECANIC[\n]","$1GW_DRAGON_MECHANIC`n")
	Data:=RegExReplace(Data,"iU)(0x5018[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GOBLIN_WORGRIDER[\n]","$1GOBLIN_WORG`n")
	Data:=RegExReplace(Data,"iU)(0x5019[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GOBLIN_WORGRIDER_CAPTAIN[\n]","$1GOBLIN_WORG_CAPTAIN`n")
	Data:=RegExReplace(Data,"iU)(0x502B[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROST_GIANT[\n]","$1GIANT_FROST`n")
	Data:=RegExReplace(Data,"iU)(0x504A[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FIRE_GIANT_IWD[\n]","$1GIANT_FIRE_IWD`n")
	Data:=RegExReplace(Data,"iU)(0x504B[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IRON_GOLEM_IWD[\n]","$1GOLEM_IRON_IWD`n")
	Data:=RegExReplace(Data,"iU)(0x5050[ \t]+.{0,9}CGAMEANIMATIONTYPE_)VERBEEG[\n]","$1GIANT_VERBEEG`n")
	Data:=RegExReplace(Data,"iU)(0x505C[ \t]+.{0,9}CGAMEANIMATIONTYPE_)OVERSEER_MAGE[\n]","$1GW_OVERSEER_MAGE`n")
	Data:=RegExReplace(Data,"iU)(0x505D[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROZEN_HORROR[\n]","$1GW_FROZEN_HORROR`n")
	Data:=RegExReplace(Data,"iU)(0x505E[ \t]+.{0,9}CGAMEANIMATIONTYPE_)TROLL_AVATAR_DARKNESS[\n]","$1GW_TROLL_AVATAR_DARKNESS`n")
	Data:=RegExReplace(Data,"iU)(0x505F[ \t]+.{0,9}CGAMEANIMATIONTYPE_)TROLL_AVATAR_BLUE[\n]","$1GW_TROLL_AVATAR_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0x5060[ \t]+.{0,9}CGAMEANIMATIONTYPE_)TROLL_AVATAR_GREEN[\n]","$1GW_TROLL_AVATAR_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x5061[ \t]+.{0,9}CGAMEANIMATIONTYPE_)TROLL_AVATAR_RED[\n]","$1GW_TROLL_AVATAR_RED`n")
	Data:=RegExReplace(Data,"iU)(0x5062[ \t]+.{0,9}CGAMEANIMATIONTYPE_)COW_BLACK_AND_WHITE[\n]","$1GW_COW_BLACK_AND_WHITE`n")
	Data:=RegExReplace(Data,"iU)(0x5063[ \t]+.{0,9}CGAMEANIMATIONTYPE_)COW_BROWN_AND_BLACK[\n]","$1GW_COW_BROWN_AND_BLACK`n")
	Data:=RegExReplace(Data,"iU)(0x5063[ \t]+.{0,9}CGAMEANIMATIONTYPE_)COW_BROWN_AND_WHITE[\n]","$1GW_COW_BROWN_AND_WHITE`n")
	Data:=RegExReplace(Data,"iU)(0x5097[ \t]+.{0,9}CGAMEANIMATIONTYPE_)JACKAL_GUARDIAN[\n]","$1GW_JACKAL_GUARDIAN`n")
	Data:=RegExReplace(Data,"iU)(0x5098[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ZOMBIE_GUARDIAN[\n]","$1GW_ZOMBIE_GUARDIAN`n")
	Data:=RegExReplace(Data,"iU)(0x50A2[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SAND_BEETLE_GIANT[\n]","$1GW_SAND_BEETLE_GIANT`n")
	Data:=RegExReplace(Data,"iU)(0x50A3[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGGOT_GIANT_BLUE[\n]","$1GW_MAGGOT_GIANT_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0x50A4[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGGOT_GIANT_GREEN[\n]","$1GW_MAGGOT_GIANT_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x50A5[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGGOT_GIANT_RED[\n]","$1GW_MAGGOT_GIANT_RED`n")
	Data:=RegExReplace(Data,"iU)(0x50A6[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGGOT_GIANT_BLACK[\n]","$1GW_MAGGOT_GIANT_BLACK`n")
	Data:=RegExReplace(Data,"iU)(0x50A7[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGGOT_GIANT_BLACK_BLUE[\n]","$1GW_MAGGOT_GIANT_GOLDEN_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0x50A8[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGGOT_GIANT_BLACK_RED[\n]","$1GW_MAGGOT_GIANT_GOLDEN_RED`n")
	Data:=RegExReplace(Data,"iU)(0x50A9[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGGOT_GIANT_BLACK_GOLD[\n]","$1GW_MAGGOT_GIANT_GOLD`n")
	Data:=RegExReplace(Data,"iU)(0x50B7[ \t]+.{0,9}CGAMEANIMATIONTYPE_)RAZOR_SPINE_GIANT[\n]","$1GW_RAZOR_SPINE_GIANT`n")
	Data:=RegExReplace(Data,"iU)(0x50BE[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROG_DEMON_GIANT[\n]","$1GW_FROG_DEMON_GIANT`n")
	Data:=RegExReplace(Data,"iU)(0x50BF[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROG_DEMON_GIANT_BLUE[\n]","$1GW_FROG_DEMON_GIANT_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0x50C0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROG_DEMON_GIANT_GREEN[\n]","$1GW_FROG_DEMON_GIANT_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x50C1[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROG_DEMON_GIANT_PURPLE[\n]","$1GW_FROG_DEMON_GIANT_PURPLE`n")
	Data:=RegExReplace(Data,"iU)(0x50C2[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROG_DEMON_GIANT_RED[\n]","$1GW_FROG_DEMON_GIANT_RED`n")
	Data:=RegExReplace(Data,"iU)(0x50C3[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROG_DEMON_GIANT_YELLOW[\n]","$1GW_FROG_DEMON_GIANT_YELLOW`n")
	Data:=RegExReplace(Data,"iU)(0x50D0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)LOLTH_AVATAR[\n]","$1GW_LOLTH_AVATAR`n")
	Data:=RegExReplace(Data,"iU)(0x50D1[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DEMON_ANDARIEL[\n]","$1GW_DEMON_ANDARIEL`n")
	Data:=RegExReplace(Data,"iU)(0x50D2[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DEMON_DIABLO[\n]","$1GW_DEMON_DIABLO`n")
	Data:=RegExReplace(Data,"iU)(0x523D[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DARK_TREANT[\n]","$1TREANT_DARK`n")
	Data:=RegExReplace(Data,"iU)(0x523D[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DARK_TREE[\n]","$1TREANT_DARK`n")
	Data:=RegExReplace(Data,"iU)(0x5240[ \t]+.{0,9}CGAMEANIMATIONTYPE_)HALF-DRAGON_BLACK[\n]","$1HALFDRAGON_BLACK`n")
	Data:=RegExReplace(Data,"iU)(0x5241[ \t]+.{0,9}CGAMEANIMATIONTYPE_)HALF-DRAGON_RED[\n]","$1HALFDRAGON_RED`n")
	Data:=RegExReplace(Data,"iU)(0x5248[ \t]+.{0,9}CGAMEANIMATIONTYPE_)YUAN-TI_HALFBREED[\n]","$1YUAN-TI_HALF`n")
	Data:=RegExReplace(Data,"iU)(0x5253[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GOBLINELITE_AXE_IWD[\n]","$1GOBLINELITE_AXE_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x5254[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GOBLINELITE_BOW_IWD[\n]","$1GOBLINELITE_BOW_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x5258[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GOBLIN_AXE_IWD[\n]","$1GOBLIN_AXE_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x5259[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GOBLIN_BOW_IWD[\n]","$1GOBLIN_BOW_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x525B[ \t]+.{0,9}CGAMEANIMATIONTYPE_)KEG_1[\n]","$1KEG1`n")
	Data:=RegExReplace(Data,"iU)(0x525C[ \t]+.{0,9}CGAMEANIMATIONTYPE_)KEG_2[\n]","$1KEG2`n")
	Data:=RegExReplace(Data,"iU)(0x525D[ \t]+.{0,9}CGAMEANIMATIONTYPE_)KEG_3[\n]","$1KEG3`n")
	Data:=RegExReplace(Data,"iU)(0x525F[ \t]+.{0,9}CGAMEANIMATIONTYPE_)NEO-OROG_SHAMAN[\n]","$1OROG_SHAMAN`n")
	Data:=RegExReplace(Data,"iU)(0x5262[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WORG_IWD[\n]","$1WORG`n")
	Data:=RegExReplace(Data,"iU)(0x5264[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SVIRFNEBLIN_PALE_NO_AXE[\n]","$1SVIRFNEBLIN_PALE_NOAXE`n")
	Data:=RegExReplace(Data,"iU)(0x5266[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SVIRFNEBLIN_DARK_NO_AXE[\n]","$1SVIRFNEBLIN_DARK_NOAXE`n")
	Data:=RegExReplace(Data,"iU)(0x526A[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SHADOW_1_MURKY[\n]","$1SHADOW_SMALL_MURKY`n")
	Data:=RegExReplace(Data,"iU)(0x526B[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SHADOW_2_MURKY[\n]","$1SHADOW_LARGE_MURKY`n")
	Data:=RegExReplace(Data,"iU)(0x5279[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ANIMATED_PLATE_1[\n]","$1ANIMATED_PLATE_BRONZE_SMALL`n")
	Data:=RegExReplace(Data,"iU)(0x5279[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ANIMATED_PLATE_BRONZE[\n]","$1ANIMATED_PLATE_BRONZE_SMALL`n")
	Data:=RegExReplace(Data,"iU)(0x527A[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ANIMATED_PLATE_2[\n]","$1ANIMATED_PLATE_DARK_SMALL`n")
	Data:=RegExReplace(Data,"iU)(0x527A[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ANIMATED_PLATE_DARK[\n]","$1ANIMATED_PLATE_DARK_SMALL`n")
	Data:=RegExReplace(Data,"iU)(0x527B[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ANIMATED_PLATE_3[\n]","$1ANIMATED_PLATE_GREEN_SMALL`n")
	Data:=RegExReplace(Data,"iU)(0x527B[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ANIMATED_PLATE_GREEN[\n]","$1ANIMATED_PLATE_GREEN_SMALL`n")
	Data:=RegExReplace(Data,"iU)(0x527D[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BARBARIAN_SHAMAN_1[\n]","$1BARBARIAN_SHAMAN_HAMMER`n")
	Data:=RegExReplace(Data,"iU)(0x527E[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BARBARIAN_SHAMAN_2[\n]","$1BARBARIAN_SHAMAN_STAFF`n")
	Data:=RegExReplace(Data,"iU)(0x527F[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BARBARIAN_SHAMAN_3[\n]","$1BARBARIAN_SHAMAN_CLUB`n")
	Data:=RegExReplace(Data,"iU)(0x5280[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BARBARIAN_WARRIOR_1[\n]","$1BARBARIAN_WARRIOR_TAN`n")
	Data:=RegExReplace(Data,"iU)(0x5281[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BARBARIAN_WARRIOR_2[\n]","$1BARBARIAN_WARRIOR_RED`n")
	Data:=RegExReplace(Data,"iU)(0x5282[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BARBARIAN_WARRIOR_3[\n]","$1BARBARIAN_WARRIOR_BROWN`n")
	Data:=RegExReplace(Data,"iU)(0x528A[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SEER_IWD[\n]","$1SEER`n")
	Data:=RegExReplace(Data,"iU)(0x528C[ \t]+.{0,9}CGAMEANIMATIONTYPE_)UMBERHULK_VODYANOI[\n]","$1UMBER_HULK_VODYANOI`n")
	Data:=RegExReplace(Data,"iU)(0x5291[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BOMBARDIER_BEETLE_NWN[\n]","$1BEETLE_BOMBARDIER_NWN`n")
	Data:=RegExReplace(Data,"iU)(0x5293[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PACKMULE[\n]","$1PACK_MULE_WOW`n")
	Data:=RegExReplace(Data,"iU)(0x5293[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PACKMULE_WOW[\n]","$1PACK_MULE_WOW`n")
	Data:=RegExReplace(Data,"iU)(0x5297[ \t]+.{0,9}CGAMEANIMATIONTYPE_)HALFDRAGON_SILVER[\n]","$1GW_HALFDRAGON_SILVER`n")
	Data:=RegExReplace(Data,"iU)(0x5298[ \t]+.{0,9}CGAMEANIMATIONTYPE_)OCTOPUS_TENTACLE[\n]","$1GW_OCTOPUS_TENTACLE`n")
	Data:=RegExReplace(Data,"iU)(0x52A1[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PIG[\n]","$1GW_PIG`n")
	Data:=RegExReplace(Data,"iU)(0x52A2[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SHEEP[\n]","$1GW_SHEEP`n")
	Data:=RegExReplace(Data,"iU)(0x52A3[ \t]+.{0,9}CGAMEANIMATIONTYPE_)APE_BLACK[\n]","$1GW_APE_BLACK`n")
	Data:=RegExReplace(Data,"iU)(0x52A4[ \t]+.{0,9}CGAMEANIMATIONTYPE_)APE_BROWN[\n]","$1GW_APE_BROWN`n")
	Data:=RegExReplace(Data,"iU)(0x52A5[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GARGOYLE[\n]","$1GW_GARGOYLE`n")
	Data:=RegExReplace(Data,"iU)(0x52A6[ \t]+.{0,9}CGAMEANIMATIONTYPE_)VARGOILLE[\n]","$1BONEBAT`n")
	Data:=RegExReplace(Data,"iU)(0x52A7[ \t]+.{0,9}CGAMEANIMATIONTYPE_)AMAZON_PRIESTESS_FLAIL[\n]","$1GW_AMAZON_PRIESTESS_FLAIL`n")
	Data:=RegExReplace(Data,"iU)(0x52A8[ \t]+.{0,9}CGAMEANIMATIONTYPE_)AMAZON_PRIESTESS_HAMMER[\n]","$1GW_AMAZON_PRIESTESS_HAMMER`n")
	Data:=RegExReplace(Data,"iU)(0x52A9[ \t]+.{0,9}CGAMEANIMATIONTYPE_)AMAZON_PRIESTESS_MACE[\n]","$1GW_AMAZON_PRIESTESS_MACE`n")
	Data:=RegExReplace(Data,"iU)(0x52AA[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PYGMY_SHAMAN[\n]","$1GW_PYGMY_SHAMAN`n")
	Data:=RegExReplace(Data,"iU)(0x52C3[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DOOM_KNIGHT_PRIEST[\n]","$1GW_DOOM_KNIGHT_PRIEST`n")
	Data:=RegExReplace(Data,"iU)(0x52C4[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DOOM_KNIGHT_PRIEST_COLD[\n]","$1GW_DOOM_KNIGHT_PRIEST_COLD`n")
	Data:=RegExReplace(Data,"iU)(0x52C5[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DOOM_KNIGHT_PRIEST_FIRE[\n]","$1GW_DOOM_KNIGHT_PRIEST_FIRE`n")
	Data:=RegExReplace(Data,"iU)(0x52C6[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DOOM_KNIGHT_PRIEST_POISON[\n]","$1GW_DOOM_KNIGHT_PRIEST_POISON`n")
	Data:=RegExReplace(Data,"iU)(0x52C7[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DOOM_KNIGHT_PRIEST_UNHOLY[\n]","$1GW_DOOM_KNIGHT_PRIEST_UNHOLY`n")
	Data:=RegExReplace(Data,"iU)(0x52C8[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DOOM_KNIGHT_MAGE[\n]","$1GW_DOOM_KNIGHT_MAGE`n")
	Data:=RegExReplace(Data,"iU)(0x52C9[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DOOM_KNIGHT_MAGE_COLD[\n]","$1GW_DOOM_KNIGHT_MAGE_COLD`n")
	Data:=RegExReplace(Data,"iU)(0x52CA[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DOOM_KNIGHT_MAGE_FIRE[\n]","$1GW_DOOM_KNIGHT_MAGE_FIRE`n")
	Data:=RegExReplace(Data,"iU)(0x52CB[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DOOM_KNIGHT_MAGE_POISON[\n]","$1GW_DOOM_KNIGHT_MAGE_POISON`n")
	Data:=RegExReplace(Data,"iU)(0x52CC[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PANTHER_WOMAN[\n]","$1GW_PANTHER_WOMAN`n")
	Data:=RegExReplace(Data,"iU)(0x52CD[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PANTHER_WOMAN_ELITE1[\n]","$1GW_PANTHER_WOMAN_ELITE1`n")
	Data:=RegExReplace(Data,"iU)(0x52CE[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PANTHER_WOMAN_ELITE2[\n]","$1GW_PANTHER_WOMAN_ELITE2`n")
	Data:=RegExReplace(Data,"iU)(0x52CF[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PANTHER_WOMAN_WHIP[\n]","$1GW_PANTHER_WOMAN_WHIP`n")
	Data:=RegExReplace(Data,"iU)(0x52D0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PANTHER_WOMAN_WHIP_ELITE[\n]","$1GW_PANTHER_WOMAN_WHIP_ELITE`n")
	Data:=RegExReplace(Data,"iU)(0x52D1[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PANTHER_WOMAN_CHIEF[\n]","$1GW_PANTHER_WOMAN_CHIEF`n")
	Data:=RegExReplace(Data,"iU)(0x52D2[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PANTHER_WOMAN_RANGE[\n]","$1GW_PANTHER_WOMAN_RANGE`n")
	Data:=RegExReplace(Data,"iU)(0x52D3[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PANTHER_WOMAN_RANGE_ELITE[\n]","$1GW_PANTHER_WOMAN_RANGE_ELITE`n")
	Data:=RegExReplace(Data,"iU)(0x52D6[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MUMMY_PUTRID[\n]","$1GW_MUMMY_PUTRID`n")
	Data:=RegExReplace(Data,"iU)(0x52D7[ \t]+.{0,9}CGAMEANIMATIONTYPE_)LICH_FIRE[\n]","$1GW_LICH_FIRE`n")
	Data:=RegExReplace(Data,"iU)(0x52D8[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GOATMAN_TWO_HANDED_AXE[\n]","$1GW_GOATMAN_TWO_HANDED_AXE`n")
	Data:=RegExReplace(Data,"iU)(0x52D9[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GOATMAN_GREAT_MAUL[\n]","$1GW_GOATMAN_GREAT_MAUL`n")
	Data:=RegExReplace(Data,"iU)(0x52DA[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SAND_BEETLE[\n]","$1GW_SAND_BEETLE`n")
	Data:=RegExReplace(Data,"iU)(0x52DB[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGGOT_BLUE[\n]","$1GW_MAGGOT_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0x52DC[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGGOT_BLACK[\n]","$1GW_MAGGOT_BLACK`n")
	Data:=RegExReplace(Data,"iU)(0x52DD[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGGOT_RED[\n]","$1GW_MAGGOT_RED`n")
	Data:=RegExReplace(Data,"iU)(0x52DE[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGGOT_GOLD[\n]","$1GW_MAGGOT_GOLD`n")
	Data:=RegExReplace(Data,"iU)(0x52E7[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGGOT_EGG[\n]","$1GW_MAGGOT_EGG`n")
	Data:=RegExReplace(Data,"iU)(0x52E8[ \t]+.{0,9}CGAMEANIMATIONTYPE_)EVARD_TENTACLES[\n]","$1GW_EVARD_TENTACLES`n")
	Data:=RegExReplace(Data,"iU)(0x52E9[ \t]+.{0,9}CGAMEANIMATIONTYPE_)EVARD_FIRE_TENTACLES[\n]","$1GW_EVARD_FIRE_TENTACLES`n")
	Data:=RegExReplace(Data,"iU)(0x52EA[ \t]+.{0,9}CGAMEANIMATIONTYPE_)EVARD_BLACK_TENTACLES[\n]","$1GW_EVARD_BLACK_TENTACLES`n")
	Data:=RegExReplace(Data,"iU)(0x52EB[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PUTRID_DEFILER[\n]","$1GW_PUTRID_DEFILER`n")
	Data:=RegExReplace(Data,"iU)(0x52EC[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GOLEM_MECHANIC_BLUE[\n]","$1GW_GOLEM_MECHANIC_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0x52ED[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GOLEM_MECHANIC_GREEN[\n]","$1GW_GOLEM_MECHANIC_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x52EE[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GOLEM_MECHANIC_RED[\n]","$1GW_GOLEM_MECHANIC_RED`n")
	Data:=RegExReplace(Data,"iU)(0x52EF[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SPIDER_MECHANIC[\n]","$1GW_SPIDER_MECHANIC`n")
	Data:=RegExReplace(Data,"iU)(0x52F0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SPIDER_MECHANIC_GREEN[\n]","$1GW_SPIDER_MECHANIC_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x52F1[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SPIDER_MECHANIC_RED[\n]","$1GW_SPIDER_MECHANIC_RED`n")
	Data:=RegExReplace(Data,"iU)(0x52F2[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SPIDER_MECHANIC_YELLOW[\n]","$1GW_SPIDER_MECHANIC_YELLOW`n")
	Data:=RegExReplace(Data,"iU)(0x52F3[ \t]+.{0,9}CGAMEANIMATIONTYPE_)RAZOR_SPINE[\n]","$1GW_RAZOR_SPINE`n")
	Data:=RegExReplace(Data,"iU)(0x52F5[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROG_DEMON[\n]","$1GW_FROG_DEMON`n")
	Data:=RegExReplace(Data,"iU)(0x52F6[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROG_DEMON_BLUE[\n]","$1GW_FROG_DEMON_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0x52F7[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROG_DEMON_GREEN[\n]","$1GW_FROG_DEMON_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x52F8[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROG_DEMON_PURPLE[\n]","$1GW_FROG_DEMON_PURPLE`n")
	Data:=RegExReplace(Data,"iU)(0x52F9[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROG_DEMON_RED[\n]","$1GW_FROG_DEMON_RED`n")
	Data:=RegExReplace(Data,"iU)(0x52FA[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROG_DEMON_YELLOW[\n]","$1GW_FROG_DEMON_YELLOW`n")
	Data:=RegExReplace(Data,"iU)(0x5301[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BAT_DEMON[\n]","$1GW_BAT_DEMON`n")
	Data:=RegExReplace(Data,"iU)(0x5302[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BAT_DEMON_BLACK[\n]","$1GW_BAT_DEMON_BLACK`n")
	Data:=RegExReplace(Data,"iU)(0x5303[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BAT_DEMON_BLUE[\n]","$1GW_BAT_DEMON_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0x5304[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BAT_DEMON_FIRE[\n]","$1GW_BAT_DEMON_FIRE`n")
	Data:=RegExReplace(Data,"iU)(0x5305[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BAT_DEMON_SMALL[\n]","$1GW_BAT_DEMON_SMALL`n")
	Data:=RegExReplace(Data,"iU)(0x5306[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IMP_GREMLIN[\n]","$1GW_IMP_GREMLIN`n")
	Data:=RegExReplace(Data,"iU)(0x5307[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IMP_GREMLIN_BLUE[\n]","$1GW_IMP_GREMLIN_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0x5308[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IMP_GREMLIN_GREEN[\n]","$1GW_IMP_GREMLIN_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x5309[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IMP_GREMLIN_RED[\n]","$1GW_IMP_GREMLIN_RED`n")
	Data:=RegExReplace(Data,"iU)(0x530A[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SUCCUBUS[\n]","$1GW_SUCCUBUS`n")
	Data:=RegExReplace(Data,"iU)(0x530B[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SUCCUBUS_WITCH[\n]","$1GW_SUCCUBUS_WITCH`n")
	Data:=RegExReplace(Data,"iU)(0x530C[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SUCCUBUS_SEXY[\n]","$1GW_SUCCUBUS_SEXY`n")
	Data:=RegExReplace(Data,"iU)(0x5310[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DEMON_IZUAL[\n]","$1GW_DEMON_IZUAL`n")
	Data:=RegExReplace(Data,"iU)(0x5311[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DEMON_MEPHISTO[\n]","$1GW_DEMON_MEPHISTO`n")
	Data:=RegExReplace(Data,"iU)(0x5312[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MEGADEMON[\n]","$1GW_MEGA_DEMON`n")
	Data:=RegExReplace(Data,"iU)(0x5313[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MEGADEMON_FLAMBERGE[\n]","$1GW_MEGA_DEMON_FLAMBERGE`n")
	Data:=RegExReplace(Data,"iU)(0x5314[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MEGADEMON_SCYTHE[\n]","$1GW_MEGA_DEMON_SCYTHE`n")
	Data:=RegExReplace(Data,"iU)(0x5315[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MEGADEMON_SWORD[\n]","$1GW_MEGA_DEMON_SWORD`n")
	Data:=RegExReplace(Data,"iU)(0x5316[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MEGADEMON_WAR_AXE[\n]","$1GW_MEGA_DEMON_WAR_AXE`n")
	Data:=RegExReplace(Data,"iU)(0x5317[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WERERAT_MANTUOCK_PST[\n]","$1GW_WERERAT_MANTUOCK_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5318[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WERERAT_BLUE_PST[\n]","$1GW_WERERAT_BLUE_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5319[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WERERAT_GREEN_PST[\n]","$1GW_WERERAT_GREEN_PST`n")
	Data:=RegExReplace(Data,"iU)(0x531A[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WERERAT_OCHRE_PST[\n]","$1GW_WERERAT_OCHRE_PST`n")
	Data:=RegExReplace(Data,"iU)(0x531B[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WERERAT_DARK_OCHRE_PST[\n]","$1GW_WERERAT_DARK_OCHRE_PST`n")
	Data:=RegExReplace(Data,"iU)(0x531C[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WERERAT_YELLOW_PST[\n]","$1GW_WERERAT_YELLOW_PST`n")
	Data:=RegExReplace(Data,"iU)(0x531D[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WERERAT_GIANT_BLUE_PST[\n]","$1GW_WERERAT_GIANT_BLUE_PST`n")
	Data:=RegExReplace(Data,"iU)(0x531E[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WERERAT_GIANT_GREEN_PST[\n]","$1GW_WERERAT_GIANT_GREEN_PST`n")
	Data:=RegExReplace(Data,"iU)(0x531F[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WERERAT_GIANT_OCHRE_PST[\n]","$1GW_WERERAT_GIANT_OCHRE_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5320[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WERERAT_GIANT_DARK_OCHRE_PST[\n]","$1GW_WERERAT_GIANT_DARK_OCHRE_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5321[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WERERAT_GIANT_YELLOW_PST[\n]","$1GW_WERERAT_GIANT_YELLOW_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5322[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BLADE_CREEPER[\n]","$1GW_BLADE_CREEPER`n")
	Data:=RegExReplace(Data,"iU)(0x5328[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ANIMATED_PLATE_BRONZE_LARGE[\n]","$1ANIMATED_PLATE_BRONZE`n")
	Data:=RegExReplace(Data,"iU)(0x5329[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ANIMATED_PLATE_DARK_LARGE[\n]","$1ANIMATED_PLATE_DARK`n")
	Data:=RegExReplace(Data,"iU)(0x532A[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ANIMATED_PLATE_GREEN_LARGE[\n]","$1ANIMATED_PLATE_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x5338[ \t]+.{0,9}CGAMEANIMATIONTYPE_)HYDRA[\n]","$1GW_HYDRA_FIRE`n")
	Data:=RegExReplace(Data,"iU)(0x547D[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GUARD1_GLAIVE_D2[\n]","$1GW_GUARD1_GLAIVE_D2`n")
	Data:=RegExReplace(Data,"iU)(0x547E[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GUARD1_SPEAR_D2[\n]","$1GW_GUARD1_SPEAR_D2`n")
	Data:=RegExReplace(Data,"iU)(0x547F[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GUARD2_GLAIVE_D2[\n]","$1GW_GUARD2_GLAIVE_D2`n")
	Data:=RegExReplace(Data,"iU)(0x5480[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GUARD2_SPEAR_D2[\n]","$1GW_GUARD2_SPEAR_D2`n")
	Data:=RegExReplace(Data,"iU)(0x5481[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SNAKE_SEA[\n]","$1GW_SNAKE_SEA`n")
	Data:=RegExReplace(Data,"iU)(0x5482[ \t]+.{0,9}CGAMEANIMATIONTYPE_)JELLYFISH_BLUE[\n]","$1GW_JELLYFISH_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0x5483[ \t]+.{0,9}CGAMEANIMATIONTYPE_)JELLYFISH_GREEN[\n]","$1GW_JELLYFISH_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x5484[ \t]+.{0,9}CGAMEANIMATIONTYPE_)JELLYFISH_PURPLE[\n]","$1GW_JELLYFISH_PURPLE`n")
	Data:=RegExReplace(Data,"iU)(0x5485[ \t]+.{0,9}CGAMEANIMATIONTYPE_)JELLYFISH_YELLOW[\n]","$1GW_JELLYFISH_YELLOW`n")
	Data:=RegExReplace(Data,"iU)(0x5486[ \t]+.{0,9}CGAMEANIMATIONTYPE_)JELLYFISH_BLUE_LARGE[\n]","$1GW_JELLYFISH_BLUE_LARGE`n")
	Data:=RegExReplace(Data,"iU)(0x5487[ \t]+.{0,9}CGAMEANIMATIONTYPE_)JELLYFISH_GREEN_LARGE[\n]","$1GW_JELLYFISH_GREEN_LARGE`n")
	Data:=RegExReplace(Data,"iU)(0x5488[ \t]+.{0,9}CGAMEANIMATIONTYPE_)JELLYFISH_PURPLE_LARGE[\n]","$1GW_JELLYFISH_PURPLE_LARGE`n")
	Data:=RegExReplace(Data,"iU)(0x5489[ \t]+.{0,9}CGAMEANIMATIONTYPE_)JELLYFISH_YELLOW_LARGE[\n]","$1GW_JELLYFISH_YELLOW_LARGE`n")
	Data:=RegExReplace(Data,"iU)(0x548A[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GUARD_ZEALOT_AXE[\n]","$1GW_GUARD_ZEALOT_AXE`n")
	Data:=RegExReplace(Data,"iU)(0x548B[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GUARD_ZEALOT_VOULGE[\n]","$1GW_GUARD_ZEALOT_VOULGE`n")
	Data:=RegExReplace(Data,"iU)(0x548C[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GUARD_ZEALOT_POLEAXE[\n]","$1GW_GUARD_ZEALOT_POLEAXE`n")
	Data:=RegExReplace(Data,"iU)(0x548D[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GUARD_ZEALOT_SCYTHE[\n]","$1GW_GUARD_ZEALOT_SCYTHE`n")
	Data:=RegExReplace(Data,"iU)(0x548E[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CHICKEN_WHITE[\n]","$1GW_CHICKEN_WHITE`n")
	Data:=RegExReplace(Data,"iU)(0x548F[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CHICKEN_GREY[\n]","$1GW_CHICKEN_GREY`n")
	Data:=RegExReplace(Data,"iU)(0x5490[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CHICKEN_BLACK[\n]","$1GW_CHICKEN_BLACK`n")
	Data:=RegExReplace(Data,"iU)(0x5491[ \t]+.{0,9}CGAMEANIMATIONTYPE_)RAT_PST[\n]","$1GW_RAT_WILD_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5491[ \t]+.{0,9}CGAMEANIMATIONTYPE_)RAT_WILD[\n]","$1GW_RAT_WILD_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5492[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MOSQUITO_GIANT[\n]","$1GW_MOSQUITO_GIANT`n")
	Data:=RegExReplace(Data,"iU)(0x5493[ \t]+.{0,9}CGAMEANIMATIONTYPE_)VULTURE_DEMON[\n]","$1GW_VULTURE_DEMON`n")
	Data:=RegExReplace(Data,"iU)(0x5494[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MINOTAUR_ARMOR_2_AXES[\n]","$1GW_MINOTAUR_ARMOR_2_AXES`n")
	Data:=RegExReplace(Data,"iU)(0x5495[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MINOTAUR_ARMOR_2_FLAILS[\n]","$1GW_MINOTAUR_ARMOR_2_FLAILS`n")
	Data:=RegExReplace(Data,"iU)(0x5496[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MINOTAUR_ARMOR_AXE_AND_FLAIL[\n]","$1GW_MINOTAUR_ARMOR_AXE_AND_FLAIL`n")
	Data:=RegExReplace(Data,"iU)(0x5497[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MINOTAUR_2_AXES[\n]","$1GW_MINOTAUR_2_AXES`n")
	Data:=RegExReplace(Data,"iU)(0x5498[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MINOTAUR_2_FLAILS[\n]","$1GW_MINOTAUR_2_FLAILS`n")
	Data:=RegExReplace(Data,"iU)(0x5499[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MINOTAUR_AXE_AND_FLAIL[\n]","$1GW_MINOTAUR_AXE_AND_FLAIL`n")
	Data:=RegExReplace(Data,"iU)(0x549A[ \t]+.{0,9}CGAMEANIMATIONTYPE_)AMAZON_SCIMITAR[\n]","$1GW_AMAZON_SCIMITAR`n")
	Data:=RegExReplace(Data,"iU)(0x549B[ \t]+.{0,9}CGAMEANIMATIONTYPE_)AMAZON_FALCHION[\n]","$1GW_AMAZON_FALCHION`n")
	Data:=RegExReplace(Data,"iU)(0x549C[ \t]+.{0,9}CGAMEANIMATIONTYPE_)AMAZON_SABER[\n]","$1GW_AMAZON_SABER`n")
	Data:=RegExReplace(Data,"iU)(0x549D[ \t]+.{0,9}CGAMEANIMATIONTYPE_)AMAZON_AXE[\n]","$1GW_AMAZON_AXE`n")
	Data:=RegExReplace(Data,"iU)(0x549E[ \t]+.{0,9}CGAMEANIMATIONTYPE_)AMAZON_PIKE[\n]","$1GW_AMAZON_PIKE`n")
	Data:=RegExReplace(Data,"iU)(0x549F[ \t]+.{0,9}CGAMEANIMATIONTYPE_)AMAZON_TRIDENT[\n]","$1GW_AMAZON_TRIDENT`n")
	Data:=RegExReplace(Data,"iU)(0x54A0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)AMAZON_NOVICE[\n]","$1GW_AMAZON_NOVICE`n")
	Data:=RegExReplace(Data,"iU)(0x54A1[ \t]+.{0,9}CGAMEANIMATIONTYPE_)AMAZON_ARCHER[\n]","$1GW_AMAZON_ARCHER`n")
	Data:=RegExReplace(Data,"iU)(0x54A2[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PYGMY[\n]","$1GW_PYGMY`n")
	Data:=RegExReplace(Data,"iU)(0x54A3[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PYGMY_BLOWPIPE[\n]","$1GW_PYGMY_BLOWPIPE`n")
	Data:=RegExReplace(Data,"iU)(0x54A4[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DOOM_KNIGHT[\n]","$1GW_DOOM_KNIGHT`n")
	Data:=RegExReplace(Data,"iU)(0x54A5[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DOOM_KNIGHT_ONE_ARMED[\n]","$1GW_DOOM_KNIGHT_ONE_ARMED`n")
	Data:=RegExReplace(Data,"iU)(0x54A6[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DOOM_KNIGHT_BEHEADED[\n]","$1GW_DOOM_KNIGHT_BEHEADED`n")
	Data:=RegExReplace(Data,"iU)(0x54A7[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DOOM_KNIGHT_RIPPED_OUT[\n]","$1GW_DOOM_KNIGHT_RIPPED_OUT`n")
	Data:=RegExReplace(Data,"iU)(0x54A8[ \t]+.{0,9}CGAMEANIMATIONTYPE_)REANIMATED_HORDE[\n]","$1GW_REANIMATED_HORDE`n")
	Data:=RegExReplace(Data,"iU)(0x54A9[ \t]+.{0,9}CGAMEANIMATIONTYPE_)REANIMATED_HORDE_BEHEADED[\n]","$1GW_REANIMATED_HORDE_BEHEADED`n")
	Data:=RegExReplace(Data,"iU)(0x54AA[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DEMON_BABOON[\n]","$1GW_DEMON_BABOON`n")
	Data:=RegExReplace(Data,"iU)(0x54AB[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BAURIER_BROWN_PST[\n]","$1GW_BAURIER_BROWN_PST`n")
	Data:=RegExReplace(Data,"iU)(0x54AC[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BAURIER_CHESTNUT_PST[\n]","$1GW_BAURIER_CHESTNUT_PST`n")
	Data:=RegExReplace(Data,"iU)(0x54AD[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BAURIER_WHITE_PST[\n]","$1GW_BAURIER_WHITE_PST`n")
	Data:=RegExReplace(Data,"iU)(0x557C[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THORNED_HULK1[\n]","$1GW_THORNED_HULK1`n")
	Data:=RegExReplace(Data,"iU)(0x557D[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THORNED_HULK2[\n]","$1GW_THORNED_HULK2`n")
	Data:=RegExReplace(Data,"iU)(0x557E[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THORNED_HULK3[\n]","$1GW_THORNED_HULK3`n")
	Data:=RegExReplace(Data,"iU)(0x557F[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THORNED_HULK4[\n]","$1GW_THORNED_HULK4`n")
	Data:=RegExReplace(Data,"iU)(0x5580[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THORNED_HULK5[\n]","$1GW_THORNED_HULK5`n")
	Data:=RegExReplace(Data,"iU)(0x5581[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SNOW_YETI[\n]","$1GW_SNOW_YETI`n")
	Data:=RegExReplace(Data,"iU)(0x5582[ \t]+.{0,9}CGAMEANIMATIONTYPE_)REGURGITATOR[\n]","$1GW_REGURGITATOR`n")
	Data:=RegExReplace(Data,"iU)(0x5583[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MOSQUITO_NEST[\n]","$1GW_MOSQUITO_NEST`n")
	Data:=RegExReplace(Data,"iU)(0x5584[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SIEGE_BEAST[\n]","$1GW_SIEGE_BEAST`n")
	Data:=RegExReplace(Data,"iU)(0x5585[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DEMON_DURIEL[\n]","$1GW_DEMON_DURIEL`n")
	Data:=RegExReplace(Data,"iU)(0x5B00[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ELLESIME_WHITE-HAIRED[\n]","$1ELLESIME_WHITE`n")
	Data:=RegExReplace(Data,"iU)(0x5B09[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ANNIS[\n]","$1HAG_ANNIS`n")
	Data:=RegExReplace(Data,"iU)(0x5B0A[ \t]+.{0,9}CGAMEANIMATIONTYPE_)NIGHT_HAG[\n]","$1HAG_NIGHT`n")
	Data:=RegExReplace(Data,"iU)(0x5B0B[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GREEN_HAG[\n]","$1HAG_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0x5B0C[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SEA_HAG[\n]","$1HAG_SEA`n")
	Data:=RegExReplace(Data,"iU)(0x5B28[ \t]+.{0,9}CGAMEANIMATIONTYPE_)DESTRIER_BLACK_AND_WHITE[\n]","$1GW_DESTRIER_BLACK_AND_WHITE`n")
	Data:=RegExReplace(Data,"iU)(0x5C01[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FIRE_GIANT_2[\n]","$1GIANT_FIRE_2`n")
	Data:=RegExReplace(Data,"iU)(0x5C03[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FIRE_GIANT_FEMALE[\n]","$1GIANT_FIRE_FEMALE`n")
	Data:=RegExReplace(Data,"iU)(0x5C04[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FROST_GIANT_FEMALE[\n]","$1GIANT_FROST_FEMALE`n")
	Data:=RegExReplace(Data,"iU)(0x5D4C[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CURST_TOWNIE_FEMALE_PST[\n]","$1TOWNIE_CURST_FEMALE_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5D4D[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CURST_TOWNIE_MALE_PST[\n]","$1TOWNIE_CURST_MALE_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5D54[ \t]+.{0,9}CGAMEANIMATIONTYPE_)LARGE_THUG_PST[\n]","$1THUG_LARGE_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5D55[ \t]+.{0,9}CGAMEANIMATIONTYPE_)LOWER_CLASS_TOWNIE_FEMALE_PST[\n]","$1TOWNIE_LOWER_CLASS_FEMALE_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5D56[ \t]+.{0,9}CGAMEANIMATIONTYPE_)LOWER_CLASS_TOWNIE_MALE_PST[\n]","$1TOWNIE_LOWER_CLASS_MALE_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5D59[ \t]+.{0,9}CGAMEANIMATIONTYPE_)PROSTITUTE_PST[\n]","$1HARLOT_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5D61[ \t]+.{0,9}CGAMEANIMATIONTYPE_)UPPER_CLASS_TOWNIE_FEMALE_PST[\n]","$1TOWNIE_UPPER_CLASS_FEMALE_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5D62[ \t]+.{0,9}CGAMEANIMATIONTYPE_)UPPER_CLASS_TOWNIE_MALE_PST[\n]","$1TOWNIE_UPPER_CLASS_MALE_PST`n")
	Data:=RegExReplace(Data,"iU)(0x5FC4[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GOLEM_AMBER[\n]","$1GW_GOLEM_AMBER`n")
	Data:=RegExReplace(Data,"iU)(0x5FC5[ \t]+.{0,9}CGAMEANIMATIONTYPE_)UNICORN_WHITE[\n]","$1GW_UNICORN_WHITE`n")
	Data:=RegExReplace(Data,"iU)(0x5FC6[ \t]+.{0,9}CGAMEANIMATIONTYPE_)UNICORN_BLACK[\n]","$1GW_UNICORN_BLACK`n")
	Data:=RegExReplace(Data,"iU)(0x5FC7[ \t]+.{0,9}CGAMEANIMATIONTYPE_)UNICORN_NIGHTMARE[\n]","$1GW_UNICORN_NIGHTMARE`n")
	Data:=RegExReplace(Data,"iU)(0x5FC8[ \t]+.{0,9}CGAMEANIMATIONTYPE_)HORSE_BLACK_AND_WHITE[\n]","$1GW_HORSE_BLACK_AND_WHITE`n")
	Data:=RegExReplace(Data,"iU)(0x5FC9[ \t]+.{0,9}CGAMEANIMATIONTYPE_)HORSE_BAIE[\n]","$1GW_HORSE_BAIE`n")
	Data:=RegExReplace(Data,"iU)(0x5FCA[ \t]+.{0,9}CGAMEANIMATIONTYPE_)HORSE_CHESTNUT[\n]","$1GW_HORSE_CHESTNUT`n")
	Data:=RegExReplace(Data,"iU)(0x5FCB[ \t]+.{0,9}CGAMEANIMATIONTYPE_)HORSE_BLANKET_BAIE[\n]","$1GW_HORSE_BLANKET_BAIE`n")
	Data:=RegExReplace(Data,"iU)(0x5FCC[ \t]+.{0,9}CGAMEANIMATIONTYPE_)HORSE_GRULLO[\n]","$1GW_HORSE_GRULLO`n")
	Data:=RegExReplace(Data,"iU)(0x5FCD[ \t]+.{0,9}CGAMEANIMATIONTYPE_)HORSE_BLUE_ROANNED[\n]","$1GW_HORSE_BLUE_ROANNED`n")
	Data:=RegExReplace(Data,"iU)(0x5FCE[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WAR_HORSE_BAIE[\n]","$1GW_WAR_HORSE_BAIE`n")
	Data:=RegExReplace(Data,"iU)(0x5FCF[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WAR_HORSE_BAIE_AND_WHITE[\n]","$1GW_WAR_HORSE_BAIE_AND_WHITE`n")
	Data:=RegExReplace(Data,"iU)(0x5FD0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WAR_HORSE_BLACK[\n]","$1GW_WAR_HORSE_BLACK`n")
	Data:=RegExReplace(Data,"iU)(0x5FD1[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WAR_HORSE_GREY[\n]","$1GW_WAR_HORSE_GREY`n")
	Data:=RegExReplace(Data,"iU)(0x5FD2[ \t]+.{0,9}CGAMEANIMATIONTYPE_)TROLL_DARKNESS[\n]","$1GW_TROLL_DARKNESS`n")
	Data:=RegExReplace(Data,"iU)(0x5FD3[ \t]+.{0,9}CGAMEANIMATIONTYPE_)TROLL_SMALL_DARKNESS[\n]","$1GW_TROLL_SMALL_DARKNESS`n")
	Data:=RegExReplace(Data,"iU)(0x6410[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_CLERIC_MALE_HUMAN[\n]","$1CLERIC_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6411[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_CLERIC_FEMALE_HUMAN[\n]","$1CLERIC_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6412[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_CLERIC_MALE_ELF[\n]","$1CLERIC_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6413[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_CLERIC_FEMALE_ELF[\n]","$1CLERIC_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6414[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_CLERIC_MALE_DWARF[\n]","$1CLERIC_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6415[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_CLERIC_FEMALE_DWARF[\n]","$1CLERIC_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6416[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_CLERIC_MALE_HALFLING[\n]","$1CLERIC_MALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6417[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_CLERIC_FEMALE_HALFLING[\n]","$1CLERIC_FEMALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6420[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_FIGHTER_MALE_HUMAN[\n]","$1FIGHTER_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6421[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_FIGHTER_FEMALE_HUMAN[\n]","$1FIGHTER_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6422[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_FIGHTER_MALE_ELF[\n]","$1FIGHTER_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6423[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_FIGHTER_FEMALE_ELF[\n]","$1FIGHTER_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6424[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_FIGHTER_MALE_DWARF[\n]","$1FIGHTER_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6425[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_FIGHTER_FEMALE_DWARF[\n]","$1FIGHTER_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6426[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_FIGHTER_MALE_HALFLING[\n]","$1FIGHTER_MALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6427[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_FIGHTER_FEMALE_HALFLING[\n]","$1FIGHTER_FEMALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6430[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_MAGE_MALE_HUMAN[\n]","$1MAGE_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6431[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_MAGE_FEMALE_HUMAN[\n]","$1MAGE_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6432[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_MAGE_MALE_ELF[\n]","$1MAGE_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6433[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_MAGE_FEMALE_ELF[\n]","$1MAGE_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6434[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_MAGE_MALE_DWARF[\n]","$1MAGE_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6435[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_MAGE_FEMALE_DWARF[\n]","$1MAGE_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6440[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_THIEF_MALE_HUMAN[\n]","$1THIEF_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6441[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_THIEF_FEMALE_HUMAN[\n]","$1THIEF_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6442[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_THIEF_MALE_ELF[\n]","$1THIEF_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6443[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_THIEF_FEMALE_ELF[\n]","$1THIEF_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6444[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_THIEF_MALE_DWARF[\n]","$1THIEF_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6445[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_THIEF_FEMALE_DWARF[\n]","$1THIEF_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6446[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_THIEF_MALE_HALFLING[\n]","$1THIEF_MALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6447[ \t]+.{0,9}CGAMEANIMATIONTYPE_)L_THIEF_FEMALE_HALFLING[\n]","$1THIEF_FEMALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6410[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CLERIC_MALE_HUMAN_LOW[\n]","$1CLERIC_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6411[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CLERIC_FEMALE_HUMAN_LOW[\n]","$1CLERIC_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6412[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CLERIC_MALE_ELF_LOW[\n]","$1CLERIC_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6413[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CLERIC_FEMALE_ELF_LOW[\n]","$1CLERIC_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6414[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CLERIC_MALE_DWARF_LOW[\n]","$1CLERIC_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6415[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CLERIC_FEMALE_DWARF_LOW[\n]","$1CLERIC_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6416[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CLERIC_MALE_HALFLING_LOW[\n]","$1CLERIC_MALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6417[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CLERIC_FEMALE_HALFLING_LOW[\n]","$1CLERIC_FEMALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6420[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FIGHTER_MALE_HUMAN_LOW[\n]","$1FIGHTER_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6421[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FIGHTER_FEMALE_HUMAN_LOW[\n]","$1FIGHTER_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6422[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FIGHTER_MALE_ELF_LOW[\n]","$1FIGHTER_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6423[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FIGHTER_FEMALE_ELF_LOW[\n]","$1FIGHTER_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6424[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FIGHTER_MALE_DWARF_LOW[\n]","$1FIGHTER_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6425[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FIGHTER_FEMALE_DWARF_LOW[\n]","$1FIGHTER_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6426[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FIGHTER_MALE_HALFLING_LOW[\n]","$1FIGHTER_MALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6427[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FIGHTER_FEMALE_HALFLING_LOW[\n]","$1FIGHTER_FEMALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6430[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGE_MALE_HUMAN_LOW[\n]","$1MAGE_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6431[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGE_FEMALE_HUMAN_LOW[\n]","$1MAGE_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6432[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGE_MALE_ELF_LOW[\n]","$1MAGE_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6433[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGE_FEMALE_ELF_LOW[\n]","$1MAGE_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6434[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGE_MALE_DWARF_LOW[\n]","$1MAGE_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6435[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MAGE_FEMALE_DWARF_LOW[\n]","$1MAGE_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6440[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THIEF_MALE_HUMAN_LOW[\n]","$1THIEF_MALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6441[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THIEF_FEMALE_HUMAN_LOW[\n]","$1THIEF_FEMALE_HUMAN_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6442[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THIEF_MALE_ELF_LOW[\n]","$1THIEF_MALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6443[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THIEF_FEMALE_ELF_LOW[\n]","$1THIEF_FEMALE_ELF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6444[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THIEF_MALE_DWARF_LOW[\n]","$1THIEF_MALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6445[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THIEF_FEMALE_DWARF_LOW[\n]","$1THIEF_FEMALE_DWARF_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6446[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THIEF_MALE_HALFLING_LOW[\n]","$1THIEF_MALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x6447[ \t]+.{0,9}CGAMEANIMATIONTYPE_)THIEF_FEMALE_HALFLING_LOW[\n]","$1THIEF_FEMALE_HALFLING_BG1`n")
	Data:=RegExReplace(Data,"iU)(0x683D[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MOINESSE_MALE_HUMAN_BARBARIAN_1[\n]","$1MOINESSE_BARBARIAN_MALE_HUMAN`n")
	Data:=RegExReplace(Data,"iU)(0x683E[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MOINESSE_MALE_HUMAN_NINJA_1[\n]","$1MOINESSE_NINJA_MALE_HUMAN`n")
	Data:=RegExReplace(Data,"iU)(0x683F[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MOINESSE_MALE_EX-HUMAN_VAMPIRE_1[\n]","$1MOINESSE_VAMPIRE`n")
	Data:=RegExReplace(Data,"iU)(0x6841[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MOINESSE_FEMALE_ELF_MAGE_1[\n]","$1MOINESSE_MAGE_FEMALE_ELF`n")
	Data:=RegExReplace(Data,"iU)(0x6845[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MOINESSE_FEMALE_HUMAN_DRUID_4[\n]","$1MOINESSE_DRUID_FEMALE_HUMAN`n")
	Data:=RegExReplace(Data,"iU)(0x6846[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MOINESSE_FEMALE_HUMAN_FIGHTER_4[\n]","$1MOINESSE_FIGHTER_FEMALE_HUMAN`n")
	Data:=RegExReplace(Data,"iU)(0x6847[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MOINESSE_FEMALE_HUMAN_MAGE_3[\n]","$1MOINESSE_MAGE_FEMALE_HUMAN`n")
	Data:=RegExReplace(Data,"iU)(0x6848[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MOINESSE_FEMALE_HUMAN_THIEF_1[\n]","$1MOINESSE_THIEF_FEMALE_HUMAN`n")
	Data:=RegExReplace(Data,"iU)(0x7000[ \t]+.{0,9}CGAMEANIMATIONTYPE_)OGRE_HALF[\n]","$1HALF_OGRE`n")
	Data:=RegExReplace(Data,"iU)(0x7701[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GHOUL_REVEANT[\n]","$1REVENANT`n")
	Data:=RegExReplace(Data,"iU)(0x7701[ \t]+.{0,9}CGAMEANIMATIONTYPE_)REVEANT[\n]","$1REVENANT`n")
	Data:=RegExReplace(Data,"iU)(0x7702[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GHOUL_GHAST[\n]","$1GHAST`n")
	Data:=RegExReplace(Data,"iU)(0x7703[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GHOUL_SHADOW[\n]","$1SHADOW`n")
	Data:=RegExReplace(Data,"iU)(0x7B04[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WOLF_VAMPIRE[\n]","$1WOLF_VAMPIRIC`n")
	Data:=RegExReplace(Data,"iU)(0x7F09[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SAHAUGIN[\n]","$1SAHUAGIN`n")
	Data:=RegExReplace(Data,"iU)(0x7F23[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SAHAUGIN_LARGE[\n]","$1SAHUAGIN_LARGE`n")
	Data:=RegExReplace(Data,"iU)(0x7F2C[ \t]+.{0,9}CGAMEANIMATIONTYPE_)AMISH_SOLDIER[\n]","$1AMNIAN_SOLDIER`n")
	Data:=RegExReplace(Data,"iU)(0x7F2C[ \t]+.{0,9}CGAMEANIMATIONTYPE_)AMNISH_SOLDIER[\n]","$1AMNIAN_SOLDIER`n")
	Data:=RegExReplace(Data,"iU)(0x7F3A[ \t]+.{0,9}CGAMEANIMATIONTYPE_)HULA_WIZARD[\n]","$1IRENICUS_ROBED`n")
	Data:=RegExReplace(Data,"iU)(0x7F3C[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ANTISOLAR[\n]","$1DEVA_MONADIC`n")
	Data:=RegExReplace(Data,"iU)(0x7F3E[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FIRE_GIANT[\n]","$1GIANT_FIRE`n")
	Data:=RegExReplace(Data,"iU)(0x7F3F[ \t]+.{0,9}CGAMEANIMATIONTYPE_)FIRE_GIANT_YAGA_SHURA[\n]","$1GIANT_YAGA-SHURA`n")
	Data:=RegExReplace(Data,"iU)(0xA100[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CARRIONCRAWLER[\n]","$1CARRION_CRAWLER`n")
	Data:=RegExReplace(Data,"iU)(0xA101[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SHARK_LEOPARD[\n]","$1GW_SHARK_LEOPARD`n")
	Data:=RegExReplace(Data,"iU)(0xE000[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CYCLOP[\n]","$1CYCLOPS`n")
	Data:=RegExReplace(Data,"iU)(0xE010[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_ETTIN[\n]","$1ETTIN`n")
	Data:=RegExReplace(Data,"iU)(0xE050[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_LICHBLACK[\n]","$1LICH_BLACK`n")
	Data:=RegExReplace(Data,"iU)(0xE050[ \t]+.{0,9}CGAMEANIMATIONTYPE_)LICHBLACK[\n]","$1LICH_BLACK`n")
	Data:=RegExReplace(Data,"iU)(0xE060[ \t]+.{0,9}CGAMEANIMATIONTYPE_)LICH_IWD[\n]","$1LICH_WHITE`n")
	Data:=RegExReplace(Data,"iU)(0xE070[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_MINOTAUR[\n]","$1MINOTAUR`n")
	Data:=RegExReplace(Data,"iU)(0xE080[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_MUMMY[\n]","$1MUMMY`n")
	Data:=RegExReplace(Data,"iU)(0xE090[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_MERILITH[\n]","$1MARILITH`n")
	Data:=RegExReplace(Data,"iU)(0xE090[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MERILITH[\n]","$1MARILITH`n")
	Data:=RegExReplace(Data,"iU)(0xE0A0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ICE_TROLL[\n]","$1TROLL_ICE`n")
	Data:=RegExReplace(Data,"iU)(0xE0B0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_TROLL1[\n]","$1TROLL_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0xE0B0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)TROLL1_IWD[\n]","$1TROLL_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0xE0C0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SNOW_TROLL[\n]","$1TROLL_SNOW`n")
	Data:=RegExReplace(Data,"iU)(0xE0D0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)UMBERHULK_IWD[\n]","$1UMBER_HULK_ELDER`n")
	Data:=RegExReplace(Data,"iU)(0xE0E0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)CORNUGONSKI[\n]","$1CORNUGON`n")
	Data:=RegExReplace(Data,"iU)(0xE0E0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_CORNUGONSKI[\n]","$1CORNUGON`n")
	Data:=RegExReplace(Data,"iU)(0xE0F0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_ICE_GOLEM[\n]","$1GOLEM_ICE`n")
	Data:=RegExReplace(Data,"iU)(0xE0F0[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ICE_GOLEM[\n]","$1GOLEM_ICE`n")
	Data:=RegExReplace(Data,"iU)(0xE0F1[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_GLAB[\n]","$1GLABREZU`n")
	Data:=RegExReplace(Data,"iU)(0xE0F2[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_WAILING_VIRGIN[\n]","$1WAILING_VIRGIN`n")
	Data:=RegExReplace(Data,"iU)(0xE200[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BEETLE[\n]","$1BEETLE_BORING`n")
	Data:=RegExReplace(Data,"iU)(0xE200[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BEETLE_COPPER[\n]","$1BEETLE_BORING`n")
	Data:=RegExReplace(Data,"iU)(0xE220[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BEETLE_BLACK[\n]","$1BEETLE_BOMBARDIER`n")
	Data:=RegExReplace(Data,"iU)(0xE220[ \t]+.{0,9}CGAMEANIMATIONTYPE_)BEETLE_BOMBADIER[\n]","$1BEETLE_BOMBARDIER`n")
	Data:=RegExReplace(Data,"iU)(0xE300[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GHOST_IWD[\n]","$1GHOST`n")
	Data:=RegExReplace(Data,"iU)(0xE310[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GHOUL_IWD[\n]","$1GHOUL_GREATER`n")
	Data:=RegExReplace(Data,"iU)(0xE320[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GHAST_IWD[\n]","$1GHAST_GREATER`n")
	Data:=RegExReplace(Data,"iU)(0xE400[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_GOBLIN_AXE[\n]","$1GOBLIN_AXE`n")
	Data:=RegExReplace(Data,"iU)(0xE410[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_GOBLIN_BOW[\n]","$1GOBLIN_BOW`n")
	Data:=RegExReplace(Data,"iU)(0xE420[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GOBLINELITE_AXE[\n]","$1GOBLIN_ELITE_AXE`n")
	Data:=RegExReplace(Data,"iU)(0xE420[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_GOBLINELITE_AXE[\n]","$1GOBLIN_ELITE_AXE`n")
	Data:=RegExReplace(Data,"iU)(0xE430[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GOBLINELITE_BOW[\n]","$1GOBLIN_ELITE_BOW`n")
	Data:=RegExReplace(Data,"iU)(0xE430[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_GOBLINELITE_BOW[\n]","$1GOBLIN_ELITE_BOW`n")
	Data:=RegExReplace(Data,"iU)(0xE500[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_LIZARDCASTER1[\n]","$1LIZARD_MAN_ELITE`n")
	Data:=RegExReplace(Data,"iU)(0xE500[ \t]+.{0,9}CGAMEANIMATIONTYPE_)LIZARDCASTER1[\n]","$1LIZARD_MAN_ELITE`n")
	Data:=RegExReplace(Data,"iU)(0xE500[ \t]+.{0,9}CGAMEANIMATIONTYPE_)LIZARDMAN_BROWN[\n]","$1LIZARD_MAN_ELITE`n")
	Data:=RegExReplace(Data,"iU)(0xE510[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_LIZARDCASTER2[\n]","$1LIZARD_MAN`n")
	Data:=RegExReplace(Data,"iU)(0xE510[ \t]+.{0,9}CGAMEANIMATIONTYPE_)LIZARDCASTER2[\n]","$1LIZARD_MAN`n")
	Data:=RegExReplace(Data,"iU)(0xE510[ \t]+.{0,9}CGAMEANIMATIONTYPE_)LIZARDMAN_GREEN[\n]","$1LIZARD_MAN`n")
	Data:=RegExReplace(Data,"iU)(0xE520[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_LIZARDCASTER3[\n]","$1LIZARD_KING`n")
	Data:=RegExReplace(Data,"iU)(0xE520[ \t]+.{0,9}CGAMEANIMATIONTYPE_)LIZARDCASTER3[\n]","$1LIZARD_KING`n")
	Data:=RegExReplace(Data,"iU)(0xE600[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_MYCONID[\n]","$1MYCONID_RED`n")
	Data:=RegExReplace(Data,"iU)(0xE600[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MYCONID[\n]","$1MYCONID_RED`n")
	Data:=RegExReplace(Data,"iU)(0xE610[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_MYCONID2[\n]","$1MYCONID_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0xE610[ \t]+.{0,9}CGAMEANIMATIONTYPE_)MYCONID2[\n]","$1MYCONID_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0xE700[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_OROG1[\n]","$1OROG`n")
	Data:=RegExReplace(Data,"iU)(0xE700[ \t]+.{0,9}CGAMEANIMATIONTYPE_)OROG1[\n]","$1OROG`n")
	Data:=RegExReplace(Data,"iU)(0xE710[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_OROG2[\n]","$1OROG_ELITE`n")
	Data:=RegExReplace(Data,"iU)(0xE710[ \t]+.{0,9}CGAMEANIMATIONTYPE_)OROG2[\n]","$1OROG_ELITE`n")
	Data:=RegExReplace(Data,"iU)(0xE720[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_OROG3[\n]","$1OROG_CHIEFTAIN`n")
	Data:=RegExReplace(Data,"iU)(0xE720[ \t]+.{0,9}CGAMEANIMATIONTYPE_)OROG3[\n]","$1OROG_CHIEFTAIN`n")
	Data:=RegExReplace(Data,"iU)(0xE800[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_ORC_MELEE1[\n]","$1ORC_MELEE`n")
	Data:=RegExReplace(Data,"iU)(0xE800[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ORC_MELEE1[\n]","$1ORC_MELEE`n")
	Data:=RegExReplace(Data,"iU)(0xE810[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_ORC_RANGE2[\n]","$1ORC_RANGE`n")
	Data:=RegExReplace(Data,"iU)(0xE810[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ORC_RANGE2[\n]","$1ORC_RANGE`n")
	Data:=RegExReplace(Data,"iU)(0xE820[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_ORC_MELEE3[\n]","$1ORC_ELITE_MELEE`n")
	Data:=RegExReplace(Data,"iU)(0xE820[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ORC_MELEE3[\n]","$1ORC_ELITE_MELEE`n")
	Data:=RegExReplace(Data,"iU)(0xE830[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_ORC_RANGE4[\n]","$1ORC_ELITE_RANGE`n")
	Data:=RegExReplace(Data,"iU)(0xE830[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ORC_RANGE4[\n]","$1ORC_ELITE_RANGE`n")
	Data:=RegExReplace(Data,"iU)(0xE840[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_ORC_SHAMAN[\n]","$1ORC_SHAMAN`n")
	Data:=RegExReplace(Data,"iU)(0xE900[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_SALAMANDER[\n]","$1SALAMANDER_FIRE`n")
	Data:=RegExReplace(Data,"iU)(0xE900[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SALAMANDER[\n]","$1SALAMANDER_FIRE`n")
	Data:=RegExReplace(Data,"iU)(0xE910[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_SALAMANDER2[\n]","$1SALAMANDER_FROST`n")
	Data:=RegExReplace(Data,"iU)(0xE910[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SALAMANDER2[\n]","$1SALAMANDER_FROST`n")
	Data:=RegExReplace(Data,"iU)(0xEA00[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_SHROOM[\n]","$1SHRIEKER`n")
	Data:=RegExReplace(Data,"iU)(0xEA00[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SHROOM[\n]","$1SHRIEKER`n")
	Data:=RegExReplace(Data,"iU)(0xEA10[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GHOST_SHADOW[\n]","$1SHADOW_SMALL`n")
	Data:=RegExReplace(Data,"iU)(0xEA10[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SHADE_IWD[\n]","$1SHADOW_SMALL`n")
	Data:=RegExReplace(Data,"iU)(0xEA10[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SHADOW_SMALL_IWD[\n]","$1SHADOW_SMALL`n")
	Data:=RegExReplace(Data,"iU)(0xEA20[ \t]+.{0,9}CGAMEANIMATIONTYPE_)GHOST_SHADE[\n]","$1SHADOW_LARGE`n")
	Data:=RegExReplace(Data,"iU)(0xEA20[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SHADE2_IWD[\n]","$1SHADOW_LARGE`n")
	Data:=RegExReplace(Data,"iU)(0xEA20[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SHADOW_LARGE_IWD[\n]","$1SHADOW_LARGE`n")
	Data:=RegExReplace(Data,"iU)(0xEB00[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_SKELETON0[\n]","$1SKELETON_MONSTER`n")
	Data:=RegExReplace(Data,"iU)(0xEB00[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SKELETON0[\n]","$1SKELETON_MONSTER`n")
	Data:=RegExReplace(Data,"iU)(0xEB10[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_SKELETONA[\n]","$1SKELETON_WARRIOR`n")
	Data:=RegExReplace(Data,"iU)(0xEB10[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SKELETONA[\n]","$1SKELETON_WARRIOR`n")
	Data:=RegExReplace(Data,"iU)(0xEB20[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_SKELETONB[\n]","$1SKELETON_FIEND`n")
	Data:=RegExReplace(Data,"iU)(0xEB20[ \t]+.{0,9}CGAMEANIMATIONTYPE_)SKELETONB[\n]","$1SKELETON_FIEND`n")
	Data:=RegExReplace(Data,"iU)(0xEC00[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WIGHT[\n]","$1WIGHT_GRAY`n")
	Data:=RegExReplace(Data,"iU)(0xEC10[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WIGHT_LESSER[\n]","$1WIGHT_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0xEC10[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WIGHT2[\n]","$1WIGHT_GREEN`n")
	Data:=RegExReplace(Data,"iU)(0xEC20[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WIGHT_GREATER[\n]","$1WIGHT_YELLOW`n")
	Data:=RegExReplace(Data,"iU)(0xEC20[ \t]+.{0,9}CGAMEANIMATIONTYPE_)WIGHT3[\n]","$1WIGHT_YELLOW`n")
	Data:=RegExReplace(Data,"iU)(0xED00[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_YUANTI[\n]","$1YUAN-TI`n")
	Data:=RegExReplace(Data,"iU)(0xED00[ \t]+.{0,9}CGAMEANIMATIONTYPE_)YUANTI[\n]","$1YUAN-TI`n")
	Data:=RegExReplace(Data,"iU)(0xED10[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_YUANTI2[\n]","$1YUAN-TI_ELITE`n")
	Data:=RegExReplace(Data,"iU)(0xED10[ \t]+.{0,9}CGAMEANIMATIONTYPE_)YUANTI2[\n]","$1YUAN-TI_ELITE`n")
	Data:=RegExReplace(Data,"iU)(0xED20[ \t]+.{0,9}CGAMEANIMATIONTYPE_)IC_YUANTI3[\n]","$1YUAN-TI_PRIEST`n")
	Data:=RegExReplace(Data,"iU)(0xED20[ \t]+.{0,9}CGAMEANIMATIONTYPE_)YUANTI3[\n]","$1YUAN-TI_PRIEST`n")
	Data:=RegExReplace(Data,"iU)(0xEE00[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ZOMBIE_IWD[\n]","$1ZOMBIE_YELLOW`n")
	Data:=RegExReplace(Data,"iU)(0xEE00[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ZOMBIE_LESSER[\n]","$1ZOMBIE_YELLOW`n")
	Data:=RegExReplace(Data,"iU)(0xEE00[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ZOMBIE_YELLOW_IWD[\n]","$1ZOMBIE_YELLOW`n")
	Data:=RegExReplace(Data,"iU)(0xEE10[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ZOMBIE_BLUE_IWD[\n]","$1ZOMBIE_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0xEE10[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ZOMBIE_GREATER[\n]","$1ZOMBIE_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0xEE10[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ZOMBIE2_IWD[\n]","$1ZOMBIE_BLUE`n")
	Data:=RegExReplace(Data,"iU)(0xEF10[ \t]+.{0,9}CGAMEANIMATIONTYPE_)ELEMENTAL_WATER[\n]","$1WATER_WEIRD`n")
	
	Sort, Data
	Data:=Trim(Data,"`r`n")
	Return Data
}

FormatNameBGII(Name){
	Name:=Format("{:U}",Name)
	Name:=StrReplace(Name,A_Space,"_")
	Name:=StrReplace(Name,",","")
	Name:=StrReplace(Name,"__","_")
	Return Name
}

FormatNameIWD(Name){
	Name:=StrReplace(Name,"_",A_Space)
	Name:=Format("{:T}",Name)
	For k,v in [" NWN"," IWD"," PC"," NPC"," IWDII"," IWD2"," PST"," PS:T"," BGI"," BGII"," BG1"," BG2","GW "]
		Name:=StrReplace(Name,v,v)
	Return Name
}

FormatWeiDUIDS(IDS,Name){
	HexIDS:=IDS:=StrReplace(Format("{:U}",GUIAnimationList["_" IDS,"IDS"]),"0X","0x"), Label:=GUIAnimationList["_" IDS,"Label"], Name:=FormatNameBGII(Name), Ret:={}
	For k,v in ["A","B","C","D","E","F"]
		HexIDS:=StrReplace(HexIDS,v,"[" v Format("{:L}",v) "]")
	Ret["AnimateStr"]:=AnimateStr:=IDS A_Space Name
	Ret["AnisndStr"]:=AnisndStr:=IDS A_Space Format("{:-9}",Label) "CGAMEANIMATIONTYPE_" Name
	Ret["WeiDUStr"]:="APPEND ~animate.ids~ ~" AnimateStr "~ UNLESS ~^" HexIDS "~`r`n" "APPEND ~anisnd.ids~ ~" AnisndStr "~ UNLESS ~^" HexIDS "~"
	Return Ret
}

FormatInputName(Name){
	Name:=StrReplace(Name," SMALL","_SMALL")
	Name:=StrReplace(Name," TINY","_TINY")
	Name:=StrReplace(Name," LARGE","_LARGE")
	Name:=StrReplace(Name," HUGE","_HUGE")
	Name:=StrReplace(Name," NORMAL","_NORMAL")
	Return Name
}


GetFileList(Type,Palette){
	Global ID
	If (Type="BGI MONSTER LONG")
		Return GetLangStr("T104")	;//16 Directions unmirrored (10 + 6E)`n%ID%G1 %ID%G1E // 16 Seq.`n%ID%G2 %ID%G2E // 80 Seq.`n%ID%G3 %ID%G3E // 48 Seq.
	If (Type="BGI MONSTER LONG 4 PART")
		Return GetLangStr("T105")	;//16 Directions unmirrored (10 + 6E)`n%ID%G11 %ID%G11E %ID%G12 %ID%G12E %ID%G13 %ID%G13E %ID%G14 %ID%G14E // 16 Seq.`n%ID%G21 %ID%G21E %ID%G22 %ID%G22E %ID%G23 %ID%G23E %ID%G24 %ID%G24E // 80 Seq.`n%ID%G31 %ID%G31E %ID%G32 %ID%G32E %ID%G33 %ID%G33E %ID%G34 %ID%G34E // 48 Seq.
	If (Type="DRAGONS (XDR)")
		Return GetLangStr("T106")	;//9 Directions mirrored`n9 Animation parts`n5 Animations (5: 1 split no base; 4: 2 split)`nAnimation + Part + Split + Direction`n%ID%1100  %ID%1101  %ID%1102  %ID%1103  %ID%1104  %ID%1105  %ID%1106  %ID%1107  %ID%1108  %ID%1200  %ID%1201  %ID%1202  %ID%1203  %ID%1204  %ID%1205  %ID%1206  %ID%1207  %ID%1208  %ID%1300  %ID%1301  %ID%1302  %ID%1303  %ID%1304  %ID%1305  %ID%1306  %ID%1307  %ID%1308  %ID%1400  %ID%1401  %ID%1402  %ID%1403  %ID%1404  %ID%1405  %ID%1406  %ID%1407  %ID%1408  %ID%1500  %ID%1501  %ID%1502  %ID%1503  %ID%1504  %ID%1505  %ID%1506  %ID%1507  %ID%1508  %ID%1600  %ID%1601  %ID%1602  %ID%1603  %ID%1604  %ID%1605  %ID%1606  %ID%1607  %ID%1608  %ID%1700  %ID%1701  %ID%1702  %ID%1703  %ID%1704  %ID%1705  %ID%1706  %ID%1707  %ID%1708  %ID%1800  %ID%1801  %ID%1802  %ID%1803  %ID%1804  %ID%1805  %ID%1806  %ID%1807  %ID%1808  %ID%1900  %ID%1901  %ID%1902  %ID%1903  %ID%1904  %ID%1905  %ID%1906  %ID%1907  %ID%1908`n%ID%2100  %ID%2101  %ID%2102  %ID%2103  %ID%2104  %ID%2105  %ID%2106  %ID%2107  %ID%2108  %ID%2200  %ID%2201  %ID%2202  %ID%2203  %ID%2204  %ID%2205  %ID%2206  %ID%2207  %ID%2208  %ID%2300  %ID%2301  %ID%2302  %ID%2303  %ID%2304  %ID%2305  %ID%2306  %ID%2307  %ID%2308  %ID%2400  %ID%2401  %ID%2402  %ID%2403  %ID%2404  %ID%2405  %ID%2406  %ID%2407  %ID%2408  %ID%2500  %ID%2501  %ID%2502  %ID%2503  %ID%2504  %ID%2505  %ID%2506  %ID%2507  %ID%2508  %ID%2600  %ID%2601  %ID%2602  %ID%2603  %ID%2604  %ID%2605  %ID%2606  %ID%2607  %ID%2608  %ID%2700  %ID%2701  %ID%2702  %ID%2703  %ID%2704  %ID%2705  %ID%2706  %ID%2707  %ID%2708  %ID%2800  %ID%2801  %ID%2802  %ID%2803  %ID%2804  %ID%2805  %ID%2806  %ID%2807  %ID%2808  %ID%2900  %ID%2901  %ID%2902  %ID%2903  %ID%2904  %ID%2905  %ID%2906  %ID%2907  %ID%2908`n%ID%3100  %ID%3101  %ID%3102  %ID%3103  %ID%3104  %ID%3105  %ID%3106  %ID%3107  %ID%3108  %ID%3200  %ID%3201  %ID%3202  %ID%3203  %ID%3204  %ID%3205  %ID%3206  %ID%3207  %ID%3208  %ID%3300  %ID%3301  %ID%3302  %ID%3303  %ID%3304  %ID%3305  %ID%3306  %ID%3307  %ID%3308  %ID%3400  %ID%3401  %ID%3402  %ID%3403  %ID%3404  %ID%3405  %ID%3406  %ID%3407  %ID%3408  %ID%3500  %ID%3501  %ID%3502  %ID%3503  %ID%3504  %ID%3505  %ID%3506  %ID%3507  %ID%3508  %ID%3600  %ID%3601  %ID%3602  %ID%3603  %ID%3604  %ID%3605  %ID%3606  %ID%3607  %ID%3608  %ID%3700  %ID%3701  %ID%3702  %ID%3703  %ID%3704  %ID%3705  %ID%3706  %ID%3707  %ID%3708  %ID%3800  %ID%3801  %ID%3802  %ID%3803  %ID%3804  %ID%3805  %ID%3806  %ID%3807  %ID%3808  %ID%3900  %ID%3901  %ID%3902  %ID%3903  %ID%3904  %ID%3905  %ID%3906  %ID%3907  %ID%3908`n%ID%4100  %ID%4101  %ID%4102  %ID%4103  %ID%4104  %ID%4105  %ID%4106  %ID%4107  %ID%4108  %ID%4110  %ID%4111  %ID%4112  %ID%4113  %ID%4114  %ID%4115  %ID%4116  %ID%4117  %ID%4118  %ID%4120  %ID%4121  %ID%4122  %ID%4123  %ID%4124  %ID%4125  %ID%4126  %ID%4127  %ID%4128  %ID%4200  %ID%4201  %ID%4202  %ID%4203  %ID%4204  %ID%4205  %ID%4206  %ID%4207  %ID%4208  %ID%4210  %ID%4211  %ID%4212  %ID%4213  %ID%4214  %ID%4215  %ID%4216  %ID%4217  %ID%4218  %ID%4220  %ID%4221  %ID%4222  %ID%4223  %ID%4224  %ID%4225  %ID%4226  %ID%4227  %ID%4228  %ID%4300  %ID%4301  %ID%4302  %ID%4303  %ID%4304  %ID%4305  %ID%4306  %ID%4307  %ID%4308  %ID%4310  %ID%4311  %ID%4312  %ID%4313  %ID%4314  %ID%4315  %ID%4316  %ID%4317  %ID%4318  %ID%4320  %ID%4321  %ID%4322  %ID%4323  %ID%4324  %ID%4325  %ID%4326  %ID%4327  %ID%4328  %ID%4400  %ID%4401  %ID%4402  %ID%4403  %ID%4404  %ID%4405  %ID%4406  %ID%4407  %ID%4408  %ID%4410  %ID%4411  %ID%4412  %ID%4413  %ID%4414  %ID%4415  %ID%4416  %ID%4417  %ID%4418  %ID%4420  %ID%4421  %ID%4422  %ID%4423  %ID%4424  %ID%4425  %ID%4426  %ID%4427  %ID%4428  %ID%4500  %ID%4501  %ID%4502  %ID%4503  %ID%4504  %ID%4505  %ID%4506  %ID%4507  %ID%4508  %ID%4510  %ID%4511  %ID%4512  %ID%4513  %ID%4514  %ID%4515  %ID%4516  %ID%4517  %ID%4518  %ID%4520  %ID%4521  %ID%4522  %ID%4523  %ID%4524  %ID%4525  %ID%4526  %ID%4527  %ID%4528  %ID%4600  %ID%4601  %ID%4602  %ID%4603  %ID%4604  %ID%4605  %ID%4606  %ID%4607  %ID%4608  %ID%4610  %ID%4611  %ID%4612  %ID%4613  %ID%4614  %ID%4615  %ID%4616  %ID%4617  %ID%4618  %ID%4620  %ID%4621  %ID%4622  %ID%4623  %ID%4624  %ID%4625  %ID%4626  %ID%4627  %ID%4628  %ID%4700  %ID%4701  %ID%4702  %ID%4703  %ID%4704  %ID%4705  %ID%4706  %ID%4707  %ID%4708  %ID%4710  %ID%4711  %ID%4712  %ID%4713  %ID%4714  %ID%4715  %ID%4716  %ID%4717  %ID%4718  %ID%4720  %ID%4721  %ID%4722  %ID%4723  %ID%4724  %ID%4725  %ID%4726  %ID%4727  %ID%4728  %ID%4800  %ID%4801  %ID%4802  %ID%4803  %ID%4804  %ID%4805  %ID%4806  %ID%4807  %ID%4808  %ID%4810  %ID%4811  %ID%4812  %ID%4813  %ID%4814  %ID%4815  %ID%4816  %ID%4817  %ID%4818  %ID%4820  %ID%4821  %ID%4822  %ID%4823  %ID%4824  %ID%4825  %ID%4826  %ID%4827  %ID%4828  %ID%4900  %ID%4901  %ID%4902  %ID%4903  %ID%4904  %ID%4905  %ID%4906  %ID%4907  %ID%4908  %ID%4910  %ID%4911  %ID%4912  %ID%4913  %ID%4914  %ID%4915  %ID%4916  %ID%4917  %ID%4918  %ID%4920  %ID%4921  %ID%4922  %ID%4923  %ID%4924  %ID%4925  %ID%4926  %ID%4927  %ID%4928`n%ID%5110  %ID%5111  %ID%5112  %ID%5113  %ID%5114  %ID%5115  %ID%5116  %ID%5117  %ID%5118  %ID%5210  %ID%5211  %ID%5212  %ID%5213  %ID%5214  %ID%5215  %ID%5216  %ID%5217  %ID%5218  %ID%5310  %ID%5311  %ID%5312  %ID%5313  %ID%5314  %ID%5315  %ID%5316  %ID%5317  %ID%5318  %ID%5410  %ID%5411  %ID%5412  %ID%5413  %ID%5414  %ID%5415  %ID%5416  %ID%5417  %ID%5418  %ID%5510  %ID%5511  %ID%5512  %ID%5513  %ID%5514  %ID%5515  %ID%5516  %ID%5517  %ID%5518  %ID%5610  %ID%5611  %ID%5612  %ID%5613  %ID%5614  %ID%5615  %ID%5616  %ID%5617  %ID%5618  %ID%5710  %ID%5711  %ID%5712  %ID%5713  %ID%5714  %ID%5715  %ID%5716  %ID%5717  %ID%5718  %ID%5810  %ID%5811  %ID%5812  %ID%5813  %ID%5814  %ID%5815  %ID%5816  %ID%5817  %ID%5818  %ID%5910  %ID%5911  %ID%5912  %ID%5913  %ID%5914  %ID%5915  %ID%5916  %ID%5917  %ID%5918
	If (Type="BGII SPLIT")
		Return GetLangStr("T107")	;//9 Directions mirrored`n%ID%G1 %ID%G11 %ID%G12 %ID%G13 %ID%G14 %ID%G15 // 54 Seq.`n%ID%G2 %ID%G21 %ID%G22 %ID%G23 %ID%G24 %ID%G25 %ID%G26 // 63 Seq.`n`n+ Object/s
	If (Type="BGII SPLIT 4 PART")
		Return GetLangStr("T108")	;//9 Directions mirrored`n%ID%G11 %ID%G12 %ID%G13 %ID%G14 // 54 Seq.`n%ID%G111 %ID%G121 %ID%G131 %ID%G141 // 54 Seq.`n%ID%G112 %ID%G122 %ID%G132 %ID%G142 // 54 Seq.`n%ID%G113 %ID%G123 %ID%G133 %ID%G143 // 54 Seq.`n%ID%G114 %ID%G124 %ID%G134 %ID%G144 // 54 Seq.`n%ID%G115 %ID%G125 %ID%G135 %ID%G145 // 54 Seq.`n`n%ID%G21 %ID%G22 %ID%G23 %ID%G24 // 63 Seq.`n%ID%G211 %ID%G221 %ID%G231 %ID%G241 // 63 Seq.`n%ID%G212 %ID%G222 %ID%G232 %ID%G242 // 63 Seq.`n%ID%G213 %ID%G223 %ID%G233 %ID%G243 // 63 Seq.`n%ID%G214 %ID%G224 %ID%G234 %ID%G244 // 63 Seq.`n%ID%G215 %ID%G225 %ID%G235 %ID%G245 // 63 Seq.`n%ID%G216 %ID%G226 %ID%G236 %ID%G246 // 63 Seq.
	If (Type="BGI SIMPLE CASTER (S1)") OR (Type="BGI SIMPLE CASTER (BOW)")
		Return GetLangStr("T109")	;//8 Directions unmirrored (5 + 3E)`n%ID%G1 %ID%G1E // 48 Seq.`n%ID%G2 %ID%G2E // 24 Seq.`n`n+B/S
	If (Type="BROKEN ANKHEG")
		Return GetLangStr("T110")	;//8 Directions unmirrored (5 + 3E)`n%ID%G1 %ID%G1E %ID%DG1 %ID%DG1E// 32 Seq.`n%ID%G2 %ID%G2E %ID%DG1 %ID%DG1E// 24 Seq.`n%ID%G3 %ID%G3E %ID%DG1 %ID%DG1E// 16 Seq.
	If (Type="IWD LARGE") OR (Type="IWD SMALL")
		Return GetLangStr("T111")	;//8 Directions unmirrored (5 + 3E)`n%ID%A1 %ID%A1E %ID%A2 %ID%A2E %ID%A3 %ID%A3E %ID%A4 %ID%A4E // 5 Seq. 8 Seq. resp.`n%ID%CA %ID%CAE // 5 Seq. 8 Seq. resp.`n%ID%DE %ID%DEE // 5 Seq. 8 Seq. resp.`n%ID%GH %ID%GHE // 5 Seq. 8 Seq. resp.`n%ID%GU %ID%GUE // 5 Seq. 8 Seq. resp.`n%ID%SC %ID%SCE // 5 Seq. 8 Seq. resp.`n%ID%SD %ID%SDE // 5 Seq. 8 Seq. resp.`n%ID%SL %ID%SLE // 5 Seq. 8 Seq. resp.`n%ID%SP %ID%SPE // 5 Seq. 8 Seq. resp.`n%ID%TW %ID%TWE // 5 Seq. 8 Seq. resp.`n%ID%WK %ID%WKE // 5 Seq. 8 Seq. resp.`n`n+ Object/s
	If (Type="BGI SIMPLE MONSTER")
		Return GetLangStr("T112")	;//8 Directions unmirrored (5 + 3E)`n%ID%G1 %ID%G1E // 48 Seq.`n%ID%G2 %ID%G2E // 24 Seq.
	If (Type="BGII UNSPLIT EXT.")
		Return GetLangStr("T113")	;//9 Directions mirrored`n%ID%G1 // 72 Seq.`n%ID%G2 // 63 Seq.`n`n+ Object/s
	If (Type="CHARACTER BGI")
		{
		List:=GetLangStr("T114")	;//8 Directions unmirrored (5 + 3E)`n%ID%1A1 %ID%1A1E %ID%1A2 %ID%1A2E %ID%1A3 %ID%1A3E %ID%1A4 %ID%1A4E %ID%1A5 %ID%1A5E %ID%1A6 %ID%1A6E %ID%1SA %ID%1SAE %ID%1SX %ID%1SXE // 8 Seq. (A1 has 16)`n%ID%1CA %ID%1CAE // 62/64 Seq.`n%ID%1G1 %ID%1G1E // 72 Seq.`n%ID%1W2 %ID%1W2E // 8 Seq.`n`n%ID%2A1 %ID%2A1E %ID%2A2 %ID%2A2E %ID%2A3 %ID%2A3E %ID%2A4 %ID%2A4E %ID%2A5 %ID%2A5E %ID%2A6 %ID%2A6E %ID%2SA %ID%2SAE %ID%2SX %ID%2SXE // 8 Seq. (A1 has 16)`n%ID%2CA %ID%2CAE // 62/64 Seq.`n%ID%2G1 %ID%2G1E // 72 Seq.`n%ID%2W2 %ID%2W2E // 8 Seq.`n`n%ID%3A1 %ID%3A1E %ID%3A2 %ID%3A2E %ID%3A3 %ID%3A3E %ID%3A4 %ID%3A4E %ID%3A5 %ID%3A5E %ID%3A6 %ID%3A6E %ID%3SA %ID%3SAE %ID%3SX %ID%3SXE // 8 Seq. (A1 has 16)`n%ID%3CA %ID%3CAE // 62/64 Seq.`n%ID%3G1 %ID%3G1E // 72 Seq.`n%ID%3W2 %ID%3W2E // 8 Seq.`n`n%ID%4A1 %ID%4A1E %ID%4A2 %ID%4A2E %ID%4A3 %ID%4A3E %ID%4A4 %ID%4A4E %ID%4A5 %ID%4A5E %ID%4A6 %ID%4A6E %ID%4SA %ID%4SAE %ID%4SX %ID%4SXE // 8 Seq. (A1 has 16)`n%ID%4CA %ID%4CAE // 62/64 Seq.`n%ID%4G1 %ID%4G1E // 72 Seq.`n%ID%4W2 %ID%4W2E // 8 Seq.`n`n+ CSHD`n+ Object/s`n`n+Object/s`n
		If InStr(Palette,"WPL")
			List.=GetLangStr("T115")	;//"`nUses WPL/WPLINV animations"
		Else If InStr(Palette,"WPM")
			List.=GetLangStr("T116")	;//"`nUses WPM/WPMINV animations"
		Else If InStr(Palette,"WPS")
			List.=GetLangStr("T117")	;//"`nUses WPS/WPSINV animations"
		Else
			List.=GetLangStr("T118") A_Space SubStr(ID,2) "/" SubStr(ID,2) GetLangStr("T119")	;//"`nUses " SubStr(ID,2) "/" SubStr(ID,2) "INV object animations"
		Return List
		}
	If (Type="CHARACTER BGII")
		{
		List:=GetLangStr("T120")	;//9 Directions mirrored`n%ID%1A1 %ID%1A2 %ID%1A3 %ID%1A4 %ID%1A5 %ID%1A6 %ID%1A7 %ID%1A8 %ID%1A9 %ID%1SA %ID%1SS %ID%1SX // 9 Seq.`n%ID%1CA // 72 Seq.`n%ID%1G1 // 99 Seq.`n`n%ID%2A1 %ID%2A2 %ID%2A3 %ID%2A4 %ID%2A5 %ID%2A6 %ID%2A7 %ID%2A8 %ID%2A9 %ID%2SA %ID%2SS %ID%2SX // 9 Seq.`n%ID%2CA // 72 Seq.`n%ID%2G1 // 99 Seq.`n`n%ID%3A1 %ID%3A2 %ID%3A3 %ID%3A4 %ID%3A5 %ID%3A6 %ID%3A7 %ID%3A8 %ID%3A9 %ID%3SA %ID%3SS %ID%3SX // 9 Seq.`n%ID%3CA // 72 Seq.`n%ID%3G1 // 99 Seq.`n`n%ID%4A1 %ID%4A2 %ID%4A3 %ID%4A4 %ID%4A5 %ID%4A6 %ID%4A7 %ID%4A8 %ID%4A9 %ID%4SA %ID%4SS %ID%4SX // 9 Seq.`n%ID%4CA // 72 Seq.`n%ID%4G1 // 99 Seq.`n`n+Object/s`n
		If InStr(Palette,"WQL")
			List.=GetLangStr("T121")	;//"`nUses WQL/WPLINV animations"
		Else If InStr(Palette,"WQN")
			List.=GetLangStr("T122")	;//"`nUses WQN/WPNINV animations"
		Else If InStr(Palette,"WQM")
			List.=GetLangStr("T123")	;//"`nUses WQM/WPMINV animations"
		Else If InStr(Palette,"WQS")
			List.=GetLangStr("T124")	;//"`nUses WQS/WPSINV animations"
		Else
			List.=GetLangStr("T118") A_Space (SID:=SubStr(ID,2)) "/" SubStr(SID,1,1) "P" SubStr(SID,0,1) GetLangStr("T119")	;//"`nUses " (SID:=SubStr(ID,2)) "/" SubStr(SID,1,1) "P" SubStr(SID,0,1) "INV object animations"
		Return List
		}
}


;;;;; Translation Handling Functions ;;;;;
Deref(Var){
	Transform, DereffedVar, Deref, %Var%
	Return DereffedVar
}

GetLangStr(TVar){
	Return Deref(T[TVar])
}

LoadTranslation(){
	IniRead, Language, %A_ScriptDir%\Config.txt, Program, UseLang, English
	Value:=""
	While (Value<>"ERROR")
		{
		IniRead, Value, %A_ScriptDir%\lang\%Language%.txt, %Language%, T%A_Index%
		T["T" A_Index]:=Value
		}
}

;;;;; Core Background Functions ;;;;;

st_printArr(array, depth=5, indentLevel=""){
	list:=""
   for k,v in Array
   {
      list.= indentLevel "[" k "]"
      if (IsObject(v) && depth>1)
         list.="`r`n" st_printArr(v, depth-1, indentLevel . "    ")
      Else
         list.=" => " v
      list.="`r`n"
   }
   return rtrim(list)
}
ArrayHasCommonValue(ByRef Array1,ByRef Array2){ ; array must be a Simple, linear or non-linear array -- keys are integers
	If !(Len1:=Array1.Count()) OR !(Len2:=Array2.Count()) ; Either array has no keys
		Return 0
	If (Len1<Len2)
		Short:=Array1, Long:=Array2
	Else
		Long:=Array1, Short:=Array2
	For key1, val1 in Short
		For key2, val2 in Long
			If (val1=val2)
				Return 1
	Return 0
}
FormatStr(String:="",Filler:="",Length:=0,Justify:="R"){
	tmp:=""
	Loop, % Length
		tmp.=Filler
	If (Justify="R")
		Return SubStr(tmp String,(Length-1)*-1)
	Else If (Justify="C")
		Return (StrLen(String)>=Length?SubStr(String tmp,1,Length):SubStr(SubStr(tmp,1,(Length-StrLen(String))//2) String tmp,1,Length))
	Else ;If (Justify="L")
		Return SubStr(String tmp,1,Length)
}
MoveControl(hCtrl,vOffX:=0,vOffY:=0){
	hDlg1:=DllCall("user32\GetAncestor", Ptr,hCtrl, UInt,1, Ptr) ;GA_PARENT := 1
	WinGetPos, vWinX, vWinY,,, % "ahk_id " hDlg1
	WinGetPos, vCtlX, vCtlY,,, % "ahk_id " hCtrl
	vCtlX-=vWinX, vCtlY-=vWinY
	;~ vOffX:=TargetClientX-vCtlX, vOffY:=TargetClientY-vCtlY
	Return vCoords:=Format("x{} y{}", vCtlX+vOffX, vCtlY+vOffY)
	GuiControl, Move, % "ahk_id " hCtrl, % vCoords
	
}

#Include %A_ScriptDir%\lib\
#Include Dock.ahk
#Include MemoryFileIO.ahk
#Include PS_Progress.ahk
#Include PS_ExceptionHandler.ahk
