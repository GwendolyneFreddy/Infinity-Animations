/* ====================================================================================== *
 *                                                                                        *
 *        F U N C T I O N S    &    M A C R O S    :    R A N D O M    V A L U E S        *
 *                                                                                        *
 * ====================================================================================== */

DEFINE_ACTION_FUNCTION ~gw_set_random_value~
	INT_VAR gw_choice = 0
	RET     gw_random_value
BEGIN

	// 100% chance
	// -----------
	OUTER_SET rmq = 7

	// 25% chance
	// ----------
	ACTION_IF gw_choice = 1 BEGIN

		OUTER_SET gw_random_value = RANDOM(1 8)

	END ELSE BEGIN
		
		// 50% chance
		// ----------
		ACTION_IF gw_choice = 2 BEGIN

			OUTER_SET gw_random_value = RANDOM(5 8)

		END ELSE BEGIN

			// 75% chance
			// ----------
			ACTION_IF gw_choice = 3 BEGIN

				OUTER_SET gw_random_value = RANDOM(6 9)

			END

		END

	END

END
