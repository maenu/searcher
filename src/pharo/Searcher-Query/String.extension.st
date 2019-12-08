Extension { #name : #String }

{ #category : #'*Searcher-Query' }
String >> seaQueAsEdgeFactoriesIn: aContext [
	^ aContext edgeFactoriesAt: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueIsIdentifier [
	^ self size >= 2 and: [ self first = $@ ]
]
