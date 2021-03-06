event handling
keyStroke: anEvent

	| key |
	key := anEvent keyString.
	
	key = '<left>' ifTrue: [
		^ self moveCursor: true direction: -1 selecting: false].
	key = '<Shift-left>' ifTrue: [
		^ self moveCursor: true direction: -1 selecting: true].
	key = '<right>' ifTrue: [
		^ self moveCursor: true direction: 1 selecting: false].
	key = '<Shift-right>' ifTrue: [
		^ self moveCursor: true direction: 1 selecting: true].
	key = '<up>' ifTrue: [
		^ self moveCursorVertically: -1 selecting: false].
	key = '<Shift-up>' ifTrue: [
		^ self moveCursorVertically: -1 selecting: true].
	key = '<down>' ifTrue: [
		^self moveCursorVertically: 1 selecting: false ].
	key = '<Shift-down>' ifTrue: [
		^ self moveCursorVertically: 1 selecting: true].
	key = '<home>' ifTrue: [
		^ self placeCursorAt: 0].
	key = '<end>' ifTrue: [
		^ self placeCursorAt: self text size].
	key = '<Shift-home>' ifTrue: [
		^ self selectionBound: self cursor; cursor: 0].
	key = '<Shift-end>' ifTrue: [
		^ self selectionBound: self cursor; cursor: self text size].
	key = '<Ctrl-left>' ifTrue: [
		^ self moveToNextWord: -1 selecting: false].
	key = '<Ctrl-Shift-left>' ifTrue: [
		^ self moveToNextWord: -1 selecting: true].
	key = '<Ctrl-right>' ifTrue: [
		^ self moveToNextWord: 1 selecting: false].
	key = '<Ctrl-Shift-right>' ifTrue: [
		^ self moveToNextWord: 1 selecting: true].
	key = '<Cmd-a>' ifTrue: [
		^ self selectAll].
	key = '<Cmd-c>' ifTrue: [
		^Clipboard clipboardText: self selectedText].
	key = '<escape>' ifTrue: [
		^ self triggerCancelled].
	((key = '<cr>' and: [self multiLine not]) or: [key = '<Cmd-s>']) ifTrue: [
		^ self triggerConfirmed: self text].
	(key = '<tab>' or: [key = '<Shift-tab>']) ifTrue: [
		^ self pasteUpMorphHandlingTabAmongFields ifNotNilDo: [:p | p tabHitWithEvent: anEvent]].
	
	self editable ifTrue: [
		(key = '<backspace>' or: [key = '<Shift-backspace>']) ifTrue: [
			^ self deleteBeforeCursor; triggerChanged.].
		key = '<delete>' ifTrue: [
			^ self deleteAfterCursor; triggerChanged].
		"FIXME appears to be Ctrl-backspace ???"
		(key = '<Cmd-h>' or: [key = '<Ctrl-backspace>']) ifTrue: [
			^ self deleteNextWord: -1; triggerChanged].
		key = '<Ctrl-delete>' ifTrue: [
			^ self deleteNextWord: 1; triggerChanged].
		key = '<Cmd-v>' ifTrue: [
			^ self insertAtCursor: Clipboard clipboardText; triggerChanged].
		key = '<Cmd-x>' ifTrue: [
			Clipboard clipboardText: self selectedText. ^ self deleteBeforeCursor; triggerChanged].
		
		(anEvent controlKeyPressed or: [anEvent commandKeyPressed]) ifFalse: [
			self
				insertAtCursor: anEvent keyCharacter asString;
				placeCursorAt: self cursor + 1;
				triggerChanged]].