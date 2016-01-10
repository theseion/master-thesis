*actiondescriptions-core
presentations
	| presentations |
	presentations := GLMCompositePresentation new.
	self presentationsFactory glamourValue: (
			presentations asGlamorousMultiValue, 
			(self transmission origins collect: #value )).
	^ presentations