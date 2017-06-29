baseline
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec blessing: #baseline.
		
		spec
			project: 'SMark'
			with: [
				spec
                className: 'ConfigurationOfSMark';
                versionString: '1.0.1';
                repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main/' ].
		spec
			package: 'ML-Threads'
			with: [ spec requires: 'SMark' ].

		spec
			group: 'default'
			with: #('ML-Threads') ]