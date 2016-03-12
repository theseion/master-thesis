private
freezeContexts
	frozenContexts := (thisContext findContextSuchThat: [ :ctxt |
		ctxt selector = #promise ]) sender copyStack