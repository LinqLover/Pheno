matching
changeIts: aSelectorOrBlock during: aBlock

	^ self assertChange: aSelectorOrBlock during: aBlock compareOperator: #~= description: 'change'