Class {
	#name : #SeaMatGraOutgoingEdgePart,
	#superclass : #SeaMatGraEdgePart,
	#category : #'Searcher-Matcher-Graph'
}

{ #category : #associating }
SeaMatGraOutgoingEdgePart >> ~> anObject [
	| otherNode edge |
	otherNode := SeaMatGraNode matcher: anObject seaMatAsMatcher.
	edge := SeaMatGraEdge matcher: matcher source: node target: otherNode.
	otherNode incoming add: edge.
	node outgoing add: edge.
	^ otherNode
]
