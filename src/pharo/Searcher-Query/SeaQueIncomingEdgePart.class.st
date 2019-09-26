Class {
	#name : #SeaQueIncomingEdgePart,
	#superclass : #SeaQueEdgePart,
	#category : #'Searcher-Query'
}

{ #category : #arithmetic }
SeaQueIncomingEdgePart >> ~ anObject [
	| otherNodePart |
	otherNodePart := SeaQueNodePart
		object: anObject
		graph: nodePart graph.
	edgeObject seaQueAsEdgeSourcePart: otherNodePart targetPart: nodePart.
	^ otherNodePart
]
