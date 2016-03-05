examples
exampleDebugRemoteException
	| network remoteGlobals |
	"Run the server with 
	
	server ifNotNil: [ server stop ].
	server := nil.
	server := BasysServer for: SeamlessNetwork new on: 1111.
	server start.
	"
	Warning signal: 'Did you start the server in the remote image?'.
	network := SeamlessNetwork new.
	remoteGlobals := network environmentAt: (TCPAddress ip: #[127 0 0 1] port: 1111).
	[ (remoteGlobals at: #RemoteException) run ] promise debug