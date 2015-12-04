as yet unclassified
setOn: anActionDescription
	| instance |
	instance := self new
		description: anActionDescription;
		yourself.
	anActionDescription state: instance.
	^ instance