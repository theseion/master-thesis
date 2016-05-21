running
runAnalysisOnPath: inputPath
	| absolutePath closure promise |
	absolutePath := self absolutePathFrom: inputPath.
	closure := [ self privateRunAnalysisOnPath: absolutePath ].
	promise := closure remotePromiseOn: self connection.
	promise
		openDebuggerOnError;
		run.
	self informUserToWait.
	self checkResult: promise value