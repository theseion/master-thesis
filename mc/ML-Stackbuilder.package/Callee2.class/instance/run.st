as yet unclassified
run
	[ 1/0 ] on: Error do: [ :ex |
		Builder2 trigger: (FLSerializer serializeToByteArray: ex) ]