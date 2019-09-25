Class {
	#name : #SeaMatGraIncomingOrBothEdgePart,
	#superclass : #SeaMatGraEdgePart,
	#category : #'Searcher-Matcher-Graph'
}

{ #category : #arithmetic }
SeaMatGraIncomingOrBothEdgePart >> ~ anObject [
	| otherNode edge |
	otherNode := SeaMatGraNode matcher: anObject seaMatAsMatcher.
	edge := SeaMatGraEdge matcher: matcher source: otherNode target: node.
	node incoming add: edge.
	otherNode outgoing add: edge.
	^ otherNode
]

{ #category : #arithmetic }
SeaMatGraIncomingOrBothEdgePart >> ~> anObject [
	| otherNode edge |
	otherNode := SeaMatGraNode matcher: anObject seaMatAsMatcher.
	edge := SeaMatGraEdge matcher: matcher source: otherNode target: node.
	node incoming add: edge.
	otherNode outgoing add: edge.
	edge := SeaMatGraEdge matcher: matcher source: node target: otherNode.
	otherNode incoming add: edge.
	node outgoing add: edge.
	^ otherNode
]
