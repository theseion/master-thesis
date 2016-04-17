examples
exampleDebugLocalException
	[ 1 seconds asDelay wait. 1/0 ] promise
		openDebuggerOnError;
		value