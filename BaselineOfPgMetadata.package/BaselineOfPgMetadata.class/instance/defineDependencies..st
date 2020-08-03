baselines
defineDependencies: spec
	^ spec
		baseline: 'Garage' with: [ 
			spec
				repository: 'github://juliendelplanque/garage:master';
				loads: #('postgresV2') ];
		yourself