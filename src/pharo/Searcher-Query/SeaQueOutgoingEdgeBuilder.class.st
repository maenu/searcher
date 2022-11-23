Class {
	#name : #SeaQueOutgoingEdgeBuilder,
	#superclass : #SeaQueEdgeBuilder,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueOutgoingEdgeBuilder class >> argument: anObject source: aNode optional: aBoolean context: aContext [
	^ self new
		initializeArgument: anObject
			source: aNode
			optional: aBoolean
			context: aContext;
		yourself
]

{ #category : #associating }
SeaQueOutgoingEdgeBuilder >> ?~> aNode [
	targetOptional := true.
	target := aNode.
	self build.
	^ target
]

{ #category : #initialization }
SeaQueOutgoingEdgeBuilder >> initializeArgument: anObject source: aNode optional: aBoolean context: aContext [
	argument := anObject.
	source := aNode.
	sourceOptional := aBoolean.
	context := aContext
]

{ #category : #associating }
SeaQueOutgoingEdgeBuilder >> ~> aNode [
	targetOptional := false.
	target := aNode.
	self build.
	^ target
]
