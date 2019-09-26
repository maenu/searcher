Class {
	#name : #SeaQueGraph,
	#superclass : #SeaQueQuery,
	#instVars : [
		'variables',
		'nodes',
		'edges',
		'nodeParts'
	],
	#category : #'Searcher-Query'
}

{ #category : #adding }
SeaQueGraph >> , anObject [
	^ nodeParts add: (SeaQueNodePart object: anObject graph: self)
]

{ #category : #'as yet unclassified' }
SeaQueGraph >> cheapestShouldAndCanExecuteQueryOrNil [
	^ (((nodes , edges
		select: [ :e | e shouldExecute and: [ e canExecute ] ])
		collect: [ :e | e -> e estimatedResultsSize ])
		sorted: [ :a :b | a value < b value ])
		ifEmpty: [ nil ]
		ifNotEmpty: [ :e | e first key ]
]

{ #category : #accessing }
SeaQueGraph >> edges [
	^ edges
]

{ #category : #accessing }
SeaQueGraph >> execute [
	| entity |
	nodeParts do: [ :e | nodes add: e node ].
	nodeParts removeAll.
	self assert: [ self shouldExecute and: [ self canExecute ] ].
	[ (entity := self cheapestShouldAndCanExecuteQueryOrNil) isNil ]
		whileFalse: [ entity execute ]
]

{ #category : #initialization }
SeaQueGraph >> initialize [
	super initialize.
	graph := self.
	variables := Dictionary new.
	nodes := Set new.
	edges := Set new.
	nodeParts := Set new
]

{ #category : #accessing }
SeaQueGraph >> nodes [
	^ nodes
]

{ #category : #accessing }
SeaQueGraph >> variables [
	^ variables
]
