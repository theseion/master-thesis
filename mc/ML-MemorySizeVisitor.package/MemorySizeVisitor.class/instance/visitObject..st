visiting
visitObject: anObject
	self
		registerSizeOf: anObject;
		visitInstanceVariablesOf: anObject;
		visitSlotsOf: anObject