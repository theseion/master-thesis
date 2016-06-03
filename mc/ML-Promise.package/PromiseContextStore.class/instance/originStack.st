accessing
originStack
	^ originStack allButFirst: (originStack indexOf: originContext ifAbsent: [ #() ])