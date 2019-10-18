Class {
	#name : #SeaQueEdgePart,
	#superclass : #SeaQuePart,
	#instVars : [
		'nodePart',
		'otherNodePart'
	],
	#category : #'Searcher-Query-Parts'
}

{ #category : #'as yet unclassified' }
SeaQueEdgePart class >> object: anObject graphPart: aGraphPart nodePart: aNodePart [
	^ self new
		initializeObject: anObject graphPart: aGraphPart;
		initializeNodePart: aNodePart;
		yourself
]

{ #category : #compiling }
SeaQueEdgePart >> compileIn: aContext [
	self subclassResponsibility
]

{ #category : #initialization }
SeaQueEdgePart >> initializeNodePart: aNodePart [
	self assert: [ nodePart isNil ].
	nodePart := aNodePart
]
