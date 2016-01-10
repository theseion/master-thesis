*actiondescriptions-core
meetsConditionActionDescription
	<actionDescription>
	<gtActionDescription: #transmissionCondition>
	
	^ BreakActionDescription new
		selector: #meetsCondition;
		continueUntilPredicate: (BlockContextPredicate for: [ :aContext | 
			aContext sender selector = #glamourValueWithArgs: and: [
				aContext isBlockContext ] ]);
		debuggerClass: GTGlamourDebugger;
		yourself