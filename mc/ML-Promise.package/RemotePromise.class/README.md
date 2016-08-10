I am a promise that can be run in a different image.

I use Seamless to create a connection to a remote image. The remote image must also have Seamless installed, my class must be present in that image and the Seamless server must have been started.

To create a remote promise, send #remotePromiseOn: to a block and supply a connection as argument (depending on the server settings of the remote image):

address := TCPAddress ip: #[127 0 0 1] port: 1111.
promise := [ self makeJuice ] remotePromiseOn: address.
promise run.
"do other stuff here"
result := promise value. "will block until the result becomes available"