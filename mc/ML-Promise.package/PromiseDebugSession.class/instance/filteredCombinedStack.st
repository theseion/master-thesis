private
filteredCombinedStack
	^ self trimmedExceptionStack
		addAll: self trimmedOriginStack;
		yourself