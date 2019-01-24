# <a name="top" id="top"></a><center>Infinity Animations</center>

### A Spellhold Studios mod for Baldur's Gate II:ToB, Baldur's Gate Trilogy and <acronym title="Baldur's Gate 'To Two'">Tutu</acronym>


<strong>Author:</strong> Erephine<br />
<strong>WeiDU coding:</strong> Miloch<br />
<strong>Version:</strong> 6.0.1 alpha<br />
<strong>Language:</strong> English, <a href="README-FR.md">French</a><br />
<strong>Platforms:</strong> Windows, linux

<strong>Mod Website:</strong> <a href="http://www.spellholdstudios.net/ie/infinityanimations">Spellhold Studios</a><br />
<strong>Mod forum:</strong> <a href="http://www.shsforums.net/forum/594-infinity-animations/">Infinity Animations</a>


Readme writing in progress...  

<center><a href="#intro">Overview</a> &#x2B25; <a href="#compat">Compatibility</a> &#x2B25; <a href="#installation">Installation</a> &#x2B25; <a href="#compon">Components</a> &#x2B25; <a href="#anims">Animations</a> &#x2B25; <a href="#credits">Credits</a> &#x2B25; <a href="#version">Version History</a></center></br></br>


<hr>


## <a name="intro" id="intro"></a>Overview

This mod patches Baldur's Gate II: Throne of Bhaal to support additional creature and character animations (referred to as 'animation slots'). It also offers a dynamic automated process for claiming new animation slots. Thus, it acts as a central hub, usable by anyone who would like to add animation entries to the game without being bogged down by issues of mod conflicts and incompatibilities.

Infinity Animations supports a wide variety of animation types from Baldur's Gate I, Baldur's Gate II, Icewind Dale I, Icewind Dale II, Planescape: Torment and Neverwinter Nights. As an added bonus, the mod restores Baldur's Gate I character animations in their entirety, and paperdolls have been unlocked for some animations that did not support them previously.
An important feature for players who use several large mods (known as 'megamods') is a resolution of animation conflicts, and a restoration of standard animations that megamods have overwritten.

Finally, this mod contains optional components that implement many new animations into the game. Ongoing work will address sound sets for new animations. While the number of supported animations may not be 'infinite' as the name suggests, it should be large enough to accommodate everyone's present (and in all likelihood future) needs.

<strong>Key features</strong>
<ul style="margin-left: 4%;">
	<li>Restores Baldur's Gate I character animations</li>
	<li>Improves paperdoll support for existing animations</li>
	<li>Adds custom game animations for characters and creatures (including dragons)</li>
	<li>Allows use of many different animation <em>types</em> (some never before seen in the games)</li>
	<li>Resolves the problems of animation stacking, slot and naming conflicts</li>
	<li>Offers <acronym title="Graphical User Interface">GUI</acronym> support for adding new animations</li>
	<li>Lets you watch as the percentage of free animation entries refuses to go down &#128578;</li>
</ul>
<div style="text-align:right"><a href="#top">Back to top</a></div>


<hr>


## <a name="compat" id="compat"></a>Compatibility

Infinity Animations works with <acronym title="Baldur's Gate II">BG2</acronym>: Throne of Bhaal and conversions based on <acronym title="Throne of Bhaal">ToB</acronym>. <strong>Make sure you have Throne of Bhaal patched to version 26498.</strong> Check the ReadMe files related to your patch in your game folder and the <a href="http://www.bioware.com/games/throne_bhaal/support/patches/">BioWare</a> website if necessary.

This mod should also work with all other mods, including <a href="http://www.pocketplane.net/tutu/">Baldur's Gate Tutu</a> (and EasyTutu), <a href="http://www.shsforums.net/index.php?showforum=261">Baldur's Gate Trilogy</a> and the <a href="http://www.shsforums.net/files/file/536-big-world-installpack/">BiG World Project</a>.

Install this mod after most other mods, particularly those that add creatures or animations, but before any final "biffing" routines.

<strong>Start a new game</strong> after installing this mod, or use the Saved Game Animation Fixer component if you're reluctant to do that.</br>
<div style="text-align:right"><a href="#top">Back to top</a></div>


<hr>


## <a name="installation" id="installation"></a>Installation

####Notes

<em>If you've previously installed the mod, remove it before extracting the new version. To do this, run <strong>setup-infinityanimations.exe</strong>, uninstall all previously installed components and delete the infinityanimations folder.</em>

