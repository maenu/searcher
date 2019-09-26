Class {
	#name : #SeaQueEdgePart,
	#superclass : #Object,
	#instVars : [
		'nodePart',
		'edgeObject'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueEdgePart class >> nodePart: aNodePart edgeObject: anObject [
	^ self new
		nodePart: aNodePart edgeObject: anObject;
		yourself
]

{ #category : #'as yet unclassified' }
SeaQueEdgePart >> nodePart: aNodePart edgeObject: anObject [
	self assert: [ nodePart isNil and: [ edgeObject isNil ] ].
	nodePart := aNodePart.
	edgeObject := anObject
]
