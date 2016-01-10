*ML-Debugger-Extensions
appliesToDebugger: aDebugger

	^ (aDebugger session isContextPostMortem: aDebugger currentContext) not and: [ 
		aDebugger bytecodePresentation selection offset > aDebugger currentContext pc ]