<em>When installing or uninstalling, <strong>do not close the <acronym title="Disk Operating System">DOS</acronym> window</strong> by clicking on the <strong>X</strong> button! Instead, press the <strong>Enter</strong> key whenever instructed to do so.</em>

<strong>Disable any antivirus</strong> or other memory-resident software before installing this or any other mod. Some (particularly avast!) have a tendency to report false positives with mod activity, resulting in failed installs.

You can extract files from the archive using <a href="http://www.rarlab.com/download.htm">WinRAR</a>, <a href="http://www.zipgenius.it/ita/?page_id=12">ZipGenius</a> or another file compression utility that handles .rar files.

<strong>Important:</strong> Download all content you may require from the Infinity Animations download category at <a href="http://www.shsforums.net/index.php?autocom=downloads&showcat=98">Spellhold Studios</a>. If in doubt, download them all (most megamod installs will need all archives). Extract all archives using the "Do not extract paths" option on the <strong>Advanced</strong> tab in WinRAR. Also, make sure the "Destination path" on the <strong>General</strong> tab terminates in <strong>/content</strong> or <strong>/restore</strong> after <strong>infinityanimations</strong> (there should be no subfolders beyond that).

<p>Extract all archives to the /content folder except IA_BG2_Restores.rar, which should go in the /restore folder. If you extract IA_Wh_Dr_Wyv_LoP.rar (currently only needed for the Planar Sphere mod), you can delete the subarchive The_Lady's_Shadow.rar after extraction, as it is currently unused due to animation size limitations.</p>

For WinZip, make sure the "Use folder names" box is <em>unselected</em>.

You should end up with a bunch of .bam files and no subfolders in your "content" and/or "restore" folders. The installer will warn you if you're missing anything you need, at which point you can exit it, download missing content, extract it and rerun the installer.

## 

####Windows

Extract the contents of the mod to the folder of the game you wish to modify (<acronym title="Baldur's Gate II">BG2</acronym>, <acronym title="Baldur's Gate Trilogy">BGT</acronym> or EasyTutu). On successful extraction, there should be an infinityanimations folder and a setup-infinityanimations.exe file in your game folder. To install, simply double-click <strong>setup-infinityanimations.exe</strong> and follow the instructions on screen.

Run <strong>setup-infinityanimations.exe</strong> in your game folder to reinstall, uninstall or otherwise change components.

## 

####Linux

Extract the contents of the mod to the folder of the game you wish to modify.

Download the latest Linux version of <a href="http://weidu.org/~thebigg/"><acronym title="Weimer Dialogue Utility">WeiDU</acronym></a> and copy WeiDU and WeInstall to /usr/bin. Then open a terminal and cd to your game installation directory.

<em>Optional: run 'tolower' and answer 'Y' to both queries. You can avoid running the second option (linux.ini) if you've already ran it once in the same directory. To save time, the archive is already tolowered, so there's no need to run the first option (lowercasing file names) either, if you've extracted only this mod since the last time you lowercased file names. If unsure, running tolower and choosing both options is the safe bet.</em>

Run <strong>WeInstall setup-infinityanimations</strong> in your game folder to install the mod. Then run <strong>wine BGMain.exe</strong> and start playing.

## 

####Note for Complete Uninstallation

In addition to the methods above for removing individual components, you can completely uninstall the mod using <strong>setup-infinityanimations --uninstall</strong> at the command line to remove all components without wading through prompts.</br>
<div style="text-align:right"><a href="#top">Back to top</a></div>


<hr>


## <a name="components" id="components"></a>Components

The installer includes the following components. The number of each is the component DESIGNATED number which gives it a fixed install position, lets other components detect it and allows automated installers like the BiG World Setup specify component choices.

All subcomponents require the main component (they need to since it's the one that installs new content). All components are otherwise optional. Also note that no component affects joinable <acronym title="Non-Player Characters">NPCs</acronym>, something best left to individual modder discretion. (Hence, if something says it affects all female tieflings, it doesn't include Amber and Fade in that.)</br>

><span style="margin-left: 50px;"><a href="#0">[0] Infinity Animations (main component)</a></span></br>
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
><span style="margin-left: 50px;"><a href="#9900">[9900-9910] Saved Game Animation Fixer</a></span>

## 

