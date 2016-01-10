*actiondescriptions-core
presentationsActionDescription
	<actionDescription>
	<gtActionDescription: #presentationCreation>
	
	^ BreakActionDescription new
		selector: #presentations;
		continueUntilPredicate: (BlockContextPredicate for: [ :aContext | 
			aContext sender selector = #glamourValueWithArgs: and: [
				aContext isBlockContext ] ]);
		debuggerClass: GTGlamourDebugger;
		yourself