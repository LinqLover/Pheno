as yet unclassified
testCanShrinkInsideWindow
	| label topLevel labelFullWidth extra |
	
	label := (BTLabel text: 'lorem ipsum dolor sit amet consecutor amet clericus dactus ductus doctuslorem ipsum dolor sit amet consecutor amet clericus dactus ductus doctuslorem ipsum dolor sit amet consecutor amet clericus dactus ductus doctuslorem ipsum dolor sit amet consecutor amet clericus dactus ductus doctuslorem ipsum dolor sit amet consecutor amet clericus dactus ductus doctus').
	topLevel := BTPluggableWindow new addMorph: label frame: (0 @ 0 extent: 1 @ 1); fullBounds; yourself.
	
	labelFullWidth := (label sizeForWidth: -1) x.
	extra := (topLevel extent - topLevel layoutBounds extent) x.
	topLevel extent: labelFullWidth + extra @ 100; fullBounds.
	(self expect: label width) to equal: labelFullWidth.
	
	topLevel extent: labelFullWidth / 2 + extra @ 800; fullBounds.
	(self expect: label width) to equal: labelFullWidth / 2