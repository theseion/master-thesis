*actiondescriptions-core
valueActionDescription
	<actionDescription>
	<gtActionDescription: #transmissionTransformation>
	
	^ BreakActionDescription new
		selector: #value;
		continueUntilPredicate: (BlockContextPredicate for: [ :aContext | 
			aContext sender selector = #glamourValueWithArgs: and: [
				aContext isBlockContext ] ]);
		debuggerClass: GTGlamourDebugger;
		yourself