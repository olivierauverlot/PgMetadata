baselines
defineDependencies: spec
	^ spec
		baseline: 'Garage' with: [ 
			spec
				repository: 'github://pharo-rdbms/garage:master';
				loads: #('postgresV2') ];
		yourself