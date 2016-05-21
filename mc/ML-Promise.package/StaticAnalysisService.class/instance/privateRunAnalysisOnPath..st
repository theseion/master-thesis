private
privateRunAnalysisOnPath: absolutePath
	(self doesPathExist: absolutePath) ifFalse: [
		Error signal: 'Directory does not exist!' ].
	
	self basicRunAnalysisIn: absolutePath