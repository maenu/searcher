Class {
	#name : #SeaQueGraph,
	#superclass : #SeaQueQuery,
	#instVars : [
		'nodes',
		'edges',
		'variables',
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
SeaQueGraph >> execute_ [
	| entity |
	self prepareExecute.
	self assert: [ self shouldExecute and: [ self canExecute ] ].
	[ (entity := self cheapestShouldAndCanExecuteQueryOrNil) isNil ]
		whileFalse: [ entity execute ]
]

{ #category : #initialization }
SeaQueGraph >> initialize [
	super initialize.
	graph := self.
	nodes := Set new.
	edges := Set new.
	variables := Dictionary new.
	nodeParts := Set new
]

{ #category : #accessing }
SeaQueGraph >> nodes [
	^ nodes
]

{ #category : #'as yet unclassified' }
SeaQueGraph >> prepareExecute [
	nodeParts do: [ :e | nodes add: e node ].
	nodeParts removeAll
]

{ #category : #accessing }
SeaQueGraph >> variables [
	^ variables
]
