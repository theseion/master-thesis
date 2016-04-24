accessing
debugSession
	^ debugSession ifNil: [ debugSession := PromiseDebugSession for: self promise ]