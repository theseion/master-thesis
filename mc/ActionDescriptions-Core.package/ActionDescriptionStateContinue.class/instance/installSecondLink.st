private
installSecondLink
	| link |
	link := self defaultLink.
	self description links add: link.
		
	(BlockClosure>>#glamourValueWithArgs:) ast links ifNotNil:[ :methodLinks |
		methodLinks do: #uninstall ].
	(BlockClosure>>#glamourValueWithArgs:) ast link: link