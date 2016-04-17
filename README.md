[ Metacello new
	baseline: #MLPromise;
	repository: 'github://theseion/master-thesis:master/mc';
	load ]
		on: Warning do: [ :ex | ex resume ]

