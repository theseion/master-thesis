*actiondescriptions-core
executeAction
	ActionDescription
		executeActionsWithPragma: #gtActionDescription:
		condition: [ :pragma |
			(pragma argumentAt: 1) = #stepToGlamourDebugger ].

	
	self session
		resume;
		clear.
	self debugger close