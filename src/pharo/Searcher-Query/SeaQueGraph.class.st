Class {
	#name : #SeaQueGraph,
	#superclass : #SeaQueQuery,
	#instVars : [
		'graph'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueGraph >> cheapestDirtyAndCanMatchEntityOrNil [
	^ (((graph nodes , graph edges
		select: [ :e | e shouldExecute and: [ e canExecute ] ]) asArray
		collect: [ :e | e -> e estimatedResultsSize ])
		sorted: [ :a :b | a value < b value ])
		ifEmpty: [ nil ]
		ifNotEmpty: [ :e | e first key ]
]

{ #category : #accessing }
SeaQueGraph >> execute [
	| entity |
	self assert: [ self shouldExecute ].
	[ (entity := self cheapestDirtyAndCanMatchEntityOrNil) isNil ]
		whileFalse: [ entity execute ].
	shouldExecute := graph nodes , graph edges anySatisfy: #shouldExecute
]

{ #category : #accessing }
SeaQueGraph >> graph: anObject [
	graph := anObject.
	results := Set new.
	shouldExecute := true
]
