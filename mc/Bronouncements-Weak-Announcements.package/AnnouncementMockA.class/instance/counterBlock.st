accessing
counterBlock
	counter := ValueHolder new
		contents: 0;
		yourself.
	^ [ :ann | counter contents: counter contents + 1 ].