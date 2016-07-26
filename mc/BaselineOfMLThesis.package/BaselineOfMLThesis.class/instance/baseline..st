baseline
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec blessing: #baseline.
		
		spec
			baseline: 'MLThreads'
			with: [ spec repository: 'github://theseion/master-thesis:master/mc' ].
			
		spec
			baseline: 'MLPromise'
			with: [ spec repository: 'github://theseion/master-thesis:master/mc' ].

		spec
			group: 'default'
			with: #('MLPromise' 'MLThreads') ]