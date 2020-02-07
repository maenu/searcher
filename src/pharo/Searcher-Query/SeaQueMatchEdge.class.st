Class {
	#name : #SeaQueMatchEdge,
	#superclass : #SeaQueEdge,
	#instVars : [
		'block'
	],
	#category : #'Searcher-Query'
}

{ #category : #compiling }
SeaQueMatchEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
	self shouldNotImplement
]

{ #category : #compiling }
SeaQueMatchEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean block: aBlock [
	^ (self
		source: (aContext at: aNodePart)
		target: (aContext at: anotherNodePart))
		initializeSourceOptional: aBoolean targetOptional: anotherBoolean;
		initializeBlock: aBlock;
		yourself
]

{ #category : #initialization }
SeaQueMatchEdge >> initializeBlock: aBlock [
	self assert: [ block isNil ].
	block := aBlock.
	strategies
		add: (SeaQueEdgeSourceCollectStrategy edge: self block: block)
]

{ #category : #printing }
SeaQueMatchEdge >> printOn: aStream [
	block printOn: aStream.
	aStream
		nextPutAll: ' ';
		nextPutAll: self cost asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
