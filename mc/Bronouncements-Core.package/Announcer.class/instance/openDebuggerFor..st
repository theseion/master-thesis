brounouncements
openDebuggerFor: anAnnouncement
	Announcer stopBreakOnNext.
	UIManager default
		openDebuggerOn: Processor activeProcess
		context: thisContext sender sender sender
		label: 'Hit announcement ', anAnnouncement asString
		contents: nil
		fullView: true