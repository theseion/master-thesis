*ml-threads
newUserProcess
	"Answer a Process running the code in the receiver. The process is not 
	scheduled."
	<primitive: 19> "Simulation guard"
	^UserProcess
		forContext: 
			[self value.
			Processor terminateActive] asContext
		priority: Processor activePriority