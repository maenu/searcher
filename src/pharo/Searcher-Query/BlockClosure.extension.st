Extension { #name : #BlockClosure }

{ #category : #'*Searcher-Query' }
BlockClosure >> seaQueAsEdgeSourceCollectStrategy [
	^ SeaQueEdgeSourceCollectStrategy block: self
]

{ #category : #'*Searcher-Query' }
BlockClosure >> seaQueAsEdgeSourceTargetSelectStrategy [
	^ SeaQueEdgeSourceTargetSelectStrategy block: self
]

{ #category : #'*Searcher-Query' }
BlockClosure >> seaQueAsEdgeTargetCollectStrategy [
	^ SeaQueEdgeTargetCollectStrategy block: self
]

{ #category : #'*Searcher-Query' }
BlockClosure >> seaQueBuildEdge: anEdgeBuilder [
	anEdgeBuilder buildBlock
]