<a name="0" id="0"></a><strong>0. Infinity Animations (main component)</strong><br />
<em><span style="margin-left: 15px;">Requires <acronym title="Throne of Bhaal">ToB</acronym> v26498</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Checks mod files and .exe validity</li>
	<li>Backs up and patches the .exe</li>
	<li>Replaces _LOW creature animations</li>
	<li>Updates .ids files</li>
	<li>Restores any necessary mod-overwritten animations</li>
	<li>Copies new animations (any extracted to /content folder)</li>
	<li>Fixes any affected creatures</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="25" id="25"></a><strong>25. Humanoid Animation Fixes</strong><br />
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Male human fighters get the fighter instead of cleric animation</li>
	<li>Male elf fighters get the fighter instead of cleric animation</li>
	<li>Male halfling fighters get the fighter instead of cleric animation</li>
	<li>Female human fighters get the fighter instead of cleric animation</li>
	<li>Male human mages get the mage instead of cleric animation</li>
	<li>Male elf mages get the mage instead of cleric animation</li>
	<li>Male human thieves get the thief instead of fighter animation</li>
	<li>Female human thieves get the thief instead of fighter animation</li>
	<li>Male human monks get the monk instead of cleric animation</li>
	<li>Male human pirates get the pirate animation</li>
	<li>Male human sailors get the sailor animation</li>
	<li>Amnish guards get the Amnish guard animation</li>
	<li>Male human Shadow Thieves get the Shadow Thief animation</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="50" id="50"></a><strong>50. Distinctive Genies</strong><br />
<em><span style="margin-left: 22px;">Requires IA_Fiends&#95;Genies.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Uses djinn, efreet, dao, jann and marid animations where sensible</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="100" id="100"></a><strong>100. Distinctive Fiends</strong><br />
<em><span style="margin-left: 34px;">Requires IA_Fiends&#95;Genies.rar, IA&#95;IWD.rar and IA&#95;PST&#95;Abishai.rar<br></span>
<span style="margin-left: 34px;">Requires IA_NWN&#95;01&#95;Modron.rar only if certain mods are installed</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Nabassus get a green-grey tanar'ri animation</li>
	<li>Chromatic Demon gets a somewhat more colourful base animation</li>
	<li>Bebiliths (Longer Road and Drizzt Saga only) get the <acronym title="Neverwinter Nights">NWN</acronym> animation</li>
	<li>Some mariliths get a darker animation</li>
	<li>Night hags get the <acronym title="Planescape: Torment">PS:T</acronym> night hag animation</li>
	<li>Bone fiends get the <acronym title="Neverwinter Nights">NWN</acronym> osyluth animation</li>
	<li>Gelugons (only if added by a mod) get an ice salamander animation</li>
	<li>Yochlols (except those in drow form) get a dark otyugh-based animation</li>
	<li>White, green and red abishai get the relevant <acronym title="Icewind Dale">IWD</acronym> or <acronym title="Planescape: Torment">PS:T</acronym> animations</li>
	<li>Manes get the <acronym title="Icewind Dale">IWD</acronym> drowned dead animation</li>
	<li>Erinyes get a black-winged elf avatar</li>
	<li>Succubi get the <acronym title="Neverwinter Nights">NWN</acronym> succubus animation</li>
	<li>Maurezhi get a dark ghoulish animation</li>
	<li>Glabrezu get the proper glabrezu animation</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="150" id="150"></a><strong>Pit Fiends<br />
