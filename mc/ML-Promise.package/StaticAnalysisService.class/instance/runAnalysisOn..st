running
runAnalysisOn: inputPath
	| absolutePath promise |
	absolutePath := self absolutePathFrom: inputPath.
	promise := self createPromiseFor: absolutePath.
	self informUserToWait.
	self checkResult: promise value