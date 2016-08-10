I know how to handle exceptions during the execution of a promise. Specifically, I know how to treat the proxies used by Seamless.

When an exception occurs I prepare everything so that the debug handler, which may be invoked later, can do its job.