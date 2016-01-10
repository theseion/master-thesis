*actiondescriptions-core
startOnActionDescription
	<actionDescription>
	<gtActionDescription: #stepToGlamourDebugger>
	
	^ BreakActionDescription new
		selector: #startOn:;
		classes: self allSubclasses;
		debuggerClass: GTGlamourDebugger;
		yourself