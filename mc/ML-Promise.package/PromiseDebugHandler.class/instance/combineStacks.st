private
combineStacks
	self contextStore combinedContext: (self contextStore exceptionContext bottomContext privSender: self contextStore originContext)