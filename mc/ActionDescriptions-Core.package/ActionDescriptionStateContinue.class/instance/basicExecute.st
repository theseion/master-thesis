private
basicExecute
	self description continueUntilPredicate
		ifNil: [ nextStateClass := ActionDescriptionStateFinished ]
		ifNotNil:[
			self installSecondLink.
			nextStateClass := ActionDescriptionStateWaitingForFinish ]