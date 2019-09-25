Class {
	#name : #SeaMatGraNode,
	#superclass : #SeaGraNode,
	#traits : 'SeaMatGraTEntity',
	#classTraits : 'SeaMatGraTEntity classTrait',
	#category : #'Searcher-Matcher-Graph'
}

{ #category : #accessing }
SeaMatGraNode class >> matcher: aMatcher [
	^ self new
		matcher: aMatcher;
		yourself
]

{ #category : #'as yet unclassified' }
SeaMatGraNode >> <~ anObject [
	^ SeaMatGraIncomingOrBothEdgePart
		matcher: anObject seaMatAsMatcher
		node: self
]

{ #category : #'as yet unclassified' }
SeaMatGraNode >> <~~ anObject [
	| node edge |
	node := SeaMatGraNode matcher: anObject seaMatAsMatcher.
	edge := SeaMatGraEdge
		matcher: SeaMatAnyMatcher new
		source: node
		target: self.
	self incoming add: edge.
	node outgoing add: edge.
	^ node
]

{ #category : #'as yet unclassified' }
SeaMatGraNode >> <~~> anObject [
	| node edge |
	node := SeaMatGraNode matcher: anObject seaMatAsMatcher.
	edge := SeaMatGraEdge
		matcher: SeaMatAnyMatcher new
		source: node
		target: self.
	self incoming add: edge.
	node outgoing add: edge.
	edge := SeaMatGraEdge
		matcher: SeaMatAnyMatcher new
		source: self
		target: node.
	node incoming add: edge.
	self outgoing add: edge.
	^ node
]

{ #category : #'as yet unclassified' }
SeaMatGraNode >> ~ anObject [
	^ SeaMatGraOutgoingEdgePart
		matcher: anObject seaMatAsMatcher
		node: self
]

{ #category : #'as yet unclassified' }
SeaMatGraNode >> ~~> anObject [
	| node edge |
	node := SeaMatGraNode matcher: anObject seaMatAsMatcher.
	edge := SeaMatGraEdge
		matcher: SeaMatAnyMatcher new
		source: self
		target: node.
	node incoming add: edge.
	self outgoing add: edge.
	^ node
]
