testing
handlesContext: aContext
	^ aContext callChainAnySatisfy: [ :ctxt |
		ctxt method hasPragmaNamed: #promiseRunMethod ]