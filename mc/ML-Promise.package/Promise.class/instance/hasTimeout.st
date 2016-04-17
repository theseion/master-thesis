public-testing
hasTimeout
	^ timeout notNil and: [
		timeout > Duration zero ]