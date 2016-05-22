private
createPromiseFor: absolutePath
	| closure promise |
	closure := [ self privateRunAnalysisOn: absolutePath ].
	promise := closure remotePromiseOn: self connection.
	^ promise
		openDebuggerOnError;
		run;
		yourself