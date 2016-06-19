initialization
initialize
	master := Processor activeProcess.
	masterStackCopy := thisContext copyStack stack.
	masterStack := thisContext stack