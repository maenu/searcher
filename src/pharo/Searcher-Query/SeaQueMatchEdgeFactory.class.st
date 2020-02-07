Class {
	#name : #SeaQueMatchEdgeFactory,
	#superclass : #Object,
	#instVars : [
		'block'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueMatchEdgeFactory class >> block: aBlock [
	^ self new
		initializeBlock: aBlock;
		yourself
]

{ #category : #compiling }
SeaQueMatchEdgeFactory >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
	^ SeaQueMatchEdge
		compileSourcePart: aNodePart
		targetPart: anotherNodePart
		in: aContext
		sourceOptional: aBoolean
		targetOptional: anotherBoolean
		block: block
]

{ #category : #initialization }
SeaQueMatchEdgeFactory >> initializeBlock: aBlock [
	self assert: [ block isNil ].
	block := aBlock
]
