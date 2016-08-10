I am a handler for debug requests to remote promises.

I need to ensure that the master-slave relationship is correctly established before opening the debugger. In addition, the debugger needs to be opened in a specific way so that the request for opening it is not being intercepted by proxies and sent to the remote image.