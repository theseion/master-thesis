private-testing
isRemoteRunMethod: aContext
	^ (aContext selector = #evaluate: and: [
		aContext receiver name = #RemotePromise]) or: [
		aContext receiver isMessageSend and: [
			aContext sender selector = #executeFor: ] ]