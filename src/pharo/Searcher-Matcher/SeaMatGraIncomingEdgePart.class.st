Class {
	#name : #SeaMatGraIncomingEdgePart,
	#superclass : #SeaMatGraEdgePart,
	#category : #'Searcher-Matcher-Graph'
}

{ #category : #arithmetic }
SeaMatGraIncomingEdgePart >> ~ anObject [
	| otherNode edge |
	otherNode := SeaMatGraNode matcher: anObject seaMatAsMatcher.
	edge := SeaMatGraEdge matcher: matcher source: otherNode target: node.
	node incoming add: edge.
	otherNode outgoing add: edge.
	^ otherNode
]
