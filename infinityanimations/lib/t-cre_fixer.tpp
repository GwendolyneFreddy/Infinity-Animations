sz = SOURCE_SIZE
PATCH_INCLUDE ~infinityanimations/lib/fj_cre_reindex.tpp~

READ_LONG 0x2b8 so						// Slots offset
READ_LONG 0x2bc io						// Items offset
READ_LONG 0x2c0 ic						// Item count
READ_SSHORT (so + 4) hn ELSE (0 - 1)	// Shield number

PATCH_IF (hn > (0 - 1)) AND (hn < ic) BEGIN
	sf = hn * 0x14 + io	// Item offset
	READ_ASCII sf sd	// Item
	TO_LOWER sd
	PATCH_IF NOT FILE_EXISTS_IN_GAME ~%sd%.itm~ BEGIN
		INNER_ACTION BEGIN
			APPEND_OUTER ~infinityanimations/batch/t-cre_fixer.log~ ~%sr%	%sd%	0x4	Shield slot item does not exist~
		END
		REMOVE_CRE_ITEM ~%sd%~
		hn = 0 - 1
	END
END ELSE BEGIN
	PATCH_IF (hn > (ic - 1)) OR (hn < (0 - 1)) BEGIN
		INNER_ACTION BEGIN
			APPEND_OUTER ~infinityanimations/batch/t-cre_fixer.log~ ~%sr%	N/A	0x4	Invalid shield slot assignment~
		END
		WRITE_SHORT (so + 4) (0 - 1)
		hn = 0 - 1
	END
END

