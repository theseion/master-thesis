baseline
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec preLoadDoIt: #mergeKernel.
		spec
			project: 'Seamless'
			with: [
				spec
                className: 'ConfigurationOfSeamless';
                versionString: #development;
                repository: 'http://smalltalkhub.com/mc/Pharo/Seamless/main' ].
		spec
			project: 'Fuel'
			with: [
				spec
                className: 'ConfigurationOfFuel';
                versionString: #bleedingEdge;
                repository: 'http://smalltalkhub.com/mc/Pharo/Fuel/main' ].
		spec
			package: 'ML-Promise'
			with: [ spec requires: #('Fuel' 'Seamless') ].

		spec
			group: 'default'
			with: #('ML-Promise') ]