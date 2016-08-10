tests
testStackContainsContextsOfMaster
	| process |
	process := self newUserProcess.

	thisContext stack do: [ :context |
		self assert: (process masterProcessHolder stack identityIncludes: context) ].