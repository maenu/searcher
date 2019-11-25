Extension { #name : #String }

{ #category : #'*Searcher-Query' }
String >> seaQueAsEdgeFactory [
	^ SeaQueEdge classForIdentifier: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsVariableNode: aCollection [
	^ SeaQueVariableNode collection: aCollection
]

{ #category : #'*Searcher-Query' }
String >> seaQueIsIdentifier [
	^ self size >= 2 and: [ self first = $@ ]
]
