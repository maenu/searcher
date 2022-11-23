Class {
	#name : #SeaQueGraph,
	#superclass : #Object,
	#traits : 'SeaQueTConstraint',
	#classTraits : 'SeaQueTConstraint classTrait',
	#instVars : [
		'nodes',
		'edges',
		'variables',
		'context'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueGraph class >> context: aContext [
	^ self new
		initializeContext: aContext;
		yourself
]

{ #category : #'as yet unclassified' }
SeaQueGraph >> cheapestShouldAndCanExecuteOrNil [
	^ (((nodes , edges
		select: [ :e | e shouldExecute and: [ e canExecute ] ])
		collect: [ :e | e -> e cost ])
		sorted: [ :a :b | a value < b value ])
		ifEmpty: [ nil ]
		ifNotEmpty: [ :e | e first key ]
]

{ #category : #accessing }
SeaQueGraph >> execute_ [
	| entity |
	self assert: [ self shouldExecute and: [ self canExecute ] ].
	nodes := nodes flatCollect: #allNodes.
	edges := nodes flatCollect: #allEdges.
	[ (entity := self cheapestShouldAndCanExecuteOrNil) isNil ]
		whileFalse: [ entity traceCr.
			entity execute.
			entity traceCr ]
]

{ #category : #'as yet unclassified' }
SeaQueGraph >> explode [
	| map |
	map := IdentityDictionary new.
	nodes
		do:
			[ :e | e results do: [ :f | map at: f ifAbsentPut: [ e explode: f ] ] ].
	edges
		do: [ :e | 
			e results
				do: [ :f | e explode: f with: map ] ].
	^ SeaGraGraph nodes: map values
]

{ #category : #'as yet unclassified' }
SeaQueGraph >> initialize [
	super initialize.
	self initializeTConstraint.
	nodes := Set new.
	edges := Set new.
	variables := Dictionary new
]

{ #category : #initialization }
SeaQueGraph >> initializeContext: aContext [
	self assert: [ context isNil ].
	context := aContext
]

{ #category : #initialization }
SeaQueGraph >> initializeNodes: aSet edges: anotherSet variables: aDictionary [
	self assert: [ nodes isNil and: [ edges isNil ] ].
	nodes := aSet.
	edges := anotherSet.
	variables := aDictionary
]

{ #category : #'key matching' }
SeaQueGraph >> match: aBlock [
	| arguments |
	arguments := aBlock argumentNames
		collect: [ :nodeName | self variable: nodeName ].
	aBlock valueWithArguments: arguments.
	^ self
]

{ #category : #generated }
SeaQueGraph >> variable: aSymbol [
	^ variables
		at: '@' , aSymbol
		ifAbsentPut: [ nodes add: (SeaQueNode empty: context) ]
]
