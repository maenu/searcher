Class {
	#name : #SeaQueMessageOrInstanceVariableEdge,
	#superclass : #SeaQueEdge,
	#instVars : [
		'selector'
	],
	#category : #'Searcher-Query'
}

{ #category : #compiling }
SeaQueMessageOrInstanceVariableEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
	self shouldNotImplement
]

{ #category : #compiling }
SeaQueMessageOrInstanceVariableEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean selector: aSymbol [
	^ (self
		source: (aContext at: aNodePart)
		target: (aContext at: anotherNodePart))
		initializeSourceOptional: aBoolean targetOptional: anotherBoolean;
		initializeSelector: aSymbol;
		yourself
]

{ #category : #initialization }
SeaQueMessageOrInstanceVariableEdge >> initializeSelector: aSymbol [
	self assert: [ selector isNil ].
	selector := aSymbol.
	strategies
		add:
			(SeaQueEdgeSourceCollectStrategy
				edge: self
				block: [ :s | 
					(s canUnderstand: selector)
						ifTrue: [ (s perform: selector) asCollection ]
						ifFalse: [ (s hasInstVarNamed: selector)
								ifTrue: [ (s instVarNamed: selector) asCollection ]
								ifFalse: [ #() ] ] ])
]

{ #category : #printing }
SeaQueMessageOrInstanceVariableEdge >> printOn: aStream [
	aStream
		nextPutAll: selector;
		nextPutAll: ' ';
		nextPutAll: self cost asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
