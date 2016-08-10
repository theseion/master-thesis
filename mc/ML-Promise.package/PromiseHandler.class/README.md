I provide an abstrac implementation of different handlers for promises.

I provide access to the context store and to the promise. My subclasses must provide an implementation for #run. 

A handler can be instantiated by sending #handle: to the handler class with the promise as argument.