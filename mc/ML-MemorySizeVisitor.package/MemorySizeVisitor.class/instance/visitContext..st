visiting
visitContext: anObject
	"Stuff outside of the #DoIt context belong to the static environment.
	Closures within the #DoIt context will have the same selector, so there
	may be multiple contexts with the DoIt selector"
	firstContext ifTrue: [
		firstContext := false.
		isDoIt := anObject callChainAnySatisfy: [ :ctxt |
			ctxt method isDoIt ] ].
	(anObject method isDoIt not and: [
		isDoIt and: [ (anObject callChainAnySatisfy: [ :ctxt |
			ctxt selector = #evaluate ]) not ] ]) ifTrue: [ ^ self ].

	self visitObject: anObject