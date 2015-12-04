*actiondescriptions-core
matchesActionDescription
	<actionDescription>
	<gtActionDescription: #presentationCreation>
	
	^ BreakActionDescription new
		selector: #matches;
		continueUntilPredicate: (BlockContextPredicate for: [ :aContext | 
			aContext sender selector = #glamourValueWithArgs: and: [
				aContext isBlockContext ] ]);
		debuggerClass: GTGlamourDebugger;
		yourself