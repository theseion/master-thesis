private
run: aBlock with: aConnection
	self contextStore masterProcessHolder: (ProcessHolder for: Processor activeProcess).
	self run: [ 
		| network remotePeer request remoteEnvironment remotePromise message |
		network := SeamlessNetwork new.
		network addTransferStrategy: (SeamlessTransferByValueStrategy for: (Identical to: aBlock)).
		remoteEnvironment := network environmentAt: aConnection.
		remotePromise := remoteEnvironment at: #RemotePromise.
		remotePeer := network remotePeerAt: aConnection.	
		message := MessageSend receiver: remotePromise selector: #evaluate:for: arguments: {aBlock. self}.
		request := SeamlessMessageSendRequest with: message.
		remotePeer createSyncRequestContext sendRequest: request ]