Extension { #name : #Collection }

{ #category : #'*Searcher-Query' }
Collection >> seaQueAsNodeIn: aContext [
	^ SeaQueNode fromCollection: self context: aContext
]
