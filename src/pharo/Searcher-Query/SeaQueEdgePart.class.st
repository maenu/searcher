Class {
	#name : #SeaQueEdgePart,
	#superclass : #Object,
	#instVars : [
		'edgeObject',
		'nodeObject',
		'graph'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueEdgePart class >> edgeObject: anObject nodeObject: anotherObject graph: aGraph [
	^ self new
		edgeObject: anObject nodeObject: anotherObject graph: aGraph;
		yourself
]

{ #category : #'as yet unclassified' }
SeaQueEdgePart >> edgeObject: anObject nodeObject: anotherObject graph: aGraph [
	self
		assert: [ edgeObject isNil and: [ nodeObject isNil and: [ graph isNil ] ] ].
	edgeObject := anObject.
	nodeObject := anotherObject.
	graph := aGraph
]
