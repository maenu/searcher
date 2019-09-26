Class {
	#name : #SeaQueIncomingEdgePart,
	#superclass : #SeaQueEdgePart,
	#category : #'Searcher-Query'
}

{ #category : #arithmetic }
SeaQueIncomingEdgePart >> ~ anObject [
	| otherNode |
	otherNode := anObject seaQueAsNodeIn: node graph.
	object seaQueAsEdgeSource: otherNode target: node.
	^ otherNode
]
