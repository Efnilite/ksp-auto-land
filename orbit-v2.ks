CLEARSCREEN.

RCS ON.

PRINT "FULL THROTTLE".

WAIT 1.

LOCK THROTTLE TO 1.
LOCK STEERING TO UP.

STAGE.

PRINT "GO".

// ORBIT FOLLOWING 
// FOLLOWS -(1/(10^10.5))y^3 + 90

SET RECOMMENDED TO HEADING(90, 90, -90).
LOCK STEERING TO RECOMMENDED.

WAIT UNTIL ALTITUDE > 1_000.

UNTIL ALTITUDE > 20_000 {

    SET RECOMMENDED TO HEADING(90, 90 - (ALTITUDE - 2_000)/18_000 * 45, -90).    

    PRINT 90 - (ALTITUDE - 2_000)/18_000 * 45.
}

WAIT UNTIL ALTITUDE > 20_000.

SET RECOMMENDED TO HEADING(90, 45, -90).

// STOP BOOSTER

WAIT UNTIL APOAPSIS > 110_000.

LOCK THROTTLE TO 0.
LOCK STEERING TO PROGRADE.

WAIT UNTIL APOAPSIS > 100_000 AND ETA:APOAPSIS < 4.

PRINT "FINALIZING BURN".

LOCK THROTTLE TO 1.0.
LOCK STEERING TO PROGRADE.

WAIT UNTIL PERIAPSIS > 90_000.

PRINT "FINALIZED".

LOCK THROTTLE TO 0.
LOCK STEERING TO PROGRADE.
SET SHIP:CONTROL:PILOTMAINTHROTTLE TO 0.
