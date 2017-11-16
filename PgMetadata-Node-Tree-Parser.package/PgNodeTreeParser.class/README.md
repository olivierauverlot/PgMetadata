| id |
id := '{' asParser , 
	#uppercase asParser star, 
	#blank asParser,
	(':' asParser , #lowercase asParser star , #blank asParser , #any asParser star) star.
id parse: '{FUNC :arg 0 :val: 3}'.