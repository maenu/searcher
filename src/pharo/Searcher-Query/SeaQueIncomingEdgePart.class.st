Class {
	#name : #SeaQueIncomingEdgePart,
	#superclass : #SeaQueEdgePart,
	#category : #'Searcher-Query-Parts'
}

{ #category : #'as yet unclassified' }
SeaQueIncomingEdgePart class >> object: anObject graphPart: aGraphPart nodePart: aNodePart targetOptional: aBoolean [
	^ self new
		initializeObject: anObject graphPart: aGraphPart;
		initializeNodePart: aNodePart targetOptional: aBoolean;
		yourself
]

{ #category : #arithmetic }
SeaQueIncomingEdgePart >> ?~ anObject [
	sourceOptional := true.
	^ otherNodePart := graphPart nodePartFor: anObject
]

{ #category : #compiling }
SeaQueIncomingEdgePart >> compileIn: aContext [
	^ (object seaQueAsEdgeFactoriesIn: aContext)
		compileSourcePart: otherNodePart
		targetPart: nodePart
		in: aContext
		sourceOptional: sourceOptional
		targetOptional: targetOptional
]

{ #category : #initialization }
SeaQueIncomingEdgePart >> initializeNodePart: aNodePart targetOptional: aBoolean [
	self assert: [ nodePart isNil ].
	self assert: [ targetOptional isNil ].
	nodePart := aNodePart.
	targetOptional := aBoolean
]

{ #category : #arithmetic }
SeaQueIncomingEdgePart >> ~ anObject [
	sourceOptional := false.
	^ otherNodePart := graphPart nodePartFor: anObject
]