150.</strong> All get the <acronym title="Neverwinter Nights">NWN</acronym> animation<br />
<strong>175.</strong> Some get the <acronym title="Neverwinter Nights">NWN</acronym> animation<br />
<em><span style="margin-left: 34px;">Requires IA_NWN&#95;01&#95;Modron.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Choice of subcomponent (or none); "some" = roughly half, randomly selected</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="210" id="210"></a><strong>Cambions get Isair Animation<br />
210.</strong> All cambions<br />
<strong>230.</strong> Some cambions<br />
<em><span style="margin-left: 34px;">Requires IA_BGII&#95;IWDII.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Same logic as Pit Fiends component</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="260" id="260"></a><strong>Alu-Fiends get Madae Animation<br />
260.</strong> All alu-fiends<br />
<strong>280.</strong> Some alu-fiends<br />
<em><span style="margin-left: 34px;">Requires IA_BGII&#95;IWDII.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Same logic as Pit Fiends component</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="400" id="400"></a><strong>400. Distinctive Undead</strong><br />
<em><span style="margin-left: 34px;">Requires IA&#95;Base&#95;Anims.rar, IA&#95;IWD.rar and Shadows&#95;harpy&#95;frostgiant.zip</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Banshees get the wailing virgin animation</li>
	<li>Floating skulls get the demilich animation</li>
	<li>Greater ghasts get the <acronym title="Icewind Dale">IWD</acronym> greater ghast animation</li>
	<li>Generic ghosts get the <acronym title="Icewind Dale">IWD</acronym> ghost animation</li>
	<li>Greater ghouls get the <acronym title="Icewind Dale">IWD</acronym> greater ghoul animation</li>
	<li>Some ghouls get the <acronym title= "Planescape: Torment">PS:T</acronym> ghoul queen animation</li>
	<li>Greater liches get the <acronym title="Icewind Dale">IWD</acronym> white lich animation</li>
	<li>Apparitions get the mist creature animation</li>
	<li>Revenants get the revenant animation</li>
	<li>Shadow Beasts get the shadow animation</li>
	<li>Wraiths get the <acronym title="Icewind Dale">IWD</acronym> large shadow animation</li>
	<li>Spectres get the <acronym title="Icewind Dale">IWD</acronym> large shadow murky animation</li>
	<li>Shadows get the <acronym title="Icewind Dale">IWD</acronym> small shadow animation</li>
	<li>Some shadows get the <acronym title="Icewind Dale">IWD</acronym> small shadow murky animation</li>
	<li>Greater skeletons get the skeleton monster animation</li>
	<li>Moon horrors get the skeleton fiend animation</li>
	<li>Female vampires get the vampire female animation</li>
	<li>Wights get the <acronym title="Icewind Dale">IWD</acronym> grey wight animation</li>
	<li>Green zombies get the <acronym title="Icewind Dale">IWD</acronym> green wight animation</li>
	<li>Zombie lords get the <acronym title="Icewind Dale">IWD</acronym> yellow wight animation</li>
	<li>Undead knights and similar get the <acronym title="Icewind Dale">IWD</acronym> barrow wight animation</li>
	<li>Greater zombies get the <acronym title="Icewind Dale">IWD</acronym> yellow zombie animation</li>
	<li>Lacedons and sea zombies get the <acronym title="Icewind Dale">IWD</acronym> blue zombie animation</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="410" id="410"></a><strong>Skeleton Warriors<br />
410.</strong> Wight Barrow animation<br />
<strong>415.</strong> Skeleton animation<br />
<strong>420.</strong> Skeleton warrior animation<br />
<em><span style="margin-left: 34px;">Requires IA_IWD.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Assigns the chosen animation to all skeleton warriors</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="450" id="450"></a><strong>Seer Animation<br />
450.</strong> Some beggars and slaves<br />
<strong>455.</strong> Some beggars<br />
<strong>460.</strong> Some slaves<br />
<em><span style="margin-left: 34px;">Requires IA_IWD.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Same logic as Pit Fiends component</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="480" id="480"></a><strong>Svirneblin Animations<br />
480.</strong> Animations only<br />
<strong>490.</strong> Animations and sounds<br />
<em><span style="margin-left: 34px;">Requires IA_IWD&#95;Svirfneblin.rar</span><br />
<span style="margin-left: 34px;">Skipped if Aurora's Shoes installed (does the same thing)</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Uses all svirfneblin variants for Underdark deep gnomes</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="500" id="500"></a><strong>500. More Base Animations</strong><br />
<em><span style="margin-left: 34px;">Requires IA_Base&#95;Anims.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Histachii get the <acronym title="Icewind Dale">IWD</acronym> histachii animation</li>
	<li>Lizardman warriors get the lizardman elite animation (brown)</li>
	<li>Lizardman shamans get the lizardman animation (green)</li>
	<li>Lizardman chiefs get the lizard king animation</li>
	<li>Variant trolls (normal, blue, ice, snow, small) where relevant</li>
	<li>Greater umber hulks get the <acronym title="Icewind Dale">IWD</acronym> elder umber hulk animation</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="550" id="550"></a><strong>550. More Icewind Dale Animations</strong><br />
