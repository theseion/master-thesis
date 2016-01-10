*actiondescriptions-core
stepUntil: aPredicate from: aContext
	"Resume self until the top context safisfy the given condition."

	| ctxt |
	
	ctxt := aContext.
	[ 
		ctxt isNil or: [aPredicate matches: ctxt]
	] whileFalse: [
		ctxt := self step: ctxt.
	].
	^ ctxt