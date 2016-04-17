public-operations
run
	wasStarted := true.
	process resume.
	"Ensure the promise runs until the external process blocks"
	Processor yield