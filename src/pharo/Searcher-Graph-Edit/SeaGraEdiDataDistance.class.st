Class {
	#name : #SeaGraEdiDataDistance,
	#superclass : #SeaGraEdiDistance,
	#category : #'Searcher-Graph-Edit'
}

{ #category : #'instance creation' }
SeaGraEdiDataDistance >> costAddNode: aNode [
	^ aNode seaGraEdiAddCost
]

{ #category : #'as yet unclassified' }
SeaGraEdiDataDistance >> costHeuristicLeaf: aPath [
	^ 0
]

{ #category : #'instance creation' }
SeaGraEdiDataDistance >> costRemoveNode: aNode [
	^ aNode seaGraEdiRemoveCost
]

{ #category : #'instance creation' }
SeaGraEdiDataDistance >> costReplaceNode: aNode replacement: anotherNode [
	^ aNode seaGraEdiReplaceCost: anotherNode
]