<em><span style="margin-left: 34px;">Requires IA_IWD.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Animated Plates get small animated plate animations</li>
	<li>Archdruids get the <acronym title="Icewind Dale">IWD</acronym> Arundel animation</li>
	<li>Variant barbarians (brown, red, tan and shamans)</li>
	<li>Greater elementals make use of variant <acronym title="Baldur's Gate II">BG2</acronym>/<acronym title="Icewind Dale">IWD</acronym> animations</li>
	<li>Some fire giants get the <acronym title="Icewind Dale">IWD</acronym> fire giant animation</li>
	<li>Iron golems get the <acronym title="Icewind Dale">IWD</acronym> iron golem animation</li>
	<li>Adamantite golems get the <acronym title="Baldur's Gate II">BG2</acronym> iron golem animation</li>
	<li>Sahuagin priestesses get the <acronym title="Icewind Dale">IWD</acronym> sahuagin animation</li>
	<li>Sahuagin royal guards get the <acronym title="Baldur's Gate II">BG2</acronym> large sahuagin animation</li>
	<li>Sahuagin chiefs get the <acronym title="Icewind Dale">IWD</acronym> large sahuagin animation</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="600" id="600"></a><strong>600. More Icewind Dale II Animations</strong><br />
<em><span style="margin-left: 34px;">Requires IA_BGII&#95;IWDII.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Greater fire giants and firbolgs get the fire giant variant animation</li>
	<li>Variant goblins (worgriders, leaders, browns, greens, elites)</li>
	<li>Hook horrors get the hook horror animation</li>
	<li>Shadow druids get the Malarite animation</li>
	<li>Ellesime clones get the white-haired Ellesime animation</li>
	<li>Poison mists get the lagoon creature animation</li>
	<li>Death tyrants get the death tyrant animation</li>
	<li>Wererat gets the wererat animation</li>
	<li>Worgs get the <acronym title="Icewind Dale II">IWD2</acronym> worg animation</li>
	<li>Yuan-Ti Halfbreeds get the <acronym title="Icewind Dale II">IWD2</acronym> yuan-ti halfbreed animation</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="650" id="650"></a><strong>650. More Neverwinter Nights Animations</strong><br />
<em><span style="margin-left: 34px;">Requires IA_NWN&#95;01&#95;Modron.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Scythe-wielders (in <acronym title="Northern Tales of the Sword Coast">NTotSC</acronym>) get the <acronym title="Neverwinter Nights">NWN</acronym> Amel animation</li>
	<li>Bombardier beetle (in Big Picture) gets the <acronym title="Neverwinter Nights">NWN</acronym> animation</li>
	<li>Greater basilisks get the <acronym title="Neverwinter Nights">NWN</acronym> basilisk animation</li>
	<li>Modrons get the modron animation</li>
	<li>Displacer beasts (in AjocMod) get the <acronym title="Neverwinter Nights">NWN</acronym>-<acronym title="Community Creature Project">CCP</acronym> animation</li>
	<li>Some fire giants get the <acronym title="Neverwinter Nights">NWN</acronym> female fire giant animation</li>
	<li>Some frost giants get the <acronym title="Neverwinter Nights">NWN</acronym> female frost giant animation</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="710" id="710"></a><strong>More Planescape: Torment Animations<br />
710.</strong> 25% of relevant non-joinables<br />
<strong>720.</strong> 50% of relevant non-joinables<br />
<strong>730.</strong> 75% of relevant non-joinables<br />
<strong>740.</strong> Most relevant non-joinables<br />
<em><span style="margin-left: 34px;">Requires IA_PST&#95;Paletted.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Female human thieves get the female Curst townie animation</li>
	<li>Male human thieves get the male Curst townie animation</li>
	<li>Female monks get the female Dustman animation</li>
	<li>Male monks and Dustmen get the male Dustman animation</li>
	<li>Some ghouls get the female ghoul animation</li>
	<li>Some ghouls get the male ghoul animation</li>
	<li>Male human smiths get the Godsman animation</li>
	<li>Axe- and hammer-wielding bandits and mercenaries get the large thug animation</li>
	<li>Sword- and dagger-wielding bandits and mercenaries get the small thug animation</li>
	<li>Female human peasants get the female lower-class townie animation</li>
	<li>Male human peasants get the male lower-class townie animation</li>
	<li>Male human merchants get the merchant animation</li>
	<li>Female human merchants get the midwife animation</li>
	<li>Harlots get the harlot animation</li>
	<li>Skeleton mage gets the skeleton priest animation</li>
	<li>Skeletons get the skeleton worker animation</li>
	<li>Female tieflings get the female tiefling animation</li>
	<li>Male tieflings get the male tiefling animation</li>
	<li>Male human mages get the townie wizard animation</li>
	<li>Female human nobles get the female upper-class townie animation</li>
	<li>Male human nobles get the male upper-class townie animation</li>
	<li>Some zombies get the female zombie animation</li>
	<li>Some zombies get the male zombie animation</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="7000" id="7000"></a><strong>Moinesse's Avatars for <acronym title="Infinity Animations">IA</acronym><br />
