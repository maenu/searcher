Extension { #name : #SeaGraDataNode }

{ #category : #'*Searcher-Graph-Edit' }
SeaGraDataNode >> seaGraEdiAddCost [
	^ data seaGraEdiAddCostInNode: self
]

{ #category : #'*Searcher-Graph-Edit' }
SeaGraDataNode >> seaGraEdiRemoveCost [
	^ data seaGraEdiRemoveCostInNode: self
]

{ #category : #'*Searcher-Graph-Edit' }
SeaGraDataNode >> seaGraEdiReplaceCost: aNode [
	^ data
		seaGraEdiReplaceCost: aNode data
		inNode: self
		replacement: aNode
]
