baseline
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec blessing: #baseline.
		
		spec package: 'ML-Threads'.

		spec
			group: 'default'
			with: #('ML-Threads') ]