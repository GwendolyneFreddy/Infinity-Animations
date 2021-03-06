<div align="center"><h1>Infinity Animations todo list</h1>
</div>

![GitHub help wanted](https://img.shields.io/badge/%20-help--wanted-%23159818?style=plastic)

Anyone interested in contributing may contact Gwendolyne at <a href="http://www.shsforums.net/user/24495-gwendolyne/">SHS</a>!

<hr>

#### Before official release

- [ ] Remove all DEBUGGING CONTROL LOG messages
- [ ] Arrays: fill all unknown creature mods references
- [x] Modders content: Check Ulb's sound files encoding (2021.02.27: converted to wavc)

## 

#### EE version

- [ ] All components: list all EE games specific creatures that need to be patched
- [ ] Distinctive Fiends component: Is it very useful to add creatures sound clips for EE games?

## 

#### Humanoid Animations Fixes component

- [ ] *Male Sailors get the sailor_man animation*: add new options with new IA_EE content (colored sailors)?
- [ ] *Male human Shadow Thieves get the shadow_thief animation*: add arnfgt04, flyfgt02, flyfgt03 and repthf12?

## 

#### Distinctive Genies component

- [ ] Djinnis: ddguard2 and ddguard3 class is GENIE_EFREETI. Should they be reverted into the efreeti array?
- [ ] ee_tob content: why not use the EE EFREETI_NOBLE animation for some Efreetis?

## 

#### Distinctive Fiends component

- [ ] *Erinyes get wings and elf animations*: write a better 1pp compatibility?
- [ ] Which demons might get the EE FIEND_RED animation (new ee_tob content)?

## 

##### Cambions get Isair Animation component

- [ ] gw_ia_cambions_arrays.tph: Should we removed from this array a few creatures designed to be Lesser demons and not cambions? demlord and uddemon (BG2), kz#dmlrd (Kiara-Zaiya), tg#did1 (Refinements).

## 

##### Distinctive Undead component

- [ ] Remove IA Base Animations content requirement as it is automatically installed by main component as of this version?
- [ ] *Ghoul Queens get the ghoul_queen animation*: replace `ACTION_IF FILE_EXISTS_IN_GAME ~%nb%.cre~ AND FILE_EXISTS_IN_GAME ~3erg1.bam~` condition with Fiends_Genies content requirement check?

## 

##### Seer Animation component

- [ ] gw_ia_seers_arrays.tph: Why not merging all arrays into one single and use t-seer variable to patch only beggars, slaves, or both?

## 

#### More IWD Animations component

- [ ] Animated Plates: choose between the IWD animations or the IA ones (smaller, by default)...

## 

#### BG1 Animations for NPCs component

- [ ] Why not dynamically build all arrays?

