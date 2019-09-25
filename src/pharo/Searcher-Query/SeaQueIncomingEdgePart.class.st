Class {
	#name : #SeaQueIncomingEdgePart,
	#superclass : #SeaQueEdgePart,
	#category : #'Searcher-Query'
}

{ #category : #arithmetic }
SeaQueIncomingEdgePart >> ~ anObject [
	| otherNode |
	otherNode := anObject seaQueAsNode.
	object seaQueAsEdgeSource: otherNode target: node.
	^ otherNode
]
