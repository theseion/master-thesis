*ml-promise
exceptionResponceWithMessage: exceptionString andOptionalRemoteException: exception forProcess: localProcessId
	
	| exceptionProxy |
	exception ifNotNil: [ "you already pass the exception by proxy but for the time being just print the msgText" 
		"processManager resume: localProcessId withNewRemoteException: exceptionString."
		exceptionProxy := exception resolveWith: distributionStrategy policy.
		processManager resume: localProcessId withResult: (
		SeamlessThrowExceptionResult with: exceptionProxy).
	] ifNil: [
		processManager resume: localProcessId withNewRemoteException: exceptionString.
	]