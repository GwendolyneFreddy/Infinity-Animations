// By Turambar	- http://www.shsforums.net/topic/45497-glowing-undead/?p=496098

// begin glowcheck
sz = SOURCE_SIZE
PATCH_IF ("%sz%" > "0x2d3") BEGIN

	PATCH_IF SHORT_AT 0x28 = 0x6403 BEGIN  // skeleton
		SET glow=1
	END ELSE BEGIN
		SET glow=0
	END

	READ_LONG 0x2bc itemsoffset
	READ_LONG 0x2b8 itemslot
	READ_LONG 0x2c0 items
    READ_SHORT (%itemslot% + 0x08) ring  // left ring
	SET hasitem = 0
	FOR (i = 0 ; i < 21 ; i += 20) BEGIN
    	PATCH_IF NOT (%ring% = 65535) BEGIN // has any ring there
			SET lring = %itemsoffset% + 20*%ring%
       		READ_ASCII %lring% rname
    		PATCH_IF NOT ("%rname%" STRING_CONTAINS_REGEXP ~ring[g-n]?9~) BEGIN // immunity ring
       			PATCH_IF hasitem BEGIN
					REMOVE_CRE_ITEM RING95  // remove duplicated rings
					REMOVE_CRE_ITEM RING99  // remove duplicated rings
					REMOVE_CRE_ITEM RINGG95 // remove duplicated rings
					REMOVE_CRE_ITEM RINGN99 // remove duplicated rings
        		END
				// now, he doesn't have any more, but remembers the old one
   				PATCH_IF glow BEGIN
   					PATCH_IF ("%rname%" STRING_CONTAINS_REGEXP ~ring[g-n]?99~) BEGIN  // ring95
   						WRITE_ASCII %lring% ~RINGG95~ #8  // change ring with glowing bg2 version
   						SET ringg95need = 3               // need modded ring
   					END ELSE BEGIN
   						WRITE_ASCII %lring% ~RING99~ #8   // change ring with glowing bg1 version
   					END
   				END ELSE BEGIN
					// noglow
   					PATCH_IF ("%rname%" STRING_CONTAINS_REGEXP ~ring[g-n]?99~) BEGIN // ring95, contains is true if not contains
   						WRITE_ASCII %lring% ~RING95~ #8   // change ring with unglowing bg2 version
   					END ELSE BEGIN
   						WRITE_ASCII %lring% ~RINGN99~ #8  // change ring with unglowing bg1 version
    					SET ringn99need = 3               // need modded ring
  					END
				END
				SET hasitem = 1
			END	// of immunity ring
			READ_SHORT ("%itemslot%" + 0x0a) "ring"  // right ring
		END		// of have ring
	END			// of looping
END				// of sz>0x2d3
