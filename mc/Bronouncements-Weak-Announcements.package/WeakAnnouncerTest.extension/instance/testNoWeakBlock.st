*bronouncements-weak-announcements-tests
testNoWeakBlock
	"There is no such thing as a weak block, these things never go away."

	| mock counterHolder |
	mock := AnnouncementMockA new.
	(announcer subscribe: AnnouncementMockA do: mock counterBlock) makeWeak.
	counterHolder := mock counterHolder.
	mock := nil.
	
	announcer announce: AnnouncementMockA.
	self assert: counterHolder contents = 1.
	
	Smalltalk garbageCollect.
	announcer announce: AnnouncementMockA.
	self assert: counterHolder contents = 1.
	self assert: announcer numberOfSubscriptions isZero