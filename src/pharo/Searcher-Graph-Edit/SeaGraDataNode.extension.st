Extension { #name : #SeaGraDataNode }

{ #category : #'*Searcher-Graph-Edit' }
SeaGraDataNode >> seaGraEdiAddCost [
	^ 1
]

{ #category : #'*Searcher-Graph-Edit' }
SeaGraDataNode >> seaGraEdiRemoveCost [
	^ 1
]

{ #category : #'*Searcher-Graph-Edit' }
SeaGraDataNode >> seaGraEdiReplaceCost: aNode [
	^ self = aNode
		ifTrue: [ 0 ]
		ifFalse: [ 1 ]
]
