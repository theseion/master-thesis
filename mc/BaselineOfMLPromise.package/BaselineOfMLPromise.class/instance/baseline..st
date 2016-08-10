baseline
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec
			project: 'Seamless'
			with: [
				spec
                className: 'ConfigurationOfSeamless';
                versionString: '0.8.2';
                repository: 'http://smalltalkhub.com/mc/Pharo/Seamless/main' ].
		
		spec
			baseline: 'MLThreads'
			with: [
				spec
					repository: 'github://theseion/master-thesis:master/mc';
					loads: #('ML-Threads') ].
		
		spec
			package: 'ML-Promise'
			with: [ spec requires: #('MLThreads' 'Seamless') ].

		spec
			group: 'default'
			with: #('ML-Promise') ]