Class {
	#name : #SeaQueMooEdgeFactory,
	#superclass : #Object,
	#instVars : [
		'properties'
	],
	#category : #'Searcher-Query-Moose'
}

{ #category : #accessing }
SeaQueMooEdgeFactory class >> properties: aSet [
	^ self new
		initializeProperties: aSet;
		yourself
]

{ #category : #compiling }
SeaQueMooEdgeFactory >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
	^ SeaQueMooPropertiesEdge
		compileSourcePart: aNodePart
		targetPart: anotherNodePart
		in: aContext
		sourceOptional: aBoolean
		targetOptional: anotherBoolean
		properties: properties
]

{ #category : #initialization }
SeaQueMooEdgeFactory >> initializeProperties: aSet [
	self assert: [ properties isNil ].
	self assert: [ aSet isNotEmpty ].
	properties := aSet
]
