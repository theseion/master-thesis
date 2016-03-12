accessing
default
	^ default ifNil: [ default := PromiseGhostBehaviour new ]