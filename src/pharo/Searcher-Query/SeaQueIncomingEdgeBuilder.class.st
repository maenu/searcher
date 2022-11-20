Class {
	#name : #SeaQueIncomingEdgeBuilder,
	#superclass : #SeaQueEdgeBuilder,
	#category : #'Searcher-Query-Parts'
}

{ #category : #'as yet unclassified' }
SeaQueIncomingEdgeBuilder class >> argument: anObject target: aNode optional: aBoolean context: aContext [
	^ self new
		initializeArgument: anObject
			target: aNode
			optional: aBoolean
			context: aContext;
		yourself
]

{ #category : #arithmetic }
SeaQueIncomingEdgeBuilder >> ?~ aNode [
	sourceOptional := true.
	source := aNode.
	self build.
	^ source
]

{ #category : #initialization }
SeaQueIncomingEdgeBuilder >> initializeArgument: anObject target: aNode optional: aBoolean context: aContext [
	argument := anObject.
	target := aNode.
	targetOptional := aBoolean.
	context := aContext
]

{ #category : #arithmetic }
SeaQueIncomingEdgeBuilder >> ~ aNode [
	sourceOptional := false.
	source := aNode.
	self build.
	^ source
]
