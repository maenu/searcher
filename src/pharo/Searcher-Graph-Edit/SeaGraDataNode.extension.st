Extension { #name : #SeaGraDataNode }

{ #category : #'*Searcher-Graph-Edit' }
SeaGraDataNode >> seaGraEdiAddCost [
	^ data seaGraEdiAddCost
]

{ #category : #'*Searcher-Graph-Edit' }
SeaGraDataNode >> seaGraEdiRemoveCost [
	^ data seaGraEdiRemoveCost
]

{ #category : #'*Searcher-Graph-Edit' }
SeaGraDataNode >> seaGraEdiReplaceCost: aNode [
	^ data seaGraEdiReplaceCost: aNode data
]
