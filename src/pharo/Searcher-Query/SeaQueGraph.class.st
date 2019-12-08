Class {
	#name : #SeaQueGraph,
	#superclass : #SeaQueQuery,
	#instVars : [
		'nodes',
		'edges',
		'variables'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueGraph class >> nodes: aSet edges: anotherSet variables: aDictionary [
	^ self new
		initializeNodes: aSet edges: anotherSet variables: aDictionary;
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

{ #category : #initialization }
SeaQueGraph >> initializeNodes: aSet edges: anotherSet variables: aDictionary [
	self assert: [ nodes isNil and: [ edges isNil ] ].
	nodes := aSet.
	edges := anotherSet.
	variables := aDictionary
]
