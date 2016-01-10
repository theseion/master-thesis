private
basicExecute
	| link |
	link := self defaultLink.
	self description links add: link.
	
	self description methods do: [ :method |
		method ast link: link ]