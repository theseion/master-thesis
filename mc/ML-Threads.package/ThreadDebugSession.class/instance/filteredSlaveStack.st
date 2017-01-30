private
filteredSlaveStack
	| stack stackLength |
	stack := interruptedContext stack.
	"skip process creation context"
	stackLength := stack size - 1.
	Smalltalk
		at: #SeamlessProxy
		ifPresent: [
			Smalltalk
				at: #RemotePromise
				ifPresent: [
					stack
						detect: [ :ctxt |
							ctxt selector = #evaluate:for: and: [
								ctxt receiver className = 'RemotePromise class' ] ]
						ifFound: [ :ctxt |
								stackLength := (stack indexOf: ctxt) - 1 ] ] ].
	^ stack first: stackLength