Class {
	#name : #SeaQueMessageOrInstanceVariableEdgeFactory,
	#superclass : #Object,
	#instVars : [
		'selector'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueMessageOrInstanceVariableEdgeFactory class >> selector: aSymbol [
	^ self new
		initializeSelector: aSymbol;
		yourself
]

{ #category : #compiling }
SeaQueMessageOrInstanceVariableEdgeFactory >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
	^ SeaQueMessageOrInstanceVariableEdge
		compileSourcePart: aNodePart
		targetPart: anotherNodePart
		in: aContext
		sourceOptional: aBoolean
		targetOptional: anotherBoolean
		selector: selector
]

{ #category : #initialization }
SeaQueMessageOrInstanceVariableEdgeFactory >> initializeSelector: aSymbol [
	self assert: [ selector isNil ].
	selector := aSymbol
]
