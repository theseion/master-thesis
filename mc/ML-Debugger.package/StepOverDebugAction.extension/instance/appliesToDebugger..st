*ML-Debugger-Extensions
appliesToDebugger: aDebugger

	^ (aDebugger session isContextPostMortem: aDebugger currentContext) not