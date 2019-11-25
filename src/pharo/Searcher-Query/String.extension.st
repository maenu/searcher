Extension { #name : #String }

{ #category : #'*Searcher-Query' }
String >> seaQueAsEdgeFactoryIn: aContext [
	^ aContext edgeFactoryAt: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueIsIdentifier [
	^ self size >= 2 and: [ self first = $@ ]
]
