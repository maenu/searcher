Class {
	#name : #SeaQueCompilationContext,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'edges',
		'variables',
		'collections',
		'edgeFactories'
	],
	#category : #'Searcher-Query-Parts'
}

{ #category : #'as yet unclassified' }
SeaQueCompilationContext class >> nodes: aDictionary edges: anotherDictionary variables: yetAnotherDictionary [
	^ self new
		initializeNodes: aDictionary
			edges: anotherDictionary
			variables: yetAnotherDictionary;
		yourself
]

{ #category : #accessing }
SeaQueCompilationContext >> at: aNodePart ifAbsentPut: aBlock [
	^ self at: aNodePart ifPresent: #yourself ifAbsentPut: aBlock
]

{ #category : #accessing }
SeaQueCompilationContext >> at: aNodePart ifPresent: aBlock ifAbsentPut: anotherBlock [
	self assert: [ nodes includesKey: aNodePart ].
	^ (nodes at: aNodePart)
		ifNil: [ nodes at: aNodePart put: (anotherBlock value: aNodePart) ]
		ifNotNil: aBlock
]

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> collectionAt: aString [
	^ collections at: aString
]

{ #category : #compiling }
SeaQueCompilationContext >> compile [
	self
		assert: [ (nodes values allSatisfy: #isNil)
				and: [ edges values allSatisfy: #isNil ] ].
	self initializeCollections.
	self initializeEdgeFactories.
	edges := (edges associations
		collect: [ :e | e key -> (e key compileIn: self) ]) asDictionary.
	self
		assert: [ (nodes values allSatisfy: #isNotNil)
				and: [ edges values allSatisfy: #isNotNil ] ].
	variables := variables collect: [ :e | nodes at: e ].
	^ SeaQueGraph
		nodes: nodes values
		edges: edges values
		variables: variables
]

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> edgeFactoryAt: aString [
	^ edgeFactories at: aString
]

{ #category : #initialization }
SeaQueCompilationContext >> initialize [
	super initialize.
	collections := Dictionary new.
	edgeFactories := Dictionary new
]

{ #category : #initialization }
SeaQueCompilationContext >> initializeCollections [
	self subclassResponsibility
]

{ #category : #initialization }
SeaQueCompilationContext >> initializeEdgeFactories [
	self subclassResponsibility
]

{ #category : #initialization }
SeaQueCompilationContext >> initializeNodes: aDictionary edges: anotherDictionary variables: yetAnotherDictionary [
	self
		assert: [ nodes isNil and: [ edges isNil and: [ variables isNil ] ] ].
	nodes := aDictionary.
	edges := anotherDictionary.
	variables := yetAnotherDictionary
]
