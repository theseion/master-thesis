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
                versionString: #stable;
                repository: 'http://smalltalkhub.com/mc/Pharo/Seamless/main' ].
		spec
			package: 'ML-Promise'
			with: [ spec requires: #('Seamless') ].

		spec
			group: 'default'
			with: #('ML-Promise') ]