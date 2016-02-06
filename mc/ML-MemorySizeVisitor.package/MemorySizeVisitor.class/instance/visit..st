visiting
visit: anObject
	(objects includes: anObject) ifTrue: [  ^ self ].
	(self shouldIgnore: anObject) ifTrue: [ ^ self ].

	objects add: anObject.
	stack push: anObject