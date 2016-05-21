*ml-promise
prepareObjectForTransfer

	| strategy |
	self initializeForTransfer.

	traveler referencesDo: [:eachNode |		
		(objectsByValue includes: eachNode) ifFalse: [ 
			strategy := network transferStrategyFor: eachNode.
			strategy prepareTransferOf: eachNode by: self].
	]