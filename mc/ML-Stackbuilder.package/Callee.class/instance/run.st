as yet unclassified
run
	[ 1/0 ] on: Error do: [ :ex |
		Builder trigger: (FLSerializer serializeToByteArray: ex) ]