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
	^ data seaGraEdiReplaceCost: aNode data
]
