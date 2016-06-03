private
stepWith: aBlock inContext: aContext inStack: aCollection
	^ self
		switchProcessFor: aContext
		or: [
			(aCollection includes: aContext)
				ifTrue: [
					aBlock
						value: interruptedProcess
						value: aContext ]
				ifFalse: [ interruptedProcess complete: aContext ] ]