PATCH_FOR_EACH wp IN 0x12 0x14 0x16 0x18 0x4a BEGIN	// Weapon slots
	READ_SSHORT (so + wp) tn ELSE (0 - 1)			// Item number
	PATCH_IF (tn > (0 - 1)) AND (tn < ic) BEGIN
		tf = tn * 0x14 + io	// Item offset
		READ_ASCII tf tm	// Item
		TO_LOWER tm
		PATCH_IF NOT FILE_EXISTS_IN_GAME ~%tm%.itm~ BEGIN
			INNER_ACTION BEGIN
				APPEND_OUTER ~infinityanimations/batch/t-cre_fixer.log~ ~%sr%	%tm%	%wp%	Weapon slot item does not exist~
			END
			REMOVE_CRE_ITEM ~%tm%~
			PATCH_IF (~%tm%~ STRING_EQUAL ~_bow01~ = 1) BEGIN
				ADD_CRE_ITEM ~bow01~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP TWOHANDED
			END ELSE BEGIN
				PATCH_IF (~%tm%~ STRING_EQUAL ~_bow05~ = 1) BEGIN
					ADD_CRE_ITEM ~bow05~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP TWOHANDED
				END ELSE BEGIN
					PATCH_IF (~%tm%~ STRING_EQUAL ~2hsw02~ = 1) BEGIN
						ADD_CRE_ITEM ~sw2h02~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP TWOHANDED
					END ELSE BEGIN
						PATCH_IF (~%tm%~ STRING_EQUAL ~b#axh01~ = 1) BEGIN
							ADD_CRE_ITEM ~b#ax1h01~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP
						END ELSE BEGIN
							PATCH_IF (~%tm%~ STRING_EQUAL ~b3-18~ = 1) OR (~%tm%~ STRING_EQUAL ~crgolhnd~ = 1) OR (~%tm%~ STRING_EQUAL ~garghnd~ = 1) OR (~%tm%~ STRING_EQUAL ~gelughnd~ = 1) OR (~%tm%~ STRING_EQUAL ~gglabhnd~ = 1) BEGIN
								ADD_CRE_ITEM ~b3-18m3~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP
							END ELSE BEGIN
								PATCH_IF (~%tm%~ STRING_EQUAL ~beetbor~ = 1) OR (~%tm%~ STRING_EQUAL ~beholdmt~ = 1) OR (~%tm%~ STRING_EQUAL ~s#fform~ = 1) BEGIN
									ADD_CRE_ITEM ~b3-24~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP
								END ELSE BEGIN
									PATCH_IF (~%tm%~ STRING_EQUAL ~blunt06~ = 1) BEGIN
										ADD_CRE_ITEM ~blun06~ #0 #0 #0 ~NONE~ ~WEAPON2~
									END ELSE BEGIN
										PATCH_IF (~%tm%~ STRING_EQUAL ~dragyell~ = 1) BEGIN
											ADD_CRE_ITEM ~dragbrow~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP
										END ELSE BEGIN
											PATCH_IF (~%tm%~ STRING_EQUAL ~dw#demiv~ = 1) OR (~%tm%~ STRING_EQUAL ~dw#dvefr~ = 1) BEGIN
												ADD_CRE_ITEM ~bl3-12m4~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP
											END ELSE BEGIN
												PATCH_IF (~%tm%~ STRING_EQUAL ~f_guecla~ = 1) BEGIN
													ADD_CRE_ITEM ~f_gueclw~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP
												END ELSE BEGIN
													PATCH_IF (~%tm%~ STRING_EQUAL ~gibbtouh~ = 1) BEGIN
														ADD_CRE_ITEM ~p2-8~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP
													END ELSE BEGIN
														PATCH_IF (~%tm%~ STRING_EQUAL ~longraid~ = 1) OR (~%tm%~ STRING_EQUAL ~sh1h04~ = 1) OR (~%tm%~ STRING_EQUAL ~swih04~ = 1) BEGIN
															ADD_CRE_ITEM ~sw1h04~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP
														END ELSE BEGIN
															PATCH_IF (~%tm%~ STRING_EQUAL ~sling04~ = 1) BEGIN
																ADD_CRE_ITEM ~slng04~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP
															END ELSE BEGIN
																PATCH_IF (~%tm%~ STRING_EQUAL ~staff01~ = 1) BEGIN
																	ADD_CRE_ITEM ~staf01~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP TWOHANDED
																END ELSE BEGIN
																	PATCH_IF (~%tm%~ STRING_EQUAL ~subrfis1~ = 1) BEGIN
																		ADD_CRE_ITEM ~subrpis1~ #5 #0 #0 ~NONE~ ~QITEM~
																	END ELSE BEGIN
																		PATCH_IF (~%tm%~ STRING_EQUAL ~subrfis2~ = 1) BEGIN
																			ADD_CRE_ITEM ~subrpis2~ #5 #0 #0 ~NONE~ ~QITEM~
																		END ELSE BEGIN
																			PATCH_IF (~%tm%~ STRING_EQUAL ~subrfis3~ = 1) BEGIN
																				ADD_CRE_ITEM ~subrpis3~ #5 #0 #0 ~NONE~ ~QITEM~
																			END ELSE BEGIN
																				PATCH_IF (~%tm%~ STRING_EQUAL ~u1ham5b~ = 1) BEGIN
																					ADD_CRE_ITEM ~blun04~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP
																				END ELSE BEGIN
																					PATCH_IF (~%tm%~ STRING_EQUAL ~umber1~ = 1) BEGIN
																						ADD_CRE_ITEM ~umber01~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP
																					END ELSE BEGIN
																						PATCH_IF (~%tm%~ STRING_EQUAL ~vamp01~ = 1) OR (~%tm%~ STRING_EQUAL ~kitvswr1~ = 1) BEGIN
																							ADD_CRE_ITEM ~vamp1~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP
																						END
																					END
																				END
																			END
																		END
																	END
																END
															END
														END
													END
												END
											END
										END
									END
								END
							END
						END
					END
				END
			END
		END ELSE BEGIN	// of PATCH_IF NOT FILE_EXISTS_IN_GAME ~%tm%.itm~ BEGIN
			fl = 0
			tp = 0
			INNER_ACTION BEGIN
				COPY_EXISTING ~%tm%.itm~ ~override~
					READ_BYTE 0x18 fl	// Flags
					READ_SHORT 0x1c tp	// Item type
				BUT_ONLY
			END
			PATCH_IF ((fl BOR 0b11111101) = 0b11111111) AND (hn > (0 - 1)) AND (hn < ic) BEGIN
				INNER_ACTION BEGIN
					APPEND_OUTER ~infinityanimations/batch/t-cre_fixer.log~ ~%sr%	%tm%	%wp%	Two-handed weapon equipped with off-hand item %sd%~
					COPY_EXISTING ~%sd%.itm~ ~override~
						READ_SHORT 0x1c sp	// Shield type
					BUT_ONLY
				END
				REMOVE_CRE_ITEM ~%sd%~
				PATCH_IF ((sp > 0xe) AND (sp < 0x1f)) OR (sp = 0x26) OR (sp = 0x39) OR (sp = 0x45) BEGIN
					ADD_CRE_ITEM ~%sd%~ #0 #0 #0 ~NONE~ ~WEAPON1~
				END ELSE BEGIN
					PATCH_IF (sp = 0) AND ((fl BOR 0b11111011) = 0b11111111) BEGIN
						ADD_CRE_ITEM ~%sd%~ #0 #0 #0 ~NONE~ ~INV~
					END ELSE BEGIN
						PATCH_IF sp = 7 BEGIN
							ADD_CRE_ITEM ~%sd%~ #0 #0 #0 ~NONE~ ~HELMET~
						END ELSE BEGIN
							PATCH_IF (sp = 9) OR (sp = 0xb) OR (sp = 0x23) BEGIN
								ADD_CRE_ITEM ~%sd%~ #1 #0 #0 ~NONE~ ~QITEM~
							END
						END
					END
				END
			END
			PATCH_IF ((tp > 0) AND (tp < 0xf)) OR ((tp > 0x1e) AND (tp != 0x26) AND (tp != 0x39) AND (tp != 0x45)) BEGIN
				INNER_ACTION BEGIN
					APPEND_OUTER ~infinityanimations/batch/t-cre_fixer.log~ ~%sr%	%tm%	%wp%	Item of wrong type %tp% in weapon slot~
				END
				REMOVE_CRE_ITEM ~%tm%~
				PATCH_IF tp = 1 BEGIN
					ADD_CRE_ITEM ~%tm%~ #1 #0 #0 ~NONE~ ~AMULET~
				END ELSE BEGIN
					PATCH_IF tp = 2 BEGIN
						ADD_CRE_ITEM ~%tm%~ #0 #0 #0 ~NONE~ ~ARMOR~
					END ELSE BEGIN
						PATCH_IF tp = 3 BEGIN
							ADD_CRE_ITEM ~%tm%~ #0 #0 #0 ~NONE~ ~BELT~
						END ELSE BEGIN
							PATCH_IF (tp = 5) OR (tp = 0xe) OR (tp = 0x1f) BEGIN
								ADD_CRE_ITEM ~%tm%~ #10 #0 #0 ~NONE~ ~QUIVER~
							END ELSE BEGIN
								PATCH_IF (tp = 6) AND (~%tm%~ STRING_EQUAL ~icehnd~ = 1) BEGIN
									ADD_CRE_ITEM ~b4-32m3~ #0 #0 #0 ~NONE~ ~WEAPON1~ EQUIP
								END ELSE BEGIN
									PATCH_IF tp = 7 BEGIN
										ADD_CRE_ITEM ~%tm%~ #0 #0 #0 ~NONE~ ~HELMET~
									END ELSE BEGIN
										PATCH_IF (tp = 9) OR (tp = 0xb) OR (tp = 0x23) BEGIN
											ADD_CRE_ITEM ~%tm%~ #1 #0 #0 ~NONE~ ~QITEM~
										END ELSE BEGIN
											PATCH_IF tp = 0xa BEGIN
												ADD_CRE_ITEM ~%tm%~ #1 #0 #0 ~NONE~ ~RING~
											END ELSE BEGIN
												PATCH_IF tp = 0xc BEGIN
													tw = 1
												END ELSE BEGIN
													ADD_CRE_ITEM ~%tm%~ #1 #0 #0 ~NONE~ ~INV~
												END
											END
										END
									END
								END
							END
						END
					END
				END
			END
		END
	END ELSE BEGIN
		PATCH_IF (tn > (ic - 1)) OR (tn < (0 - 1)) BEGIN
			INNER_ACTION BEGIN
				APPEND_OUTER ~infinityanimations/batch/t-cre_fixer.log~ ~%sr%	N/A	%wp%	Invalid weapon slot assignment~
			END
			WRITE_SHORT (so + wp) (0 - 1)
		END
	END
END

wc = 0 - 1	// Weapon count
wd = 3		// Weapon decrement
wf = 0
READ_LONG 0x2b8 so // Slots offset
READ_LONG 0x2c0 ic // Item count
PATCH_FOR_EACH wp IN 0x18 0x16 0x14 0x12 BEGIN	// Weapon slots
	READ_SSHORT (so + wp) tn ELSE (0 - 1)		// Item number
	PATCH_IF (tn > (0 - 1)) AND (tn < ic) BEGIN
		wc += 1
		wf = (wp - 0x12) / 2
	END ELSE BEGIN
		PATCH_IF tn = (0 - 1) BEGIN
			wd -= 1
		END
	END
END
READ_SSHORT (so + 0x4c) ws // Weapon selected

PATCH_IF (ws > wc) OR (ws < wd) BEGIN 
	WRITE_SHORT (so + 0x4c) wf
END
