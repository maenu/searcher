Class {
	#name : #SeaQueOutgoingEdgePart,
	#superclass : #SeaQueEdgePart,
	#category : #'Searcher-Query'
}

{ #category : #associating }
SeaQueOutgoingEdgePart >> ~> anObject [
	| edge |
	edge := edgeObject
		seaQueAsEdgeSource: nodeObject
		target: anObject
		graph: graph.
	^ (SeaQueNodePart object: anObject graph: graph)
		node: edge target;
		yourself
]
