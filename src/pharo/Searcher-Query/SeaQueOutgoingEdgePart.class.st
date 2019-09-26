Class {
	#name : #SeaQueOutgoingEdgePart,
	#superclass : #SeaQueEdgePart,
	#category : #'Searcher-Query'
}

{ #category : #associating }
SeaQueOutgoingEdgePart >> ~> anObject [
	| otherNodePart |
	otherNodePart := SeaQueNodePart
		object: anObject
		graph: nodePart graph.
	edgeObject seaQueAsEdgeSourcePart: nodePart targetPart: otherNodePart.
	^ otherNodePart
]
