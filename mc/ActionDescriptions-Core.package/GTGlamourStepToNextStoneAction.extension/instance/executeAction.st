*actiondescriptions-core
executeAction
	ActionDescription executeActionsWithPragma: #gtActionDescription:
		condition: [ :pragma |
			self debugStoneType isNil or: [
				(pragma argumentAt: 1) = self debugStoneType ] ].
		
	self session
		resume;
		clear.
	self debugger close