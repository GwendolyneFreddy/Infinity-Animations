<div align="center"><h1>Infinity Animations todo list</h1>
</div>

![GitHub help wanted](https://img.shields.io/badge/%20-help--wanted-%23159818?style=plastic)

Anyone interested in contributing may contact Gwendolyne at <a href="http://www.shsforums.net/user/24495-gwendolyne/">SHS</a>!

<hr>

#### Before official release

- [ ] Remove all DEBUGGING CONTROL LOG messages
- [ ] Arrays: fill all unknown creature mods references
- [x] Check WRITE_LONG 0x28 ID values
- [x] Modders content: Check Ulb's sound files encoding (2021.02.27: converted to wavc)

## 

#### All components: new improvements

- [ ] Dynamically build exclusion arrays specific to the player's modded game: t-exc-cre (diffucult to build because components specific, but why not?), t-exc-scim (scimitars exclusion: easy), t-exc-shld (shields exclusion: easy) and (wings exclusion: easy).


## 

#### EE version

- [ ] <ins>All components<_ins>: list all EE games specific creatures that need to be patched
- [ ] <ins>Distinctive Fiends component</ins>: Is it very useful to add creatures sound clips for EE games?
- [ ] <ins>IA Reference Picker documentation</ins>: update animation types description.

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

- [ ] <ins>*Erinyes get wings and elf animations*</ins>: write a better 1pp compatibility?
- [ ] Which demons might get the EE FIEND_RED animation (new ee_tob content)?

## 

##### Cambions get Isair Animation component [260-280]

- [ ] gw_ia_cambions_arrays.tph: Should we removed from this array a few creatures designed to be Lesser demons and not cambions? [demlord and uddemon (BG2), kz#dmlrd (Kiara-Zaiya), tg#did1 (Refinements)]

## 

##### Distinctive Undead component [400]

- [ ] Remove IA Base Animations content requirement as it is automatically installed by main component as of this version?
- [ ] <ins>*Ghoul Queens get the ghoul_queen animation*</ins>: replace `ACTION_IF FILE_EXISTS_IN_GAME ~%nb%.cre~ AND FILE_EXISTS_IN_GAME ~3erg1.bam~` condition with Fiends_Genies content requirement check?

## 

##### Seer Animation component [450-455]

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

- [ ] Resolve illasera duplicate entries in GW_moinesse_mage_female_human and GW_moinesse_fighter_female_human arrays.

## 

#### BG1 Animations for NPCs component [8000-8010-8020-8030]

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
- [ ] The following bof has never been reported, but should be fixed: it crashes the game if BG1 Animations for NPCs and Exported PCs components are not installed.
   1. Change its requirements?
   2. Force its installation if either one of the above components is installed?

## 

#### Saved Games Animations Fixer component [9900-9910]

- [ ] Why asking for each saved game?

## 

####  component []

- [ ] 
