I represent the computation of a promised value.

I run my computations in a concurrent process and do not block the master process. A process requesting the result fo my computation explicitly will be blocked until the result becomes available or a timeout occurs.

Look at the methods in the "public-configuration" protocol to see the different ways in which promises can be configured.

To create a new promise, send #promise to a block:

promise := [ self makeJuice ] promise.
promise run.
"do other things here"
result := promise value. "will block until result becomes available"