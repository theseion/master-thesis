private
subscribeForExecution
	"This should suffice for all installed links since the
	description object will be bound by the reflective method
	(to trigger the next action). Once all links have been
	uninstalled, the subscription will be gc'ed."
	
	self announcer weak
		when: ActionDescriptionExecuted
		send: #uninstall
		to: self 