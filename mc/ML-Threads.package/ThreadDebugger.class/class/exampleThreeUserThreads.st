examples
exampleThreeUserThreads
	[
		| sem1 sem2 |
		sem1 := Semaphore new.
		sem2 := Semaphore new.
		[
			[ 1 + 2. [ self halt ] value. sem1 signal ] newUserProcess
				priority: 30;
				resume.
			sem1 wait.
			4 - 3.
			sem2 signal
		] newUserProcess
			priority: 30;
			resume.
		sem2 wait.
		1 + 1
	] newUserProcess
		priority: 30;
		resume