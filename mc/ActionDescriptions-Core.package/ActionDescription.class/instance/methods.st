accessing
methods
	"Gather all compiled methods.
	The lookup may fail if the method is not defined for
	a given class, in which case the entry will be nil.
	The lookup may also return a ReflectiveMethod, so
	send #compiledMethod to get the actual compiled method"
	^ (self classes collect: [ :class |
		(class lookupSelector: self selector) ifNotNil: [ :method |
			method compiledMethod ] ]) asSet copyWithout: nil