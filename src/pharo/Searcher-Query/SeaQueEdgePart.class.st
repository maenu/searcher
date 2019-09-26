Class {
	#name : #SeaQueEdgePart,
	#superclass : #Object,
	#instVars : [
		'object',
		'node',
		'context'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueEdgePart class >> object: anObject node: aNode context: aContext [
	^ self new
		object: anObject node: aNode context: aContext;
		yourself
]

{ #category : #'as yet unclassified' }
SeaQueEdgePart >> object: anObject node: aNode context: aContext [
	self
		assert: [ object isNil and: [ node isNil and: [ context isNil ] ] ].
	object := anObject.
	node := aNode.
	context := aContext
]
