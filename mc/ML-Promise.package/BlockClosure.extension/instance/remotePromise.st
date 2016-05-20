*ml-promise-examples
remotePromise
	<promiseEntryPoint>
	^ Promise new
		run: self;
		openDebuggerOnError;
		yourself