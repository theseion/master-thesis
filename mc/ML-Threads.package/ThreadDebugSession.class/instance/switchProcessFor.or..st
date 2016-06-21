private
switchProcessFor: aContext or: aBlock
	| index candidateContexts |
	^ (aContext isBottomContext or: [
		(interruptedProcess suspendedContext hasContext: aContext) not ])
			ifTrue: [
				interruptedProcess isUserProcess
					ifTrue: [
						"interruptedProcess master suspendedContext ifNil: [
							self resume.
							index := (interruptedProcess masterStack indexOf: aContext) isZero ifTrue: [
								(interruptedProcess masterStackCopy indexOf: index) ].
							candidateContexts := interruptedProcess masterStack copyAfter: index.
							candidateContexts
								detect: [ :context | self filteredCombinedStack includes: context ]
								ifNone: [ candidateContexts detect: [ :context |
										 context isDead not ] ] ]."
						"let the process terminate itself"
						interruptedProcess resume.
						interruptedProcess master suspendedContext ifNil: [
							aContext isBottomContext ifTrue: [
								interruptedProcess masterStack first isDead
									ifTrue: [ interruptedProcess masterStackCopy first ]
									ifFalse: [ interruptedProcess masterStack first ] ] ].
						interruptedProcess := interruptedProcess master.
						interruptedProcess suspendedContext ]
					ifFalse: [ self halt ] ]
			ifFalse: [ aBlock value ]