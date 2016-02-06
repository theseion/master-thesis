private
shouldIgnore: anObject
	^ anObject isClass or: [
		anObject isNil or: [
			anObject == true or: [
				anObject == false or: [
					anObject class = SmallInteger or: [
						anObject isCompiledMethod or: [
							anObject == Smalltalk or: [
								anObject == Smalltalk globals or: [
									(anObject isKindOf: Morph) or: [
										anObject class = WorldState ] ] ] ] ] ] ] ] ]