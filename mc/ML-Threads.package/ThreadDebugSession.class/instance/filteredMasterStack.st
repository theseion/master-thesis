private
filteredMasterStack
	| masterHolder entryPointHolder |
	masterHolder := interruptedProcess masterProcessHolder.
	"entryPointHolder := masterHolder findContextHolderSuchThat: [ :contextHolder |
		contextHolder originalContext selector = #newUserProcess ]."
		
	^ masterHolder stack"StartingAt: entryPointHolder"