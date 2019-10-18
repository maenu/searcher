Class {
	#name : #SeaQueCompilationContext,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'edges',
		'variables'
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
	self assert: [ nodes includesKey: aNodePart ].
	^ (nodes at: aNodePart)
		ifNil: [ nodes at: aNodePart put: (aBlock value: aNodePart) ]
]

{ #category : #compiling }
SeaQueCompilationContext >> compile [
	self
		assert: [ (nodes values allSatisfy: #isNil)
				and: [ edges values allSatisfy: #isNil ] ].
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

{ #category : #initialization }
SeaQueCompilationContext >> initializeNodes: aDictionary edges: anotherDictionary variables: yetAnotherDictionary [
	self
		assert: [ nodes isNil and: [ edges isNil and: [ variables isNil ] ] ].
	nodes := aDictionary.
	edges := anotherDictionary.
	variables := yetAnotherDictionary
]
