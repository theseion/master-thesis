query
findContextHolderSuchThat: aBlock
	^ contextHolders
		detect: aBlock
		ifNone: [
			self process isUserProcess
				ifTrue: [ self process masterProcessHolder findContextHolderSuchThat: aBlock ]
				ifFalse: [ nil ] ]