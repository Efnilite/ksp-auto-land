RCS ON.

CLEARSCREEN.

LOCK STEERING TO RETROGRADE.

PRINT "LOCKING STEERING".

WAIT UNTIL ALTITUDE < 35_000.

AG1 ON.
BRAKES ON.

PRINT "BRAKING".

WAIT UNTIL ALTITUDE < 10000.

// CALCULATE AMOUNT OF TIME REQUIRED AT 100% THROTTLE TO GO TO 0 SPEED
// EVERY ITER IMPROVES ESTIMATE UNTIL ABSOLUTELY REQUIRED TO BURN.

SET START_ALTITUDE TO -1.

UNTIL ALTITUDE < START_ALTITUDE {
    SET M TO MASS * 1000. // KSP RETURNS IN TONNES. WHY?
    SET MAXF TO MAXTHRUST * 1000. // KSP IN kN. WHY?

    SET MAX_VERT_DECEL TO 0.92 * MAXF/M. // todo fix

    PRINT MAX_VERT_DECEL.

    SET BOOST_TIME TO -VERTICALSPEED / MAX_VERT_DECEL.
    SET START_ALTITUDE TO 0.5 * MAX_VERT_DECEL * BOOST_TIME^2 + 22. // HEIGHT OF ROCKET

    PRINT BOOST_TIME.
    PRINT START_ALTITUDE.
}

WAIT UNTIL ALTITUDE < START_ALTITUDE.

PRINT "INITING SUICIDE BURN".

LOCK THROTTLE TO 1.0.
// LOCK STEERING TO RETROGRADE.
UNLOCK STEERING.

WAIT UNTIL ALTITUDE < 3 OR VERTICALSPEED > 0.

PRINT "FINAL".

LOCK THROTTLE TO 0.
SET SAS TO FALSE.
SET SHIP:CONTROL:PILOTMAINTHROTTLE TO 0.