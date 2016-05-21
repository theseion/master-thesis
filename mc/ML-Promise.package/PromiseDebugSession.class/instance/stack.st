as yet unclassified
stack
	^ super stack reject: [ :context |
		context method hasPragmaNamed: 'filterContexts' ]