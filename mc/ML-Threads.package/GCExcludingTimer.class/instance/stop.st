timing
stop
	| gcTimeAfter |
	super stop.

	gcTimeAfter := Smalltalk vm totalGCTime.
	elapsedTime := 0 max: elapsedTime - gcTimeAfter + gcTimeBefore