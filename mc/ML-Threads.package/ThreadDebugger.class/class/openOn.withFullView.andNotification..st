opening api
openOn: aDebugSession withFullView: aBool andNotification: aString
	| debugger |
	super openOn: aDebugSession withFullView: aBool andNotification: aString
	"debugger := self on: aDebugSession.
	
	aBool | self alwaysOpenFullDebugger
		ifTrue: [ debugger openWithFullView ]
		ifFalse: [ debugger openWithNotification: aString]"