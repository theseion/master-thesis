*actiondescriptions-core
glamourValueDeliveryPredicate
	^ self session
		createPredicateForBlock: [ :aContext | 
			aContext sender selector = #glamourValueWithArgs: and: [
				aContext isBlockContext ] ]