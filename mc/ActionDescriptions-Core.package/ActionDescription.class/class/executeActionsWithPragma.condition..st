operations
executeActionsWithPragma: aSymbol condition: aBlock
	| pragmas actionDescription |
	pragmas := (PragmaCollector filter: [ :pragma |
		(pragma keyword = aSymbol) and: [
			aBlock cull: pragma ] ]) reset.

	pragmas do: [ :pragma |
		actionDescription := pragma methodClass soleInstance perform: pragma selector.
		actionDescription execute ] 