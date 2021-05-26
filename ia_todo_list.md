<div align="center"><h1>Infinity Animations todo list</h1>
</div>

![GitHub help wanted](https://img.shields.io/badge/%20-help--wanted-%23159818?style=plastic)

Anyone interested in contributing may contact Gwendolyne at <a href="http://www.shsforums.net/user/24495-gwendolyne/">SHS</a>!

<hr>

#### Before official release

- [ ] Remove all DEBUGGING CONTROL LOG messages
- [ ] Arrays: fill all unknown mods creatures references
- [x] Checked WRITE_LONG 0x28 ID values
- [x] Modders content: Checked Ulb's sound files encoding (2021.02.27: converted to wavc)
- [x] Fixed Ellesime White-Haired\3aag2.bam <a ref="http://www.shsforums.net/topic/44203-ia-bugs-and-fixes/page-4#entry490477">red hair color</a> (2021.04.24 : thanks Sam!)
- [ ] Check ABISHAI_BLACK bam files (classic and EE games versions seem to be different).
- [x] 0x2000 SIRINE, 0x2200 OGRE_MAGE, 0x7000 HALF_OGRE, 0x7001 OGRILLON and 0x7f3d MELISSAN : Added missing localized sound clips (2021.03.25)
- [x] 0x2300 DEATH_KNIGHT, 0x7f11 UMBER_HULK and 0xe0d0 UMBER_HULK_ELDER : Added missing localized sound clips (2021.03.26)
- [x] Resolved the f.....g mess with black dragon sound clips and ini files, different and buggy in EE games (2021.03.27)
- [ ] 0x6405 DOOM_GUARD and 0x6406 DOOM_GUARD_LARGER: populate ini files with IA t-dug[n] sound clips?
- [ ] IWD:EE: harmonize 1201.ini and 1203.ini (DRAGON_BLACK and DRAGON_GREEN) sound clips (replace black0[1-5] with black0[1-5]a)?

## 

#### All components: new improvements

- [ ] Dynamically build exclusion arrays specific to the player's modded game: t-exc-cre (difficult to build because components specific, but why not?), t-exc-scim (scimitars exclusion: easy), t-exc-shld (shields exclusion: easy) and wings exclusion (easy).


## 

#### EE version

- [ ] Check new patches: maybe they added missing animations? (WIP)
- [x] <ins>Note for modders</ins>: add a section explaining ini files keywords meanings. (2021.05.18 : thanks Argent77 for proofreading and providing missing definitions!)
- [ ] <ins>All components</ins>: list all EE games specific creatures that need to be patched.
- [ ] <ins>Distinctive Fiends component</ins>: Is it very useful to add creatures sound clips for EE games?
- [ ] <ins>IA Reference Picker documentation</ins>: update animation types description.
- [ ] <ins>Main component</ins>: force iwd_lizard_man animation files installation? (pure cosmetics: remove useless mirrored direction in files. :wink:)

## 

#### Humanoid Animations Fixes component [25]

- [ ] <ins>*Male Sailors get the sailor_man animation*</ins>: add new options with new IA_EE content (colored sailors)?
- [ ] <ins>*Male human Shadow Thieves get the shadow_thief animation*</ins>: add arnfgt04, flyfgt02, flyfgt03 and repthf12?

## 

#### Distinctive Genies component [50]

- [ ] Djinnis: ddguard2 and ddguard3 class is GENIE_EFREETI. Should they be reverted into the efreeti array?
- [ ] <ins>ee_tob content</ins>: why not use the EE EFREETI_NOBLE animation for some Efreetis?

## 

#### Distinctive Fiends component [100]

- [ ] <ins>*Erinyes get wings and elf animations*</ins>: write a better 1pp compatibility code?
- [ ] Which demons might get the EE FIEND_RED animation (new ee_tob content)?
- [ ] <a ref="http://www.shsforums.net/topic/54604-erinyes-causing-an-assertion-error/">Erinyes bug causing crash</a>: could not reproduce it...

## 

#### Cambions get Isair Animation component [260-280]

- [ ] gw_ia_cambions_arrays.tph: Should we removed from this array a few creatures designed to be Lesser demons and not cambions? [demlord and uddemon (BG2), kz#dmlrd (Kiara-Zaiya), tg#did1 (Refinements)]

## 

#### Distinctive Undead component [400]

- [ ] Remove IA Base Animations content requirement as it is automatically installed by main component as of this version?
- [ ] <ins>*Ghoul Queens get the ghoul_queen animation*</ins>: replace `ACTION_IF FILE_EXISTS_IN_GAME ~%nb%.cre~ AND FILE_EXISTS_IN_GAME ~3erg1.bam~` condition with Fiends_Genies content requirement check?

## 

#### Seer Animation component [450-455]

- [ ] gw_ia_seers_arrays.tph: Why not merging all arrays into one single and use t-seer variable to patch only beggars, slaves, or both?

## 

#### More Base Animations component [500]

- [ ] Remove IA Base Animations content requirement as it is automatically installed by main component as of this version?

## 

#### More IWD Animations component [550]

- [ ] Animated Plates: choose between original IWD animations or IA ones (smaller, by default) might be a good option to add...

## 

#### More PsT Animations component [710-720-760-740]

- [ ] Resolve duplicate entries that cause conflicts between BG and BG2 creatures (mtown5, shop04 and shop07).

## 

#### Moinesse's Avatars for IA component [7000-7010-7020-7030]

- [ ] Fix paperdolls x and y offsets to display equipment overlays properly: MOINESSE_THIEF_FEMALE.
- [ ] Resolve illasera duplicate entries in GW_moinesse_mage_female_human and GW_moinesse_fighter_female_human arrays.

## 

#### BG1 Animations for NPCs component [8000-8010-8020-8030]

- [ ] Fix paperdolls x and y offsets to display properly equipment overlays.
    - Classic games: CLERIC_MALE_ELF, CLERIC_FEMALE_HUMAN, CLERIC_FEMALE_ELF, FIGHTER_MALE_ELF, FIGHTER_FEMALE_ELF.
    - EE games: CLERIC_FEMALE_HALFORC_BG1, FIGHTER_FEMALE_HALFORC_BG1 (THIEF_FEMALE_HALFORC_BG1 DONE!).
- [ ] Why not dynamically build an array of NPCs to be patched?
- [ ] What about halforc animations?
- [ ] Write a more inclusive 1PP compatibility (maybe include some 1pp BG1 avatars and animations content)?

## 

#### Fix Area Creature References component [9000]

- [ ] Why not dynamically build an array of areas to be patched, or even patch all areas?
- [ ] t-arecre.log: it might be less confusing to remove New Animation reference (mostly character animation replacing removed _LOW animation) and only display the new creature animation (in many cases, IA modifies twice a creature animation: first, the main component replaces _LOW animation, then another component replaces it with a specific distinctive animation - PsT, BG1...)?

## 

#### BG1 Character Animations for Saved Games component [9600-9610-9620]

- [ ] Why asking for each saved game?
- [ ] Externalize t-bg1gam macro?
- [ ] What about distinctive CLERIC_FEMALE_DWARF, FEMALE_DWARF, MAGE_FEMALE_DWARFand THIEF_FEMALE_DWARF animations?
- [ ] The following bug has never been reported, but should be fixed: it crashes the game if BG1 Animations for NPCs and Exported PCs components are not installed.
   1. Change its requirements?
   2. Force its installation if either one of the above components is installed?

## 

#### Saved Games Animations Fixer component [9900-9910]

- [ ] Why asking for each saved game?
