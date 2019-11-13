Class {
	#name : #SeaQueOutgoingEdgePart,
	#superclass : #SeaQueEdgePart,
	#category : #'Searcher-Query-Parts'
}

{ #category : #'as yet unclassified' }
SeaQueOutgoingEdgePart class >> object: anObject graphPart: aGraphPart nodePart: aNodePart sourceOptional: aBoolean [
	^ self new
		initializeObject: anObject graphPart: aGraphPart;
		initializeNodePart: aNodePart sourceOptional: aBoolean;
		yourself
]

{ #category : #associating }
SeaQueOutgoingEdgePart >> ?~> anObject [
	targetOptional := true.
	^ otherNodePart := graphPart nodePartFor: anObject
]

{ #category : #compiling }
SeaQueOutgoingEdgePart >> compileIn: aContext [
	^ object seaQueAsEdgeFactory
		compileSourcePart: nodePart
		targetPart: otherNodePart
		in: aContext
		sourceOptional: sourceOptional
		targetOptional: targetOptional
]

{ #category : #initialization }
SeaQueOutgoingEdgePart >> initializeNodePart: aNodePart sourceOptional: aBoolean [
	self assert: [ nodePart isNil ].
	self assert: [ sourceOptional isNil ].
	nodePart := aNodePart.
	sourceOptional := aBoolean
]

{ #category : #associating }
SeaQueOutgoingEdgePart >> ~> anObject [
	targetOptional := false.
	^ otherNodePart := graphPart nodePartFor: anObject
]
