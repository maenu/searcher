Class {
	#name : #SeaQueEdgePart,
	#superclass : #SeaQuePart,
	#instVars : [
		'nodePart',
		'otherNodePart',
		'optional'
	],
	#category : #'Searcher-Query-Parts'
}

{ #category : #'as yet unclassified' }
SeaQueEdgePart class >> object: anObject graphPart: aGraphPart nodePart: aNodePart optional: aBoolean [
	^ self new
		initializeObject: anObject graphPart: aGraphPart;
		initializeNodePart: aNodePart optional: aBoolean;
		yourself
]

{ #category : #compiling }
SeaQueEdgePart >> compileIn: aContext [
	self subclassResponsibility
]

{ #category : #initialization }
SeaQueEdgePart >> initializeNodePart: aNodePart optional: aBoolean [
	self assert: [ nodePart isNil ].
	self assert: [ optional isNil ].
	nodePart := aNodePart.
	optional := aBoolean
]
