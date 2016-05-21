*ml-promise
remotePromiseOn: aConnection
	<promiseEntryPoint>
	^ RemotePromise new
		run: self cleanCopy with: aConnection;
		yourself