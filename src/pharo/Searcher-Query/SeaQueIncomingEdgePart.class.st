Class {
	#name : #SeaQueIncomingEdgePart,
	#superclass : #SeaQueEdgePart,
	#category : #'Searcher-Query'
}

{ #category : #arithmetic }
SeaQueIncomingEdgePart >> ~ anObject [
	| edge |
	edge := edgeObject
		seaQueAsEdgeSource: anObject
		target: nodeObject
		graph: graph.
	^ (SeaQueNodePart object: anObject graph: graph)
		node: edge source;
		yourself
]
