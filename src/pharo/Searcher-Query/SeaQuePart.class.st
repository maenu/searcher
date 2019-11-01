Class {
	#name : #SeaQuePart,
	#superclass : #Object,
	#instVars : [
		'object',
		'graphPart'
	],
	#category : #'Searcher-Query-Parts'
}

{ #category : #initialization }
SeaQuePart >> initializeObject: anObject graphPart: aGraphPart [
	self assert: [ object isNil and: [ graphPart isNil ] ].
	object := anObject.
	graphPart := aGraphPart
]

{ #category : #accessing }
SeaQuePart >> object [
	^ object
]
