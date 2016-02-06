public
runWithRoot: anObject
	self visit: anObject.
	[ stack isEmpty ] whileFalse: [
		[ stack pop accept: self ]
			on: SubclassResponsibility, ShouldNotImplement
			do: [ self visitObject: anObject ] ]