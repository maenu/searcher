Extension { #name : #BlockClosure }

{ #category : #'*Searcher-Query' }
BlockClosure >> seaQueAsEdgeFactoriesIn: aContext [
	^ SeaQueMatchEdgeFactory block: self
]
