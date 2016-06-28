accessing
debugSession
	^ debugSession ifNil: [ debugSession := ThreadDebugSession for: self promise ]