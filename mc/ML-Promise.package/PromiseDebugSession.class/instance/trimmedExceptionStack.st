private
trimmedExceptionStack
	"Remove unwanted stack frames"
	| counter |
	counter := 0.
	self contextStore exceptionContext findContextSuchThat: [ :ctxt |
		counter := counter + 1.
		ctxt sender notNil and: [
			"local"
			(ctxt sender method hasPragmaNamed: #promiseRunMethod) or: [
				"remote"
				(ctxt sender selector = #evaluate: and: [
					ctxt sender receiver name = #RemotePromise]) or: [
				ctxt sender receiver isMessageSend and: [
					ctxt sender sender selector = #executeFor: ] ] ] ] ].

	^ self contextStore exceptionContext stackOfSize: counter