
![Latest Release](https://img.shields.io/github/v/release/SpellholdStudios/Infinity-Animations?include_prereleases&color=darkred)<a name="top" id="top"> </a>
![Platform](https://img.shields.io/static/v1?label=platform&message=windows%20%7C%20linux&color=informational)
![Language](https://img.shields.io/static/v1?label=language&message=English%20%7C%20French&color=limegreen)
<a href="README_FR.md"><img align="right" src="infinityanimations/documentation/images/fr-flag-32.png" title="Readme français"></a>


<div align="center"><h1>Infinity Animations (WIP)</h1>

<h3>A Spellhold Studios mod for Baldur's Gate II:ToB (original and EE games),<br>
Baldur's Gate Trilogy, Tutu, BG:EE, SoD, IWD:EE and EET<h3>


</div><br />


**Author:** Erephine  
**Mod Website:** <a href="http://www.spellholdstudios.net/ie/infinityanimations">Spellhold Studios</a>  
**Mod forum:** <a href="http://www.shsforums.net/forum/594-infinity-animations/">Infinity Animations</a>  

## 

:warning: Readme writing in progress... Don't try to download and install this mod as it is a WIP version and its install will fail, because of missing files still in development or in beta testing

## 

[Read the mod's readme](https://spellholdstudios.github.io/readmes/infinityanimations/documentation/infinityanimations-readme-english.html)

[Download the mod at Spellhold Studios](http://www.shsforums.net/files/category/98-infinity-animations/)<br>

## 

<div align="center">
<a href="#intro">Overview</a> &#x2B25; <a href="#compat">Compatibility</a> &#x2B25; <a href="#installation">Installation</a> &#x2B25; <a href="#components">Components</a> &#x2B25; <a href="#0">Mod Details</a> &#x2B25; <a href="#anims">Animations</a> &#x2B25; <a href="#credits">Credits</a> &#x2B25; <a href="#version">Version History</a></br>
</div>


<hr>


## <a name="intro" id="intro"></a>Overview

This mod patches Baldur's Gate II: Throne of Bhaal to support additional creature and character animations (referred to as 'animation slots'). It also offers a dynamic automated process for claiming new animation slots. Thus, it acts as a central hub, usable by anyone who would like to add animation entries to the game without being bogged down by issues of mod conflicts and incompatibilities.

Infinity Animations supports a wide variety of animation types from Baldur's Gate I, Baldur's Gate II, Icewind Dale I, Icewind Dale II, Planescape: Torment and Neverwinter Nights. As an added bonus, the mod restores Baldur's Gate I character animations in their entirety, and paperdolls have been unlocked for some animations that did not support them previously.

An important feature for players who use several large mods (known as 'megamods') is a resolution of animation conflicts, and a restoration of standard animations that megamods have overwritten.


Finally, this mod contains optional components that implement many new animations into the game. Ongoing work will address sound sets for new animations. While the number of supported animations may not be 'infinite' as the name suggests, it should be large enough to accommodate everyone's present (and in all likelihood future) needs.

**Key features:**
- Restores Baldur's Gate I character animations
- Improves paperdoll support for existing animations
- Adds custom game animations for characters and creatures (including dragons)
- Allows use of many different animation *types* (some never before seen in the games)
- Resolves the problems of animation stacking, slot and naming conflicts
- Offers GUI support for adding new animations
- Lets you watch as the percentage of free animation entries refuses to go down &#128578;
<div align="right"><a href="#top">Back to top</a></div>


<hr>


## <a name="compat" id="compat"></a>Compatibility

Infinity Animations is designed to work on most Infinity Engine games. This includes:

- The series of Enhanced Editions published by Beamdog, which at present includes Baldur's Gate: Enhanced Edition (BGEE), Baldur's Gate II: Enhanced Edition (BG2EE) and Icewind Dale: Enhanced Edition (IWDEE). The BGEE Siege of Dragonspear expansion (SoD) is supported as well. All of the Enhanced Edition games include the original expansion packs, e.g. IWDEE includes Heart of Winter (HoW) and Trials of the Luremaster (TotLM)..
- The original Baldur's Gate II (BG2, or just SoA) with the Throne of Bhaal (ToB) expansion. **Make sure you have Throne of Bhaal patched to version 26498.** Check the ReadMe files related to your patch in your game folder and the <a href="http://www.bioware.com/games/throne_bhaal/support/patches/">BioWare</a> website if necessary.
- The conversion projects based on ToB: <a href="http://www.shsforums.net/forum/261-bgt-weidu/">Baldur's Gate Trilogy (BGT)</a> <a href="https://www.pocketplane.net/bg1tutu/">Baldur's Gate Tutu</a> (Tutu) and <a href="https://github.com/K4thos/EET/releases">Enhanced Edition Trilogy</a> (EET).

This is a WeiDU mod, and therefore should be compatible with all WeiDU mods. However, we cannot test every single one. Though we are striving to make Infinity Animations compatible with as many other mods as possible, there is always a chance that incompatibilities will arise. If you encounter any bugs, please <a href="http://www.shsforums.net/forum/594-infinity-animations/">report them on the forum!</a>

Install it after most other mods, particularly those that add creatures or animations, but before any final "biffing" routines.

Modders who wish to make their mods compatible with IA are strongly recommended to read the <a href="">Note for modders</a> which guides them through each step of accomplishing particular modding tasks without breaking compatibility.

>Although it is not required for the 1pp mod to function properly, TOB players are strongly recommended to download and install the latest version of the <a href="http://www.gibberlings3.net/bg2fixpack/">BG2 Fixpack</a> before proceeding with the installation of this mod.<br>

**Start a new game** after installing this mod, or use the "Saved Game Animation Fixer" component if you're reluctant to do that.</br>
<div align="right"><a href="#top">Back to top</a></div>


<hr>


## <a name="installation" id="installation"></a>Installation

#### Notes

*If you've previously installed the mod, remove it before extracting the new version. To do this, run **`setup-infinityanimations.exe`**, un-install all previously installed main component and delete the :file_folder: **infinityanimations** folder.*

*When installing or un-installing, **do not close the DOS window** by clicking on the **X** button! Instead, press the **Enter** key whenever instructed to do so.*

*__Disable any antivirus__ or other memory-resident software before installing this or any other mod. Some (particularly avast and Norton!) have a tendency to report false positives with mod activity, resulting in failed installs.*

You can extract files from the archive using <a href="http://www.7-zip.org/download.html">7zip</a>, <a href="http://www.rarlab.com/download.htm">WinRAR</a>, <a href="http://www.zipgenius.it/ita/?page_id=12">ZipGenius</a> or another file compression utility that handles .zip files.

<details><summary>DEPRECATED as of v 6.0.0</summary>
<p></br>
<strong>Important:</strong> Download all content you may require from the Infinity Animations download category at <a href="http://www.shsforums.net/files/category/98-infinity-animations/">Spellhold Studios</a>. If in doubt, download them all (most megamod installs will need all archives). Extract all archives using the "<em>Do not extract paths</em>" option on the <strong>Advanced</strong> tab in WinRAR. Also, make sure the "Destination path" on the <strong>General</strong> tab terminates in <strong>/content</strong> or <strong>/restore</strong> after <strong>infinityanimations</strong> (there should be no sub-folders beyond that).

<p>Extract all archives to the &#x1F4C1; /content folder except IA_BG2_Restores.rar, which should go in the &#x1F4C1; /restore folder. If you extract IA_Wh_Dr_Wyv_LoP.rar (currently only needed for the Planar Sphere mod), you can delete the sub-archive The_Lady's_Shadow.rar after extraction, as it is currently unused due to animation size limitations.</p>

For WinZip, make sure the "Use folder names" box is *unselected*.

You should end up with a bunch of .bam files and no sub-folders in your &#x1F4C1; "content" and/or "restore" folders. The installer will warn you if you're missing anything you need, at which point you can exit it, download missing content, extract it and rerun the installer.
</p>
</details>

## 

#### Special Note for Siege of Dragonspear from Steam/GOG</h3>

Good Old Games (GOG) and Steam both package the additional content for Siege of Dragonspear in a method that WeiDU, the tool used to install this mod, cannot access. You must run a program called <a href="https://github.com/Argent77/A7-DlcMerger/releases/latest">DLC Merger</a> on your SoD installation before you can install this or any other WeiDU-based mod.

## 

#### Enhanced Editions Note

The Enhanced Editions are actively supported games. Please note that every patch update will wipe your current mod setup! If in the middle of a modded game you might want to delay the patch update (if possible) as even after reinstalling the mods, you might not be able to continue with your old savegames. Alternatively, copy the whole game's folder into a new one that can be modded and will stay untouched by game patches. It is important that you install the mod to the language version you are playing the game in. Otherwise, the dialogues of the mod will not show but give error messages.

## 

#### Windows

Infinity Animations for Windows is distributed as an extractable compressed archive and includes a WeiDU installer.

Extract the contents of the mod archive into the folder of the game you wish to modify (*the folder which contains the "CHITIN.KEY" file*). On successful extraction, there should be a :file_folder: infinityanimations folder and a setup-infinityanimations.exe file in your game folder. To install, simply double-click **`setup-infinityanimations.exe`** and follow the instructions on screen.

Run **`setup-infinityanimations.exe`** in your game folder to reinstall, un-install or otherwise change components.

## 

#### Mac OS X

:warning: Unfortunately, this mod is not currently fully compatible with OS X because a few components patching exe file do not support OS X. If you wish to make it so, please post your interest in the <a href="http://www.shsforums.net/forum/594-infinity-animations/">forum</a>. (It may help to examine your game launcher and the contents of the existing patch in an editor if you have any technical expertise.)

&#128541; However, since EE games don't need to be patched to benefit from Infinity Animations, it can be installed on Mac OS X EE games.

Infinity Animations for EE for Mac OS X is distributed in the same compressed archive and includes a WeiDU installer.

First, extract the files from the archive into your game directory. On successful extraction, there should be a :file_folder: infinityanimations folder, setup-infinityanimations and setup-infinityanimations.command files in your game folder. To install, double-click **`setup-infinityanimations.command`** and follow the instructions on screen.

You can run **`setup-infinityanimations.command`** in your game folder to reinstall, un-install or otherwise the components settings.

## 

#### Linux

Infinity Animations for Linux is distributed in the same compressed archive and does not include a WeiDU installer.

Extract the contents of the mod to the folder of the game you wish to modify.

Download the latest version of WeiDU for Linux from <a href="https://github.com/WeiDUorg/weidu/releases">WeiDU</a> and copy weidu and weinstall to `/usr/bin`. Following that, open a terminal, **`cd`** to your game installation directory, run tolower and answer 'Y' to both queries. You can avoid running the second option (linux.ini) if you've already ran it once in the same directory. To save time, the archive is already tolowered, so there's no need to run the first option (lowercasing file names) either if you've extracted only this mod since the last time you lowercased file names. If you're unsure, running tolower and choosing both options is the safe bet.

To install, run **`weinstall setup-infinityanimations`** in your game folder. Then run **`wine bgmain.exe`** (or **`wine baldur.exe`** for EE games), and start playing.

## 

#### Note for Complete Un-installation

In addition to the methods above for removing individual components, you can completely un-install the mod using **`setup-infinityanimations --uninstall`** at the command line to remove all components without wading through prompts.

## 

#### <a name="config" id="config">:warning: Warning: new installation process

##### As of version 6.0.0, options needed for installation are read from <a href="infinityanimations/infinityanimations-config-default.ini">infinityanimations-config-default.ini</a> file, or *infinityanimations-config-user.ini* if it exists.

The previous versions needed all required content to be downloaded from the Infinity Animations download category at <a href="http://www.shsforums.net/files/category/98-infinity-animations/">Spellhold Studios</a> and extracted into the infinityanimations :file_folder: **content** or :file_folder: **restore** subfolders. The installer warned you if you were missing anything you need, at which point you could exit it, download missing content, extract it and rerun the installer.

From now on, the content needed by Infinity Animations is included in the :file_folder: **archives** folder and automatically copied by the main component into your :file_folder: **override** folder. Being useless, the respective :file_folder: *content* and :file_folder: *restore* sub-folders have been removed.

By default, the whole archives folder content will be installed. If you want to define your own customized installation, you have to edit **_infinityanimations-config-default.ini_** (found in :file_folder: infinityanimations folder) with Notepad or another text editor, then save it as **_infinityanimations-config-user.ini_**.

Each line consists of an installation option, then '=', then a number. The only thing you should edit is the number. For example, if you don't want to use svirneblins animations, change the ia_iwd_svirfneblin value to 0.

The installation process will read both ini files and prioritize user's options values. If a value is not set or mismatched in infinityanimations-config-user.ini, any installation failure will be prevented by reverting it back to its default value.

If you want to install a component requiring files that you decided not to install, the installer will install them automatically if there are still in the :file_folder: archives folder. Otherwise, it will warn you. In this case, you will have to exit the installer, extract them in your mod folder, and rerun the installer.<br>
Following the above example, if you indeed wish the svirneblins get the svirneblins animations after having set ia_iwd_svirfneblin option to 0, the installer will force their installation if it finds them in :file_folder: archives folder. If not, it will warn you to extract them before installing the component.

Here is a chart listing the options related to the installation process:</br></br>


<table summary="Installation variables list">
	<tr style="font-size: 125%; line-height: 300%;">
		<th>Variable</th>
		<th>Description</th>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_bg2_restores</strong></td>
		<td><ins>IA Content - BG2 Restores</ins><br><br>
		- Content: Goblin elite with axe (MGO3), Goblin elite with bow (MGO4), Lich (MLIC), Lich black (MLER), Marilith (MTAN), Myconid blue (MMY2), Orc elite melee (MOR3), Orog (MNO1), Orog elite (MNO2), Static spider woman (MSPL). Includes relevant creature sound tables.<br>
		- This is the content module for BG2 restored slots. It is only necessary for a megamod install which has overwritten these slots, which are: BP, BoneHill, CtB, Drizzt Saga, NEJ2, RoT, SOS, TDD, TS, TS-BP, Sheena, Planar Sphere and RPG KitsPack mods.<br><br>
		<em>Installation forced only if needed [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_ee_restore</strong><br><br>
		(supports: only EE)</td>
		<td><ins>IA Content - Base EE Content (New)</ins><br><br>
		- Content: all missing animations that already have animation slots in Enhanced games, restored BG I character animations. Includes all relevant missing creature sounds and ini files.<br>
		- Needed for all EE games (BGEE, SoD, BG2EE, IWDEE, EET).<br>
		- Needed for all components.<br><br>
		<em>Installation by default</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_base_anims</strong></td>
		<td><ins>IA Content 001 - Base Content</ins><br><br>
		- Content: Basilisk and Tasloi animations, the missing IWD animations that already have animation slots in BGII (Beetle bombardier, Beetle boring, Beetle fire, Beetle rhinoceros, Cyclops, Ghast greater, Ghost, Ghoul greater, Histachii, Lich white, Lizard man, Lizard King, Shadow small, Shadow large, Troll ice, Troll snow, Umber hulk elder, Wight gray, Wight green, Wight yellow, Zombie blue, Zombie yellow), restored BG I character animations. Includes all relevant creature sounds and tables and BG1 scimitars.<br>
		- Needed for Distinctive Undead [400], More Base Animations [500], BG1 Character Animations for NPCs [8000-8010-8020-8030] and for Exported PCs [9500-9510-9520] components.<br>
		- Needed for BP, CtB, Drizzt Saga, NEJ, RoT, SOS, TDD, TS and RPG Kitspack mods.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_belhifet_and_marilith</strong></td>
		<td><ins>IA Content - IWD Belhifet and Marilith</ins><br><br>
		- Content: animation and audio files for the IWD Belhifet and IWD Marilith. Includes properly-slotted creature sounds and tables.<br>
		- Needed for Drizzt Saga, RoT, TDD, TS and TS-BP mods.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_bg2_iwd2</strong></td>
		<td><ins>IA Content 002 - IWDII and unused BGII Animations</ins><br><br>
		- Content: all IWD II animations that are neither in BGII (Death Tyrant, Alternate Ellesime, Alternate Fire Giant, Lagoon Creature) or IWD (Abishai White, Arctic Boar, Bugbear, Bugbear Captain, Chimera, Dark Treant, Drider male/female, Elemental Water Small, Feyr lesser/greater, Fomorian Giant, IWD II goblins, Goblin Worgrider, Goblin Worgrider Captain, Half-dragon black/red, Hook Horror, Isair, Kegs, Lemure, Madae, Malarite, Orog Shaman, Shenrical, Undead Orcs, Werebadger, Wererat, Worg, Yuan-Ti Halfbreed). Includes all relevant creature sounds and tables.<br>
		- Needed for Cambion get Isair Animation [210-230], Alu-Fiends get Madae Animation [260-280] and More Icewind Dale II Animations [600] components.<br>
		- Needed for BP, CtB, NEJ, Planar Sphere, RoT and Sheena mods.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_ee_tob</strong><br><br>
		(supports: only ToB)</td>
		<td><ins>IA Content - EE games new Animations ported to ToB (New)</ins><br><br>
		- Content: Boar Wild, Bugbear Shaman, Crusader Soldier, Dog Gray, Dragon Green IWD, Dragon Green Juvenile, Dragon Red Juvenile, Dragon Green Young, Dragon Silver Young, Dragon White Young, Drowned Dead Red, Ettin Ghost, Fiend Red, Giant Hill, Gibberling Brood, Goblins Mkhiin (common, with bow, with staff, with armor and axe, with armor and bow), Goblin Worg Elite, Goblin Worg Shaman, Golem Mini, Halfdragon Green, Hephernaan, Megalocentipede, Black Pudding, Red Wizard, Sailor Dark, Sailor Green, Sailor Red, Snake Water, Spider Water, Troll Scrag, Troll Spectral, Tunnel Worm, Wyrmling Albino, Wyvern White. Includes all relevant creature sounds and tables.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_fiends_genies</strong></td>
		<td><ins>IA Content - Fiends and Genies</ins><br><br>
		- Content: Fiend green (Nabassu), Fiend blue, Marilith Dark, Maurezhi, Myrlochar, Dao, Dao with legs, Efreeti, Efreeti with legs, Janni, Janni with legs, Marid, Marid with legs, Ghoul queen, Hag Annis, Night Hag, Green Hag, Sea Hag, Yochlol. Includes Erinyes, Gelugon and Tieflings sound files.<br>
		- Needed for Distinctive Genies [50] and Distinctive Fiends [100] components.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_iwd</strong></td>
		<td><ins>IA Content - Remaining IWD Animations</ins><br><br>
		- Content: Remaining IWD animations not in the other archives (Animated Plate bronze/dark/green, Arundel, Barbarian Shaman hammer/staff/club, Barbarian Warrior tan/red/brown, Barbarian Icasaracht, Belhifet Priest, Creeping Doom, Drowned Dead, Elemental Earth/Water/Fire, Fire Giant IWD, Iron Golem IWD, Remorhaz, Sahuagin small/large, Seer, Tundra Yeti, Umber Hulk Vodyanoi, Verbeeg, Wight Barrow). Includes all relevant creature sounds and tables.<br>
		- Needed for Distinctive Fiends [100], Distinctive Undead [400], Skeleton Warriors [410-415-420], Seer Animation [450-455-460] and More Icewind Dale Animations [550] components.<br>
		- Needed for BP, BH, CtB, NEJ, RoT, SOS and TS mods.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_iwd_svirfneblin</strong></td>
		<td><ins>IA Content - IWD Svirfneblin</ins><br><br>
		- Content: IWD/IWD2 animations for svirfneblin (deep gnomes). By default, they are pale (flesh-coloured) whereas in canon references, they should be darker (stone-coloured). The original game had variants with and without pickaxes (they do not display separate weapon animations). Since these slots are unpaletted, there are alternates as follows (the last two being custom variants of the IWD pale animations): Svirfneblin pale with axe, Svirfneblin pale without axe, Svirfneblin dark with axe, Svirfneblin dark without axe. Includes gnome sounds ported from NWN.<br>
		- Needed for Svirfneblin Animations [480-490] component.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_moinesse_edits_iaised</strong><br><br>
		(supports: only ToB)</td>
		<td><ins>IA Content - Moinesse's Avatar Edits (IA compatible version)</ins><br><br>
		- Content: Female Elf Mage, Female Human Druid, Female Human Fighter, Female Human Mage, Female Human Thief, Male Human Barbarian, Male Human Ninja, Male Vampire.<br>
		- Needed for Moinesse's Avatars for IA [7000-7010-7020-7030] component.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_moinesse_edits_iaised_ee</strong><br><br>
		(supports: only EE)</td>
		<td><ins>IA Content - Moinesse's Avatar Edits (IA compatible version)</ins><br><br>
		Same content as above, but EE games compatible.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_nwn_01_modron</strong></td>
		<td><ins>IA Content - WoRm's NWN Ports and Alternate Modron</ins><br><br>
		- Content: Alternate Modron, WoRm's NWN ports (Amel, Basilisk, Bebilith, Hamatula, Osyluth, Pit Fiend, Scarecrow, Vedred). Includes all relevant creature sounds and tables.<br>
		- Needed for Distinctive Fiends [100], Pit Fiends [150-175] and More Neverwinter Nights Animations [650] components; and for RPG Kitspack mod.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_nwn_misc_1</strong></td>
		<td><ins>IA Content - Miscellaneous NWN Animations I</ins></ins><br><br>
		- Content: Bombardier Beetle, Displacer Beast, Female Fire and Frost Giants, Succubus (with object animations), Bovine Axe Thing (don't ask). Includes all relevant creature sounds and tables.<br>
		- Needed for Distinctive Fiends [100] and More Neverwinter Nights Animations [650] components; and for RPG Kitspack mod.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_pst_abishai</strong></td>
		<td><ins>IA Content - PST Abishai</ins><br><br>
		- Content: Black Abishai, Blue Abishai, Green Abishai, Red Abishai (based on PS:T animations). Includes creature sounds.<br>
		- Needed for Distinctive Fiends [100] component.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_pst_paletted</strong></td>
		<td><ins>IA Content - PST Paletted Animations</ins><br><br>
		- Content: Aasimar Female, Baurier Male, Curst Townie Female, Curst Townie Male, Dustman Female, Dustman Male, Ghoul Female, Ghoul Male, Githzerai, Godsman, Large Thug, Lower Class Townie Female, Lower Class Townie Male, Merchant, Midwife, Prostitute, Skeleton Priest, Skeleton Worker, Thokola, Thug, Tiefling Female, Tiefling Male, Townie Wizard, Upper Class Townie Female, Upper Class Townie Male, Zombie Female, Zombie Male. Includes animation sound clips.<br>
		- Needed for More Planescape: Torment Animations [710-720-760-740] component.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_shadows_harpy_frostgiant</strong></td>
		<td><ins>IA Content - Shadows, Harpy and Frost Giant</ins><br><br>
		- Content: Alternate ("murky") Shadows, Harpy and Frost Giant from IWD. Includes all relevant creature sounds and tables.<br>
		- Needed for Distinctive Undead [400] component; and for BP, Drizzt Saga, NEJv691, RoT, TDD and TS mods.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_wh_dr_wyv_lop</strong></td>
		<td><ins>IA Content - White Wyvern and Dragon, Lady of Pain</ins><br><br>
		- Content: IWD White Dragon, IWD White Wyvern large, Lady of Pain. Includes all relevant creature sounds and tables.<br>
		- Needed for Planar Sphere mod.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
	<tr>
		<td><div align="center"><strong>ia_modders</strong></td>
		<td><ins>IA Content - Modders resources (New)</ins><br><br>
		- Content: Brow Chicken (Jarl), jastey's Wolfhound, Pack Mule (Kwiat_W); D2 Bear, D2 Werebear, Butcher animation from Heroes of the Storm, Giant Bee, Elemental Ice, Sunnis Princess of Earth Elementals and Zaaman Rul Prince of Fire Elementals (Ulb); small snake, small snake green and small snake red (Gwendolyne). Includes all relevant creature sounds and tables.<br>
		- Plus more to come.<br><br>
		0 = Don't install<br>
		<em>1 = Install [default]</em></td>
	</tr>
</table><br>
<div align="right"><a href="#top">Back to top</a></div>


<hr>


## <a name="components" id="components"></a>Components

The installer includes the following components. The number of each is the component *`DESIGNATED`* number which gives it a fixed install position, lets other components detect it and allows automated installers to specify component choices.

><span style="margin-left: 50px;"><a href="#0">[0] Infinity Animations</a> <em>&nbsp;&nbsp;&nbsp;[main component]</em></span></br>

><span style="margin-left: 50px;"><a href="#25">[25] Humanoid Animation Fixes</a></span></br>
><span style="margin-left: 50px;"><a href="#50">[50] Distinctive Genies</a></span></br>
><span style="margin-left: 50px;"><a href="#100">[100] Distinctive Fiends</a></span></br>
><span style="margin-left: 50px;"><a href="#150">[150-175] Pit Fiends</a></span></br>
><span style="margin-left: 50px;"><a href="#210">[210-230] Cambions get Isair Animation</a></span></br>
><span style="margin-left: 50px;"><a href="#260">[260-280] Alu-Fiends get Madae Animation</a></span></br>
><span style="margin-left: 50px;"><a href="#400">[400] Distinctive Undead</a></span></br>
><span style="margin-left: 50px;"><a href="#410">[410-415-420] Skeleton Warriors</a></span></br>
><span style="margin-left: 50px;"><a href="#450">[450-455-460] Seer Animation</a></span></br>
><span style="margin-left: 50px;"><a href="#480">[480-490] Svirneblin Animations</a></span></br>
><span style="margin-left: 50px;"><a href="#500">[500] More Base Animations</a></span></br>
><span style="margin-left: 50px;"><a href="#550">[550] More Icewind Dale Animations</a></span></br>
><span style="margin-left: 50px;"><a href="#600">[600] More Icewind Dale II Animations</a></span></br>
><span style="margin-left: 50px;"><a href="#650">[650] More Neverwinter Nights Animations</a></span></br>
><span style="margin-left: 50px;"><a href="#710">[710-720-730-740] More Planescape: Torment Animations</a></span></br>
><span style="margin-left: 50px;"><a href="#7000">[7000-7010-7020-7030] Moinesse's Avatars for IA</a></span></br>
><span style="margin-left: 50px;"><a href="#8000">[8000-8010-8020-8030] BG1 Character Animations for NPCs</a></span></br>

><span style="margin-left: 50px;"><a href="#9000">[9000] Fix Area Creature References</a></span></br>

><span style="margin-left: 50px;"><a href="#9500">[9500-9510-9520] BG1 Character Animations for PCs</a></span></br>

><span style="margin-left: 50px;"><a href="#9600">[9600-9610-9620] BG1 Character Animations for Saved Games</a></span></br>
><span style="margin-left: 50px;"><a href="#9900">[9900-9910] Saved Game Animation Fixer</a></span></br>


###### All components require the main component (they need to since it's the one that installs new content). All components are otherwise optional. Also note that no component affects joinable NPCs, something best left to individual modder discretion. (Hence, if something says it affects all female tieflings, it doesn't include Amber and Fade in that.)</br>
<div align="right"><a href="#top">Back to top</a></div>

------------------------

<a name="0" id="0"></a>&#10173; **[0] Infinity Animations (main component)**
###### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<em>Requires ToB v26498</em><br><br>

- Checks mod files
- ToB only: Checks .exe validity, backs up and patches the .exe
- Replaces _LOW creature animations
- Updates .ids files
- Restores any necessary mod-overwritten animations
- Copies new animations (any extracted to :file_folder: /archives folder)
- Fixes any affected creatures
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="25" id="25"></a>&#10173; **[25] Humanoid Animation Fixes**<br><br>

This component fixes humanoid creature files that have wrong animation slots:
- Male human fighters get the fighter instead of cleric animation
- Male elf fighters get the fighter instead of cleric animation
- Male halfling fighters get the fighter instead of cleric animation
- Female human fighters get the fighter instead of cleric animation
- Male human mages get the mage instead of cleric animation
- Male elf mages get the mage instead of cleric animation
- Male human thieves get the thief instead of fighter animation
- Female human thieves get the thief instead of fighter animation
- Male human monks get the monk instead of cleric animation
- Male human pirates get the pirate animation
- Male human sailors get the sailor animation
- Amnian guards get the Amnian guard animation
- Male human Shadow Thieves get the Shadow Thief animation
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="50" id="50"></a>&#10173; **[50] Distinctive Genies**<br><br>

This component assigns genies distinctive animations:
- Uses djinn, efreet, dao, jann and marid animations where sensible
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="100" id="100"></a>&#10173; **[100] Distinctive Fiends**<br><br>

This component assigns fiends creatures either their proper animation or new animations:
- Nabassus get a green-grey tanar'ri animation
- Chromatic Demon gets a somewhat more colourful base animation
- Bebiliths (Longer Road and Drizzt Saga only) get the NWN animation
- Some mariliths get a darker animation
- Night hags get the PS:T night hag animation
- Bone fiends get the NWN osyluth animation
- Gelugons (only if added by a mod) get an ice salamander animation
- Yochlols (except those in drow form) get a dark otyugh-based animation
- White, green and red abishai get the relevant IWD or PS:T animations
- Manes get the IWD drowned dead animation
- Erinyes get a black-winged elf avatar
- Succubi get the NWN succubus animation
- Maurezhi get a dark ghoulish animation
- Glabrezu get the proper glabrezu animation

&nbsp;

&nbsp;&nbsp;&nbsp;&nbsp;&#9755; <a href="https://spellholdstudios.github.io/readmes/infinityanimations/documentation/infinityanimations-screenshots.html">See more</a></br>
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="150" id="150"></a>&#10173; **[150-175] Pit Fiends**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[150]** All get the NWN animation<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[175]** Some get the NWN animation<br><br>

This component assigns Pit Fiends creatures the NWN animation:
- Choice of subcomponent (or none); "some" = roughly half, randomly selected

&nbsp;

&nbsp;&nbsp;&nbsp;&nbsp;&#9755; <a href="https://spellholdstudios.github.io/readmes/infinityanimations/documentation/infinityanimations-screenshots.html#150">See more</a></br>
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="210" id="210"></a>&#10173; **[210-230] Cambions get Isair Animation**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[210]** All Cambions<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[230]** Some Cambions<br><br>

This component assigns Cambions creatures the Isair animation:
- Same logic as Pit Fiends component
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="260" id="260"></a>&#10173; **[260-280] Alu-Fiends get Madae Animation**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[260]** All Alu-Fiends<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[280]** Some Alu-Fiends<br><br>

This component assigns Alu-Fiends creatures the Madae animation:
- Same logic as Pit Fiends component
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="400" id="400"></a>&#10173; **[400] Distinctive Undead**<br><br>

This component assigns undead creatures distinctive animations:
- Banshees get the wailing virgin animation
- Floating skulls get the demilich animation
- Greater ghasts get the IWD greater ghast animation
- Generic ghosts get the IWD ghost animation
- Greater ghouls get the IWD greater ghoul animation
- Some ghouls get the PS:T ghoul queen animation
- Greater liches get the IWD white lich animation
- Apparitions get the mist creature animation
- Revenants get the revenant animation
- Shadow Beasts get the shadow animation
- Wraiths get the IWD large shadow animation
- Spectres get the IWD large shadow murky animation
- Shadows get the IWD small shadow animation
- Some shadows get the IWD small shadow murky animation
- Greater skeletons get the skeleton monster animation
- Moon horrors get the skeleton fiend animation
- Female vampires get the vampire female animation
- Wights get the IWD grey wight animation
- Green zombies get the IWD green wight animation
- Zombie lords get the IWD yellow wight animation
- Undead knights and similar get the IWD barrow wight animation
- Greater zombies get the IWD yellow zombie animation
- Lacedons and sea zombies get the IWD blue zombie animation
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="410" id="410"></a>&#10173; **[410-415-420] Skeleton Warriors**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[410]** Wight Barrow animation<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[415]** Skeleton animation<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[420]** Skeleton warrior animation<br><br>

This component assigns the chosen animation to all skeleton warriors.
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="450" id="450"></a>&#10173; **[450-455-460] Seer Animation**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[450]** Some beggars and slaves<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[455]** Some beggars<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[460]** Some slaves<br><br>

This component assigns the IWD Seer animation to some beggars and slaves.
- Same logic as Pit Fiends component
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="480" id="480"></a>&#10173; **[480-490] Svirneblins Animations**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[480]** Animations only<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[490]** Animations and sounds
###### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<em>Skipped if Aurora's Shoes installed (does the same thing)</em><br><br>

This component assigns all IWD svirfneblins animations variants for Underdark deep gnomes.
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="500" id="500"></a>&#10173; **[500] More Base Animations**<br><br>

This component assigns some creatures distinctive basic animations:
- Histachii get the IWD histachii animation
- Lizardman warriors get the lizardman elite animation (brown)
- Lizardman shamans get the lizardman animation (green)
- Lizardman chiefs get the lizard king animation
- Variant trolls (normal, blue, ice, snow, small) where relevant
- Greater umber hulks get the IWD elder umber hulk animation
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="550" id="550"></a>&#10173; **[550] More Icewind Dale Animations**<br><br>

This component assigns some creatures distinctive IWD animations:
- Animated Plates get small animated plate animations
- Archdruids get the IWD Arundel animation
- Variant barbarians (brown, red, tan and shamans)
- Greater elementals make use of variant BG2/IWD animations
- Some fire giants get the IWD fire giant animation
- Iron golems get the IWD iron golem animation
- Adamantite golems get the BG2 iron golem animation
- Sahuagin priestesses get the IWD sahuagin animation
- Sahuagin royal guards get the BG2 large sahuagin animation
- Sahuagin chiefs get the IWD large sahuagin animation
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="600" id="600"></a>&#10173; **[600] More Icewind Dale II Animations**<br><br>

This component assigns some creatures distinctive IWD2 animations:
- Greater fire giants and firbolgs get the fire giant variant animation
- Variant goblins (worgriders, leaders, browns, greens, elites)
- Hook horrors get the hook horror animation
- Shadow druids get the Malarite animation
- Ellesime clones get the white-haired Ellesime animation
- Poison mists get the lagoon creature animation
- Death tyrants get the death tyrant animation
- Wererat gets the wererat animation
- Worgs get the IWD2 worg animation
- Yuan-Tis Halfbreed get the IWD2 yuan-ti halfbreed animation
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="650" id="650"></a>&#10173; **[650] More Neverwinter Nights Animations**<br><br>

This component assigns some creatures distinctive NWN animations:
- Scythe-wielders (in NTotSC) get the NWN Amel animation
- Bombardier beetle (in Big Picture) gets the NWN animation
- Greater basilisks get the NWN basilisk animation
- Modrons get the modron animation
- Displacer beasts (in AjocMod) get the NWN-CCP animation
- Some fire giants get the NWN female fire giant animation
- Some frost giants get the NWN female frost giant animation
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="710" id="710"></a>&#10173; **[710-720-730-740] More Planescape: Torment Animations**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[710]** 25% of relevant non-joinables<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[720]** 50% of relevant non-joinables<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[730]** 75% of relevant non-joinables<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[740]** Most relevant non-joinables<br><br>

This component assigns some creatures distinctive PsT animations:
- Female human thieves get the female Curst townie animation
- Male human thieves get the male Curst townie animation
- Female monks get the female Dustman animation
- Male monks and Dustmen get the male Dustman animation
- Some ghouls get the female ghoul animation
- Some ghouls get the male ghoul animation
- Male human smiths get the Godsman animation
- Axe- and hammer-wielding bandits and mercenaries get the large thug animation
- Sword- and dagger-wielding bandits and mercenaries get the small thug animation
- Female human peasants get the female lower-class townie animation
- Male human peasants get the male lower-class townie animation
- Male human merchants get the merchant animation
- Female human merchants get the midwife animation
- Harlots get the harlot animation
- Skeleton mage gets the skeleton priest animation
- Skeletons get the skeleton worker animation
- Female tieflings get the female tiefling animation
- Male tieflings get the male tiefling animation
- Male human mages get the townie wizard animation
- Female human nobles get the female upper-class townie or the aasimar female animation
- Male human nobles get the male upper-class townie animation
- Some zombies get the female zombie animation
- Some zombies get the male zombie animation
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="7000" id="7000"></a>&#10173; **[7000-7010-7020-7030] Moinesse's Avatars for IA**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[7000]** 25% of relevant non-joinables<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[7010]** 50% of relevant non-joinables<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[7020]** 75% of relevant non-joinables<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[7030]** Most relevant non-joinables<br><br>

This component assigns some creatures distinctive Moinesse's animations:
- Male human barbarians get the male barbarian animation
- Female human druids get the female druid animation
- Female human fighters get the female human fighter animation
- Female elf mages get the female elf mage animation
- Female human mages get the female human mage animation
- Female human thieves get the female human thief animation (unless they've already received the female Curst townie animation)
- Male human ninjas and assassins get the male human ninja animation (unless they've already received the male Curst townie or the Shadow thief animation)
- Male vampires get the Moinesse vampire animation
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="8000" id="8000"></a>&#10173; **[8000-8010-8020-8030] BG1 Character Animations for NPCs**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[8000]** 25% of relevant creatures<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[8010]** 50% of relevant creatures<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[8020]** 75% of relevant creatures<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[8030]** Most relevant creatures<br><br>

- Uses the original Baldur's Gate character animations as specified
- The last option is "most" instead of "all" because certain creatures are excluded
- These include creatures with scimitars, katanas or anything other than a shield in the offhand slot (or related proficiencies) since BG1 did not have these animations
- :warning: **Use with caution** in the case of joinable NPCs: it will avoid any characters with the two weapon proficiency or a second weapon equipped, but do not try to dual wield
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="9000" id="9000"></a>&#10173; **[9000] Fix Area Creature References**
###### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<em>Installed by default</em><br><br>

This component corrects changed creature animations in area files for easier reference.
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="9500" id="9500"></a>&#10173; **[9500-9510-9520] BG1 Character Animations for PCs**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[9500]** Prompt for each exported PC<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[9510]** Prompt for problematic PCs<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[9520]** Patch all PCs without prompting<br><br>

- Uses the original Baldur's Gate character animations as specified
- The second option patches all PCs but prompts for those with scimitars, katanas or anything other than a shield in the offhand slot
- Scimitars and katanas should work, but will appear as long swords on character avatars
- :warning: **Use with caution**: do not try to dual wield or the game will likely crash
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="9600" id="9600"></a>&#10173; **[9600-9610-9620] BG1 Character Animations for Saved Games**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[9600]** Prompt for each character<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[9610]** Prompt for problematic characters<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[9620]** Patch all characters without prompting<br><br>

- Same notes as above
- You get to choose whether to patch each game (and character within it, if you've selected one of the prompting options)
- :warning: **Back up your saved games** before un-installing this component, as it will restore the versions present at the time of the installation
<div align="right"><a href="#components">Back to components list</a></div>

## 

<a name="9900" id="9900"></a>&#10173; **[9900-9910] Saved Game Animation Fixer**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[9900]** Correct only LOW animations<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**[9910]** Correct all animations IA has changed<br><br>

- The first option prevents games from crashing due to moved _LOW animations
- The second option does the above and also patches any changed animations into your saved games
- You get to choose whether to patch each game
- If you've started a new game after installing this mod, then this component is not necessary (unless you're starting in the BG2 portion of BGT
- :warning: **Back up your saved games** before un-installing this component, as it will restore the versions present at the time of the installation
<div align="right"><a href="#components">Back to components list</a></div>


<hr>


## <a name="credits" id="credits"></a>Credits and Acknowledgements

&#9755; For support or questions, please visit the <a href="http://www.shsforums.net/forum/594-infinity-animations">mod forum</a>.

## 

**Author:** <a href="http://www.shsforums.net/user/2954-erephine/">Erephine</a>  
**WeiDU coding:** <a href="http://www.shsforums.net/user/5803-miloch/">Miloch</a>, revised by <a href="http://www.shsforums.net/user/10485-sam/">Sam</a> and <a href="http://www.shsforums.net/user/24495-gwendolyne/">Gwendolyne</a>  
**Support:** <a href="http://www.shsforums.net/user/10485-sam/">Sam</a> and <a href="http://www.shsforums.net/user/24495-gwendolyne/">Gwendolyne</a>

## 

#### Special Acknowledgements to:

- <a href="http://www.spellholdstudios.net/">Spellhold Studios</a> team for hosting the mod (<a href="http://www.shsforums.net">Forums</a>).
- Original assistance: <a href="http://www.shsforums.net/user/948-arkenor/">Arkenor</a> and <a href="http://www.shsforums.net/user/4994-sergis/">SergIS</a>.
- <a href="http://www.shsforums.net/user/10485-sam/">Sam</a>: ...
- <a href="http://www.shsforums.net/user/14985-argent77/">Argent77</a>: thanks for letting me use and adapt his `FIND_FREE_ANIM_SLOT` WeiDU function (*a7_functions.tpa* library) to automatically install new animation slots in EE games.
- Modders: <a href="http://www.shsforums.net/user/776-kwiat-w/">Kwiat_W</a>, <a href="http://www.shsforums.net/user/22187-ulb/">Ulb</a> and <a href="http://www.shsforums.net/user/24495-gwendolyne/">Gwendolyne</a> for letting us integrate some of their creature animations into a new IA content package.
- French translation: <a href="http://www.shsforums.net/user/24495-gwendolyne/">Gwendolyne</a>.
- Special: <a href="http://www.shsforums.net/user/16735-luren/">Luren</a> for proofreading French translation and for his contribution with fixing a few missing EE animations.

## 

#### Programs/tools used in creation (among others)

- <a href="https://github.com/WeiDUorg/weidu/releases">WeiDU</a> by Wes Weimer, the bigg and Wisp.
- <a href="https://gibberlings3.github.io/iesdp/">IESDP</a>, maintained by igi and lynx.
- <a href="https://github.com/Argent77/NearInfinity/releases">Near Infinity</a>, by Jon Olav Hauglid, FredSRichardson, and Argent77.
- <a href="https://www.gibberlings3.net/mods/tools/dltcep/">DLTCEP</a>, by Avenger.
- <a href="http://www.teambg.eu/?page=tools&amp;cat=32">BAM Workshop</a> by Glenn Flansburg.
- <a href="http://notepad-plus-plus.org/">Notepad++</a> by the Notepad++ team, Don Ho, and the spellcheck plug-in.
- <a href="http://www.shsforums.net/files/file/1048-weidu-highlighter-for-notepad/">WeiDU Notepad++ Highlighters </a> by Argent77.
- <a href="http://www.editpadpro.com/editpadclassic.html">EditPad Classic</a> by Jan Goyvaerts.
- <a href="http://www.pspad.com/en/">PSPad</a> by Jan Fiala</a>.
- <a href="http://www.bulkrenameutility.co.uk/">Bulk Rename Utility</a>, by TGRMN Software.

## 

#### Copyrights Information

###### <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.en_US"><img align="left" alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a> This work (including all code and documentation) is licensed under a <a href="http://creativecommons.org/licenses/by-nc/3.0/">Creative Commons Attribution-Noncommercial 3.0 Unported License</a>. You are free to share (copy, distribute and transmit) and to remix (adapt) this work, except for commercial purposes. See the <a href="http://creativecommons.org/licenses/by-nc/3.0/legalcode">Creative Commons Public License</a> for more details. Please post any changes or updates at the mod's <a href="http://www.shsforums.net/forum/594-infinity-animations/">forum</a>.
###### All copyrights and trademarks are the property of their respective owners.
<div align="right"><a href="#top">Back to top</a></div>


<hr>


## <a name="versions" id="versions"></a>Versions History

##### Version 6.0.0 &nbsp;(September nn, 2020)

&#9755; <ins>a. Major updates</ins>
  - Modified animations namespaces, **now compatible with non-Western code pages** (got rid of the the .exe patch routine forcing a code page change and rebooting if a non-Western code page was detected). :wink:
  - From now on, Infinity Animations is released with all available creature animations content. It is no longer necessary to download all their archive files, but you can still select the ones you want to install. For more details on how to customize your installation, please read this <a href="#config">chapter</a>.
  - New IA Content (EE games new Animations ported to ToB): Boar Wild, Bonebat, Bugbear Shaman, Crusader Soldier, Dog Gray, Dragon Green IWD, Dragon Green Juvenile, Dragon Red Juvenile, Dragon Green Young, Dragon Silver Young, Dragon White Young, Drowned Dead Red, Ettin Ghost, Fiend Red, Giant Hill, Gibberling Brood, Goblins Mkhiin (common, with bow, with staff, with armor and axe, with armor and bow), Goblin Worg Elite, Goblin Worg Shaman, Golem Mini, Halfdragon Green, Hephernaan, Megalocentipede, Black Pudding, Red Wizard, Sailor Dark, Sailor Green, Sailor Red, Snake Water, Spider Water, Troll Scrag, Troll Spectral, Tunnel Worm, Wyrmling Albino, Wyvern White. Includes all relevant creature sounds and tables.
  - Integrated IA modders' content: Brow Chicken (Jarl), jastey's Wolfhound, <a href="http://www.shsforums.net/files/file/908-ia-content-wow-pack-mule/">Packmule_wow content pack</a> (Kwiat_W), <a href="http://www.shsforums.net/files/file/956-ia-content-d2-bear-werebear/">D2 Bear & Werebear Animations</a>, <a href="http://www.shsforums.net/topic/59381-modresource-the-butcher-hots-animation-for-ees-classic/">Butcher animation from Heroes of the Storm</a>, <a href="https://github.com/thisisulb/ModResource_BeeAnimation">Giant Bee</a> (Ulb), <a href="https://github.com/thisisulb/UlbsAnimationPack">Ulb's animation Pack</a> (Elemental Ice, Sunnis Princess of Earth Elementals and Zaaman Rul Prince of Fire Elementals), small snake, small snake green and small snake red (Gwendolyne).
  - Native compatibility with Enhanced Editions games:
    - Restored missing bam content in EE games: Abishais (black, green, red, white), Animated plates, Arundel, Barbarian shaman (club, hammer, staff), Barbarian warriors (brown, red, tan), Barbarian Icasaracht, Beetles (boring, fire, bombardier, rhinoceros), Belhifet, Belhifet priest, Boar arctic, Bonebat, Bugbear (and captain), Chicken (brown, white), Chimera, Cornugon, Creeping doom, Cyclops, Dark treant, Deva monadic fallen, Dragons BG2 (black, red, silver), Dragon red juvenile, Dragon white (and young), Driders (female, male), Drowned dead, Elemental earth, Elemental (fire, water, water small), Feyr (and greater), Ghast greater, Ghost, Ghoul greater, Giant fire 2, Giant fire IWD, Giant frost, Giant fomorian, Giant hill, Giant verbeeg, Glabrezu, Goblins (captain, shaman, worg, worg captain), Golem ice, Golem iron (IWD), Golem mini, Hag (annis, night), Halfdragon (black, red), Harpy, Hephernaan, Histachii, Hook horror, Isair, Kegs (1, 2, 3), Kuo-toa (and large), Lemure, Lich white, Lizard man (and elite, king), Madae, Malarite, Marilith, Marilith (IWD), Megalocentipede, Mkhiins, Orc axe undead, Orc shaman undead, Orog shaman, Planetar, Planetar fallen, Remorhaz, Sahuagin IWD (and large), Seer, Shadow (small, large), Shenrical, Svirfneblins (pale and dark, with/without axe), Trolls (ice, scrag, snow), Tundra yeti, Tunnel worm, Umber hulk (elder, vodyanoi), Wailing virgin, Water weird, Werebadger, Wererat, Wights (barrow, gray, green, yellow), Will o wisp (and small), Worg IWD, Yuan-ti halfbreed, Zombie (blue, yellow).
    - Restored missing palettes content in EE games: Abishai blue, Black pudding, Boar wild, Bugbear shaman, Crusader soldier, Dog gray, Dragons BG2, Dragon green IWD, Dragon green juvenile, Dragons young (green, silver), Drowned dead red, Efreeti noble, Elemental fire small purple, Ettin ghost, Fiends (blue, green, red), Gibberling brood, Goblin worg (elite, shaman), Hags (green, sea), Hakeashar, Halfdragon green, Hephernaan, Maurezhi, Myrlochar, Nishruu, Red wizard, Sailors (green, red, dark), Snake water, Spider water, Troll spectral, Wyrmling albino, Wyvern white, Wyvern white big, Yochlol.
    - Restored missing wav content in EE games: Abishai, Barbarians, Beetles (boring, bombardier, rhinoceros), Belhifet, Belhifet priest, Boar arctic, Bonebat, Bugbear (and captain), Chimera, Cornugon, Creeping doom, Cyclops, Dark treant, Deva monadic fallen, Dragon silver, Dragon white (and young), Driders (female, male), Drowned dead, Elemental (fire, water), Feyr (and greater), Ghast greater, Ghost, Giant fomorian, Giant frost, Giant verbeeg, Glabrezu, Goblins, Goblins (captain, shaman, worg, worg captain), Golem ice, Golem iron (IWD), Hag night, Harpy, Halfdragon black, Histachii, Hook horror, Isair, Kegs, Kuo-toa, Lemure, Lich black, Lizard man king, Madae, Malarite, Minotaur, Mummy, Orc axe undead, Planetar, Remorhaz, Sahuagin IWD (and large), Seer, Shadow (small, large), Shenrical, Shrieker, Trolls (blue, ice, scrag, snow), Tundra yeti, Umber hulk (elder, vodyanoi), Wailing virgin, Water weird, Werebadger, Wererat, Wights (barrow, green, yellow), Wyrmling albino, Yochlol, Yuan-tis (and halfbreed), Zombie yellow.
    - Restored missing ini files in EE games: Abishais (black, green, red, blue), Belhifet, Belhifet priest, Black pudding, Boar wild, Bonebat, Bugbear (and captain, shaman), Chimera, Crusader soldier, Dog gray, Dragon green IWD, Dragons juvenile (green, red), Dragons young (green, silver), Drider female, Drowned dead red, Elemental water small, Ettin ghost, Feyr greater, Giant fomorian, Giant hill, Gibberling brood, Goblin shaman, Goblins worg (elite, shaman, captain), Hags (annis, green, night, sea), Halfdragon (black, green, red), Hephernaan, Hook horror, Isair, Kegs (1, 2, 3), Madae, Malarite, Megalocentipede, Mkhiins, Myrlochar, Orcs undead (axe, shaman), Orog shaman, Sailors (red, dark), Shenrical, Snake water, Spider water, Troll spectral, Tunnel worm, Werebadger, Wererat, Will o wisp (and small), Worg, Wyrmling albino, Yuan-ti halfbreed.
    - Giant Hill animation: updated EE bam files that were missing pixels (Gwendolyne).
    - TODO... to be completed.
  - Integrated all code and BWP Fixpack fixes:
    - Main component: <a href="http://www.shsforums.net/topic/47635-notes-oddities-and-possible-bugs-in-my-bwp-game-spoilers/page-12#entry562939">Lollorian's Ghouls transforming to Golems fix</a> and <a href="http://www.shsforums.net/topic/47635-notes-oddities-and-possible-bugs-in-my-bwp-game-spoilers/page-35#entry579291">Lollorian's patch to handle non-biffed installations</a>. Source: <a href="https://github.com/BigWorldProject/Big-World-Fixpack/commit/5ff3f32fda8f22711b55cf5065dca194d52cbffd">commit</a>.
    - More Planescape: Torment Animations component [710-720-760-740]: <a href="http://www.shsforums.net/topic/45383-infinity-animations-from-pst/page-3#entry534274">Miloch's updated t-pstanims.tpa</a>, tuned by <a href="http://www.shsforums.net/topic/55059-error-installing-ia-read-out-of-bounds/?p=544741">Lollorian</a>.
    - Scattered into various components: <a href="http://www.shsforums.net/topic/43531-ia-comments/page-3#entry549298">Lollorian's patch to correct loops</a>.
  - Integrated all BWP Fixpack graphic fixes (thanks to their authors!):
    - IA base_anims content: Miloch's <a href="http://www.shsforums.net/topic/47692-fixed-lizardman-shaman-bug/">missing IWD Lizardman (green) casting with weapon animations fix</a> and Polytope's <a href="https://www.gibberlings3.net/forums/topic/23792-doppelganger-animations/">better Doppelganger attack animations</a>.
    - IA_BGII_IWDII content: Gwendolyne's <a href="http://www.shsforums.net/topic/55742-fixed-small-elemental-water-bug/">Small Water Elemental bug fix</a>.
    - IA_IWD content: Miloch's <a href="http://www.shsforums.net/topic/53322-sahuagin-bug/?p=530224">Sahuagin with crossbow crash when walking fix</a>.
    - IA_NWN_01_modron content: Gwendolyne's <a href="http://www.shsforums.net/topic/56013-fixed-basilisk-nwn-bug/">NWN Basilisk bug fix</a>.
    - NWN_Misc_I content: Gwendolyne's <a href="http://www.shsforums.net/topic/55823-fixed-bovine-thing-axe-bug/">Bovine axe thing fix</a>.
    - IA_Wh_Dr_Wyv_LoP content: Gwendolyne's Dragon white and PsT Lady of Pain optimized bam files (removed duplicated frames, 43,3 Mo ==> 18,7 Mo and 17 Mo ==> 2,37 Mo).
  - IA Shadows_Harpy_Frostgiant content: Fixed alternate murky shadows folders names and 2da files that were inverted (small = 3bt / large = 3bu), then fixed *t-anisnd.tpa* for consistency.
  - Added missing casting animations (sp and ca bam files, with weapons variants when needed):
    - IA base_anims content: Beetle bombardier, Beetle boring, Beetle fire, Beetle rhinoceros, Cyclops, Ettin, Ghast greater, Ghost, Ghoul greater, Goblin with axe, Goblin with bow, Goblin Elite with axe, Goblin Elite with bow, Golem Ice, Histachii, Minotaur, Mummy, Orc melee, Orc range, Orc elite melee, Orc elite range, Orog, Orog elite, Orog Chieftain, Salamander fire/frost, Shadow small, Shadow large, Skeleton fiend, Skeleton warrior, Troll blue, Troll ice, Troll snow, Water weird, Yuan-ti, Yuan-ti elite, Zombie blue, Zombie yellow.
    - IA BGII_IWDII content: Arctic Boar, Bugbear, Bugbear Captain, Dark Treant, Elemental Water small, Giant Fomorian, Goblin axe green, Goblin bow green, Goblin Captain, Goblin elite axe green, Goblin elite bow green, Goblin worgrider, Goblin worgrider Captain, Hook Horror, Kegs, Lemure, Orc Axe Undead, Werebadger, Wererat, Worg.
    - IA IWD content: Animated Plate small bronze/dark/green, Barbarian warrior tan/red/brown, Creeping Doom, Drowned Dead, Elemental Earth/Fire/Water, Giant Fire, Giant Verbeeg, Remorhaz, Tundra Yeti, Wight Barrow.
    - Rewrote Tool IA Reference Picker (can now be translated) and updated its readme.
    - IA Shadows_Harpy_Frostgiant content: Alternate ("murky") Shadows, Frost Giant.
<br><br>

&#9755; <ins>b. General overhaul and re-looking</ins>
  - Added *infinityanimations.ini* metadata file to support AL|EN's "Project Infinity".
  - Renamed *setup-infinityanimations.tp2* -> *infinityanimations.tp2* to support AL|EN's "Project Infinity".
  - Replaced `AUTHOR` keyword with `SUPPORT`.
  - TODO Added missing `REQUIRE_PREDICATE` conditions to avoid installing components in inaccurate games or if required components are not installed.
  - Added components `LABELS`.
  - Added "*always.tpa*" library.
  - Installation options have been moved into *infinityanimations-config-default.ini* file. If you want to modify them, please read this <a href="#config">chapter</a>.
  - ...
  - Split code into separate components libraries for more comfortable readability and maintenance. :wink:
  - Moved components tpa files into new "*components*" sub-folder and kept functions and macros in "*lib*" folder.
  - Commented code as much as possible.
  - Changed lines of code for further EE compatibility whenever possible, in particular the animations names have been harmonized.
  - ...
  - Coding simplification:
    - Used new and more efficient WeiDU functions (not released when Erephine wrote this mod) and got rid of deprecated functions (such as `DECOMPILE_BCS_TO_BAF` and `DECOMPILE_DLG_TO_D` replaced with `DECOMPILE_AND_PATCH`).
    - Used new <a href="http://www.shsforums.net/user/10485-sam/">Sam</a>'s `ps_recursive_copy.tpa` library, a WeiDU action function that will recursively search files into a parent directory, then copy them to a destination directory.
    - Replaced specific "*%tsx%*" ia variables with more compatible "*%tutu%_scriptx%*" variables.
    - Externalized lists of creatures to be patched into arrays for easier maintenance.
    - Minor fixes...
  - ...
  - Re-formated, updated (new animation pictures...) and renamed readme files to "*infinityanimations-readme-%LANGUAGE%.html*" (Infinity Animations now supports translated readmes).
  - Added French translation (Gwendolyne).
  - New traification. Feel free to provide me with translations. I will include them as soon as possible.
  - ...
  - Lower cased files.
  - Updated WeiDU installer to v246.
  - Uploaded mod to official Spellhold Studios GitHub mirror account.
  - ...
  - Replaced `GAME_IS` conditions with variables checks to speed up install time.
  - Reorganized folder architecture tree: created sub-folders to sort paperdolls .BAM files according to creature types. 

 <br>

&#9755; <ins>c. Components specific changes and fixes</ins>
- [0] Infinity Animations (main component) (t-main.tpa, ia_restore_bg2_animations.tpa, )
    - Integrated <a href="http://www.shsforums.net/topic/45925-pst-animations-and-circus-orcs/">Miloch's Circus orcs/ogres should not have INNOCENT class patch</a>, fixed <a href="http://www.shsforums.net/topic/48626-cyclops-bug/">Cyclops</a> and <a href="http://www.shsforums.net/topic/47995-zombie/">Yellow Zombie</a> animations not being disabled bugs.
    - Integrated <a href="http://www.shsforums.net/topic/47635-notes-oddities-and-possible-bugs-in-my-bwp-game-spoilers/page-12#entry562939">Lollorian's Ghouls transforming to Golems fix</a> and <a href="http://www.shsforums.net/topic/47635-notes-oddities-and-possible-bugs-in-my-bwp-game-spoilers/page-35#entry579291">Lollorian's patch to handle non-biffed installations</a>. Source: <a href="https://github.com/BigWorldProject/Big-World-Fixpack/commit/5ff3f32fda8f22711b55cf5065dca194d52cbffd">commit</a>.
    - Integrated <a href="http://www.shsforums.net/topic/43531-ia-comments/page-3#entry549298">Lollorian's patch to correct loops</a> (white abishais were not patched).
- [25] Humanoid Animations Fixes (t-humanoid_fixes.tpa)
    - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_humanoid_fixes_arrays.tph*" library) for easier maintenance.
    - Tutu variables: added missing tutu variable for BG kent and sailned files ("*GW_male_human_fighters*" array).
    - Integrated <a href="http://www.shsforums.net/topic/43531-ia-comments/page-3#entry549298">Lollorian's patch to correct loops</a> (male elf mages were not patched).
- [50] Distinctive Genies (t-genie.tpa)
     - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_genies_arrays.tph*" library) for easier maintenance.
- [100] Distinctive Fiends (t-fiend.tpa)
    - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_fiends_arrays.tph*" library) for easier maintenance.
    - Removed stratagems compatibility code fixed by SCSII as of v13 (February 2010 : "*Avoided a possible clash with other mods by replacing the Abishai in Diathya's group in a more compatibility-friendly way*").
    - Integrated <a href="http://www.shsforums.net/topic/43531-ia-comments/page-3#entry549298">Lollorian's patch to correct loops</a> (one maurezhi was not patched).
- [150-175] Pit Fiends (t-pit_fiend.tpa)
    - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_pit_fiends_arrays.tph*" library) for easier maintenance.
- [210-230] Cambions get Isair Animation (t-cambion.tpa)
    - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_cambions_arrays.tph*" library) for easier maintenance.
    - Removed old versions lines of code that were also patching Male Tieflings, deprecated since a long time.
- [260-280] Alu-Fiends get Madae Animation (t-alu_fiend.tpa)
    - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_alu_fiends_arrays.tph*" library) for easier maintenance.
    - Removed old versions lines of code that were also patching Female Tieflings, deprecated since a long time.
- [400] Distinctive Undead (t-undead.tpa)
    - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_undead_arrays.tph*" library) for easier maintenance.
    - Tutu variables: replaced "*%tsz%*" that did not exist with "*%tutu_scriptz%*" (*GW_zombies* array).
    - Added <a href="http://www.shsforums.net/topic/45497-glowing-undead/page-2#entry496098">glowcheck.tpp patch</a>.
    - *GW_ghasts* array: integrated <a href="http://www.shsforums.net/topic/54249-colors-problem-solved/?p=535498">Turambar's glowcheck patch</a> that prevents Skeletons with modified animations to glow red (Ghasts get the ghast animation: removed ghastsu which is a skeleton, not a ghast).
    - Zombie Lords get the wight_yellow animation: removed gzombie.cre botched strref patch (*Greater Zombie*) already fixed by TS v6 and later.
- [410-415-420] Skeleton Warriors (t-skelwa.tpa)
    - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_skelwa_arrays.tph*" library) for easier maintenance.
    - Added <a href="http://www.shsforums.net/topic/45497-glowing-undead/page-2#entry496098">glowcheck.tpp patch</a>.
- [450-455] Seer animations (t-seer.tpa)
    - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_seers_arrays.tph*" library) for easier maintenance.
    - A few creatures have been moved from the beggars to the slaves array (slslav01, udilsla1, udilsla1, udilsla3, udslv02, udvicti2, udvicti3, udvicti4, udvictim).
    - Fix: "*Some beggars and slaves* and "*Some beggars*" sub-components creatures listings were inverted. &#128541;
- [480-490] Svirfneblins Animations (t-svirfneblin.tpa)
    - Added "*%t-svi%*" variable used in a single routine for both sub-components.
    - Fixed soundset clips typos (a few were misspelled "*t_sva*" and "*t_svn*" instead of "*t-sva*" and "*t-svn*").
- [500] More Base Animations (t-baseanims.tpa)
    - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_more_base_anim_arrays.tph*" library) for easier maintenance.
- [550] More Icewind Dale Animations (t-iwdanims.tpa)
    - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_more_iwd_anim_arrays.tph*" library) for easier maintenance.
    - BG:EE compatibility: added `IF_EXISTS` after `COPY_EXISTING` to avoid installation failure.
- [600] More Icewind Dale II Animations (t-iwd2anims.tpa)
    - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_more_iwd2_anim_arrays.tph*" library) for easier maintenance.
- [650] More Neverwinter Nights Animations (t-nwnanims.tpa)
    - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_more_nwn_anim_arrays.tph*" library) for easier maintenance.
- [710-720-760-740] More Planescape: Torment Animations (t-pstanims.tpa)
    - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_more_pst_anim_arrays.tph*" library) for easier maintenance.
    - Tutu variables: added missing tutu variables for BG1 UB (bart8, bart9, edie, ennahe, erlinh, feldan, galkin, hersch, memnis, mercha, mtob4, mtob5, read4, serwen, travel, volose, wilton) and BG:EE/Tutu (gretek). Added new variables to avoid overwriting BG and BG2 files having the same names.
    - Integrated <a href="http://www.shsforums.net/topic/45383-infinity-animations-from-pst/page-3#entry534274">Miloch's updated t-pstanims.tpa</a>, tuned by <a href="http://www.shsforums.net/topic/55059-error-installing-ia-read-out-of-bounds/?p=544741">Lollorian</a>.
    - Integrated <a href="http://www.shsforums.net/topic/54249-colors-problem-solved/?p=535498">Turambar's glowcheck patch</a> that prevents Skeletons with modified animations to glow red.
    - Externalized random seed in a new library ("*gw_random.tpp*").

  - [7000-7010-7020-7030] Moinesse's Avatars for IA (t-moines.tpa)
    - Externalized lists of creatures to be patched into arrays (built in "*gw_ia_moinesse_anim_arrays.tph*" library) for easier maintenance.
    - Integrated <a href="http://www.shsforums.net/files/file/967-ia-patch-b5-moinesse-ninja-fix/">Miloch's IA Moinesse Ninja Fix</a>, necessary if both Infinity Animations and Angelo are installed.
    - Externalized random seed in a new library ("*gw_random.tpp*").

  - [9000] Fix Area Creature References ()
    - In some areas, the former patch prevented cutscenes to be correctly displayed, due to unproper patched unique actor names. Source: <a href="http://www.shsforums.net/topic/50797-fix-area-creature-references-causing-script-problems/">Broken creature references</a>.

  - [9900-9910] Saved Game Animation Fixer and [9600-9610-9620] BG1 Character Animations for Saved Games components ()
    - Both components should no longer crash if :file_folder: \save or :file_folder: \mpsave folders do not exist (Thanks Sam for fixing!).

## 

##### Version Beta 5 &nbsp;(May 12, 2010)

- Changed the .exe patch so that it forces a code page change and reboots if a non-Western code page is detected.
- Updated the .exe patch so that it recognises BG1 thief avatars.
- Cloned missing animation tables from the unmodded game.
- Added other missing animation tables to base :file_folder: /content folder.
- Adding missing minotaur and water weird sounds.
- Disabled problematic stacked animations from chitin.key.
- Added creature sounds where relevant (major update here).
- Fixed a <a href="http://www.shsforums.net/topic/44716-error-installing/?p=483927">minor `READ_BYTE` glitch</a> in creature patching.
- Made it certain so that subcomponents can't be installed if the main component is not installed (to prevent crashes).
- Added night hags to the "*Distinctive Fiends*" component.
- Added ghoul queens to the "*Distinctive Undead*" component.
- Added white-haired Ellesime to the "*More IWD2 Animations*" component.
- Added lagoon creature to the "*More IWD2 Animations*" component.
- Deprecated tieflings from the cambion/alu-fiend components in favor of the "*More PS:T Animations*" component.
- Corrected skeleton warriors appearing as verbeegs glitch.
- Added Amel animation to the "*More NWN Animations*" component (if NTotSC is installed).
- Added '*Humanoid Animation Fixes*" component.
- Added "*Moinesse's Avatars for IA*" component.
- Added "*More PS:T Animations*" component.
- Added "*BG1 Character Animations for Saved Games*" component.
- Added "*Saved Game Animation Fixer*" component.
- Traified the entire freaking mod by hand for translators (thanks for nothing, WeiDU! &#128541;)

## 

##### Version Beta 4 &nbsp;(February 7, 2010)

- Added "*BG1 Character Animations for NPCs*" component.
- Added "*BG1 Character Animations for PCs*" component.
- Changed fiend patching to accommodate scripting.

## 

##### ersion Beta 3 &nbsp;(February 1, 2010)

- Fixed _LOW animation corrections causing areas crashing on load.
- Fixed scripts and dialogues that Polymorph to _LOW animations.
- Fixed code glitch preventing installation of optional components.
- Added option to install sounds in "*Svirfneblin Animations*" component.
- Added "*Fix Area Creature References*".
- Added revised salamander sound tables (MSAL and MSA2 slots).
- Enhanced compatibility with <a href="http://www.shsforums.net/topic/38261-atweaks-v264-released/">aTweaks</a>.
- Enhanced creature animation patches for fiends and orc shamans.

## 

##### Version Beta 2 &nbsp;(January 23, 2010)

- Added installer support for non-ANSI system locales.

## 

##### Version WeiDU Beta 1 &nbsp;(January 11, 2010)

- First WeiDU release.
- All affected mod and vanilla creatures patched.
- Optional components added.

## 

##### Version r.10010043

- Fixed a bug with Icewind Dale animation slots in Baldur's Gate II.

## 

##### Version r.09102252 (update)

- Updated documentation and Reference Picker.
- Added alternate stylesheet. &#128521;.

## 

##### Version r.09102252

- Initial release.
<div align="right"><a href="#top">Back to top</a></div>
