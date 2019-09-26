Class {
	#name : #SeaQueOutgoingEdgePart,
	#superclass : #SeaQueEdgePart,
	#category : #'Searcher-Query'
}

{ #category : #associating }
SeaQueOutgoingEdgePart >> ~> anObject [
	| otherNode |
	otherNode := anObject seaQueAsNodeIn: node graph.
	object seaQueAsEdgeSource: node target: otherNode.
	^ otherNode
]
