action
extractAll
	steps do: [ :extractor | extractor into: (self database) with: (self connection) ]