7000.</strong> 25% of relevant non-joinables<br />
<strong>7010.</strong> 50% of relevant non-joinables<br />
<strong>7020.</strong> 75% of relevant non-joinables<br />
<strong>7030.</strong> Most relevant non-joinables<br />
<em><span style="margin-left: 44px;">Requires Moinesse_edits&#95;IAised.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Male human barbarians get the male barbarian animation</li>
	<li>Female human druids get the female druid animation</li>
	<li>Female human fighters get the female human fighter animation</li>
	<li>Female elf mages get the female elf mage animation</li>
	<li>Female human mages get the female human mage animation</li>
	<li>Female human thieves get the female human thief animation (unless they've already received the female Curst townie animation)</li>
	<li>Male human ninjas and assassins get the male human ninja animation (unless they've already received the male Curst townie or the Shadow thief animation)</li>
	<li>Male vampires get the Moinesse vampire animation</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="8000" id="8000"></a><strong><acronym title="Baldur's Gate">BG1</acronym> Character Animations for <acronym title="Non-Player Characters">NPCs</acronym><br />
8000.</strong> 25% of relevant creatures<br />
<strong>8010.</strong> 50% of relevant creatures<br />
<strong>8020.</strong> 75% of relevant creatures<br />
<strong>8030.</strong> Most relevant creatures<br />
<em><span style="margin-left: 44px;">Requires IA_Base&#95;Anims.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Uses the original Baldur's Gate character animations as specified</li>
	<li>The last option is "most" instead of "all" because certain creatures are excluded</li>
	<li>These include creatures with scimitars, katanas or anything other than a shield in the offhand slot (or related proficiencies) since <acronym title="Baldur's Gate">BG1</acronym> did not have these animations</li>
	<li><strong>Use with caution</strong> in the case of joinable <acronym title="Non-Player Characters">NPCs</acronym>: it will avoid any characters with the two weapon proficiency or a second weapon equipped, but do not try to dual wield</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="9000" id="9000"></a><strong>9000. Fix Area Creature References</strong><br />
<em><span style="margin-left: 44px;">Installed by default</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Corrects changed creature animations in area files for easier reference</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="9500" id="9500"></a><strong><acronym title="Baldur's Gate">BG1</acronym> Character Animations for <acronym title="Player Characters">PCs</acronym><br />
9500.</strong> Prompt for each exported <acronym title="Player Character">PC</acronym><br />
<strong>9510.</strong> Prompt for problematic <acronym title="Player Characters">PCs</acronym><br />
<strong>9520.</strong> Patch all <acronym title="Player Characters">PCs</acronym> without prompting<br />
<em><span style="margin-left: 44px;">Requires IA_Base&#95;Anims.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Uses the original Baldur's Gate character animations as specified</li>
	<li>The second option patches all <acronym title="Player Characters">PCs</acronym> but prompts for those with scimitars, katanas or anything other than a shield in the offhand slot</li>
	<li>Scimitars and katanas should work, but will appear as longswords on character avatars</li>
	<li><strong>Use with caution</strong>: do not try to dual wield or the game will likely crash</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="9600" id="9600"></a><strong><acronym title="Baldur's Gate">BG1</acronym> Character Animations for Saved Games<br />
9600.</strong> Prompt for each character<br />
<strong>9610.</strong> Prompt for problematic characters<br />
<strong>9620.</strong> Patch all characters without prompting<br />
<em><span style="margin-left: 44px;">Requires IA_Base&#95;Anims.rar</span></em>
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>Same notes as above</li>
	<li>You get to choose whether to patch each game (and character within it, if you've selected one of the prompting options)</li>
	<li><strong>Back up your saved games</strong> before uninstalling this component, as it will restore the versions present at the time of the installation</li>
</ul>

<div style="text-align:right"><a href="#components">Back to components list</a></div>

## 

<a name="9900" id="9900"></a><strong>Saved Game Animation Fixer<br />
9900.</strong> Correct only LOW animations<br />
<strong>9910.</strong> Correct all animations <acronym title="Infinity Animations">IA</acronym> has changed
<ul style="margin-top: -1%;margin-left: 4%;">
	<li>The first option prevents games from crashing due to moved LOW animations</li>
	<li>The second option does the above and also patches any changed animations into your saved games</li>
	<li>You get to choose whether to patch each game</li>
	<li>If you've started a new game after installing this mod, then this component is not necessary (unless you're starting in the <acronym title="Baldur's Gate II">BG2</acronym> portion of <acronym title="Baldur's Gate Trilogy">BGT</acronym>)</li>
	<li><strong>Back up your saved games</strong> before uninstalling this component, as it will restore the versions present at the time of the installation</li>
</ul>
<div style="text-align:right"><a href="#components">Back to components list</a></div>


<hr>


## <a name="credits" id="credits"></a>Credits and Acknowledgements

#### Author: <a href="http://www.shsforums.net/user/2954-erephine/">Erephine</a>


#### Special Acknowledgements to:

- <acronym title="Weimer Dialogue Utility">WeiDU</acronym> coding: <a href="http://www.shsforums.net/user/5803-miloch/">Miloch</a>.
- Assistance: <a href="http://www.shsforums.net/user/948-arkenor/">Arkenor</a> and <a href="http://www.shsforums.net/user/4994-sergis/">SergIS</a>.
- Hosting: <a href="http://www.spellholdstudios.net/">Spellhold Studios</a> (<a href="http://www.shsforums.net">Forums</a>).
- etc.


#### Programs/tools used in creation

- <a href="http://www.weidu.org/%7Ethebigg/"><acronym title="Weimer Dialogue Utility">WeiDU</acronym></a> by Wes Weimer, the bigg and Wisp
- <a href="https://gibberlings3.github.io/iesdp/"><acronym title="Infinity Engine Structures Description Project">IESDP</acronym></a> maintained by igi and lynx
- <a href="http://forums.pocketplane.net/index.php/topic,25153.msg314249.html#msg314249">Near Infinity</a> by Jon Olav Hauglid, FredSRichardson and Argent77
- <a href="http://www.gibberlings3.net/tools/dltcep.php"><acronym title="Dragonlance Total Conversion Editor Pro">DLTCEP</acronym></a> by Avenger
- <a href="http://www.teambg.eu/?page=tools&amp;cat=32">BAM Workshop</a> by Glenn Flansburg
- <a href="http://www.editpadpro.com/editpadclassic.html">EditPad Classic</a> by Jan Goyvaerts
- <a href="http://www.pspad.com/en/">PSPad</a> by Jan Fiala
- <a href="http://notepad-plus-plus.org/">Notepad++</a> by the Notepad++ team, Don Ho, and the spellcheck plug-in
- <a href="http://www.shsforums.net/files/file/1048-weidu-highlighter-for-notepad/">WeiDU Notepad++ Highlighters </a> by Argent77


#### Copyrights Information

###### This work (including all code and documentation) is licensed under a <a href="http://creativecommons.org/licenses/by-nc/3.0/">Creative Commons Attribution-Noncommercial 3.0 Unported License</a>. You are free to share (copy, distribute and transmit) and to remix (adapt) this work, except for commercial purposes. See the <a href="http://creativecommons.org/licenses/by-nc/3.0/legalcode">Creative Commons Public License</a> for more details. Please post any changes or updates at the mod's <a href="http://www.shsforums.net/forum/594-infinity-animations/">forum</a>.
###### All copyrights and trademarks are the property of their respective owners.
<div style="text-align:right"><a href="#top">Back to top</a></div>


<hr>


## <a name="versions" id="versions"></a>Versions History

##### WeiDU Beta 6 - Month day, 2019

- Major update: modified animations namespaces, <strong>now compatible with non-Western code pages</strong> (got rid if the .exe patch forcing a code page change and rebooting if a non-Western code page is detected) &#128521;
- Integrated all code and animation files BWP Fixpack fixes (thanks to their authors!)
- Svirfneblin Animations component [480-490]: added t-svi variable used in a single routine for its two sub-components
- Fixed Seer animations component [450-455]: "Some beggars and slaves" and "Some beggars" sub-components creatures listings were interverted &#128541;
- Split code into separate components for more comfortable readability
- Moved components tpa files into new "components" folder and kept functions and macros in "lib" folder
- Changed lines of code for further EE compatibility whenever possible
- Code commented as much as possible
- Coding simplification:
    - Used new and more efficient WeiDU functions (not released when Erephine wrote this mod) and got rid of deprecated functions (such as DECOMPILE_BCS_TO_BAF and DECOMPILE_DLG_TO_D)
    - Used new <a href="http://www.shsforums.net/user/10485-sam/">Sam</a>'s ps_recursive_copy.tpa library, a WeiDU action function that will recursively search into a parent directory, then copying files to a destination directory
    - Minor fixes...
- Rewrote Tool IA Reference Picker (can now be translated) and updated its readme
- Updated readme (IA now supports translated readmes)
- Added French translation (Gwendolyne)
- Traification. Feel free to provide me with translations. I will include them as soon as possible
- Updated <acronym title="Weimer Dialogue Utility">WeiDU</acronym> installer to v246

- Used new and more efficient WeiDU functions (not released when Erephine wrote this mod) and got rid of deprecated functions (such as DECOMPILE_DLG_TO_D)


##### WeiDU Beta 5 - May 12, 2010

- Changed the .exe patch so that it forces a code page change and reboots if a non-Western code page is detected
- Updated the .exe patch so that it recognises <acronym title="Baldur's Gate">BG1</acronym> thief avatars
- Cloned missing animation tables from the unmodded game
- Added other missing animation tables to base content folder
- Adding missing minotaur and water weird sounds
- Disabled problematic stacked animations from chitin.key
- Added creature sounds where relevant (major update here)
- Fixed a minor READ_BYTE glitch in creature patching
- Made it certain so that subcomponents can't be installed if the main component is not installed (to prevent crashes)
- Added night hags to the "Distinctive Fiends" component
- Added ghoul queens to the "Distinctive Undead" component
- Added white-haired Ellesime to the "More <acronym title="Icewind Dale II">IWD2</acronym> Animations" component
- Added lagoon creature to the "More <acronym title="Icewind Dale II">IWD2</acronym> Animations" component
- Deprecated tieflings from the cambion/alu-fiend components in favor of the <acronym title="Planescape: Torment">PS:T</acronym> animation component
- Corrected skeleton warriors appearing as verbeegs glitch
- Added Amel animation to <acronym title="Neverwinter Nights">NWN</acronym> component (if <acronym title="Northern Tales of the Sword Coast">NTotSC</acronym> is installed)
- Added Humanoid Animation Fixes component
- Added Moinesse's Avatars component
- Added More <acronym title="Planescape: Torment">PS:T</acronym> Animations component
- Added <acronym title="Baldur's Gate">BG1</acronym> Character Animations for Saved Games component
- Added saved game animation fixing component
- Traified the entire freaking mod by hand for translators (thanks for nothing, <acronym title="Weimer Dialogue Utility">WeiDU</acronym>! &#128541;)


##### WeiDU Beta 4 - February 7, 2010

- Added <acronym title="Baldur's Gate">BG1</acronym> Character Animations for <acronym title="Non-Player Characters">NPCs</acronym> component
- Added <acronym title="Baldur's Gate">BG1</acronym> Character Animations for <acronym title="Player Characters">PCs</acronym> component
- Changed fiend patching to accommodate scripting


##### WeiDU Beta 3 - February 1, 2010

- Fixed _LOW animation corrections causing areas crashing on load
- Fixed scripts and dialogues that Polymorph to _LOW animations
- Fixed code glitch preventing installation of optional components
- Added option to install sounds in svirfneblin component
- Added component to fix area creature references
- Added revised salamander sound tables (MSAL and MSA2 slots)
- Enhanced compatibility with <a href="http://www.shsforums.net/topic/38261-atweaks-v264-released/">aTweaks</a>
- Enhanced creature animation patches for fiends and orc shamans


##### WeiDU Beta 2 - January 23, 2010

- Added installer support for non-ANSI system locales


##### WeiDU Beta 1 - January 11, 2010

- First <acronym title="Weimer Dialogue Utility">WeiDU</acronym> release
- All affected mod and vanilla creatures patched
- Optional components added


##### (r.10010043)

- Fixed a bug with Icewind Dale animation slots in Baldur's Gate II


##### (r.09102252 update)

- Updated documentation and Reference Picker
- Added alternate stylesheet &#128521;


##### (r.09102252)</h6>

- Initial release
<div style="text-align:right"><a href="#top">Back to top</a></div>
