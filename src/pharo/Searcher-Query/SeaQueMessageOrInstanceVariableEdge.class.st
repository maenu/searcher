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
		source:
		(aContext
		at: aNodePart
		ifPresent: #yourself
		ifAbsentPut: [ :e | e object seaQueNodeIn: aContext ])
		target:
		(aContext
				at: anotherNodePart
				ifPresent: #yourself
				ifAbsentPut: [ :e | e object seaQueNodeIn: aContext ]))
		initializeSourceOptional: aBoolean targetOptional: anotherBoolean;
		initializeSelector: aSymbol;
		yourself
]

{ #category : #initialization }
SeaQueMessageOrInstanceVariableEdge >> initializeSelector: aSymbol [
	self assert: [ selector isNil ].
	self assert: [ aSymbol numArgs <= 1 ].
	selector := aSymbol.
	aSymbol numArgs = 0
		ifTrue: [ strategies
				add:
					(SeaQueEdgeSourceCollectStrategy
						edge: self
						block: [ :s | 
							(s canUnderstand: selector)
								ifTrue: [ (s perform: selector) asCollection ]
								ifFalse: [ (s hasInstVarNamed: selector)
										ifTrue: [ (s instVarNamed: selector) asCollection ]
										ifFalse: [ #() ] ] ]) ]
		ifFalse: [ strategies
				add:
					(SeaQueEdgeSourceTargetSelectStrategy
						edge: self
						block: [ :s :t | s perform: selector with: t ]) ]
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
