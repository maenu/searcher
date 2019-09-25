Class {
	#name : #SeaQueEdgePart,
	#superclass : #Object,
	#instVars : [
		'object',
		'node'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueEdgePart class >> object: anObject node: aNode [
	^ self new
		object: anObject node: aNode;
		yourself
]

{ #category : #'as yet unclassified' }
SeaQueEdgePart >> object: anObject node: aNode [
	self assert: [ object isNil and: [ node isNil ] ].
	object := anObject.
	node := aNode
]
