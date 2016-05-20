private
privateRunAnalysisOnPath: absolutePath
	self assert: (self doesPathExist: absolutePath).
	
	self basicRunAnalysisIn: absolutePath