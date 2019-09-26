Class {
	#name : #SeaQueGraph,
	#superclass : #SeaQueQuery,
	#instVars : [
		'variables',
		'nodes'
	],
	#category : #'Searcher-Query'
}

{ #category : #adding }
SeaQueGraph >> add: aNode [
	^ nodes add: (aNode seaQueAsNodeIn: self)
]

{ #category : #'as yet unclassified' }
SeaQueGraph >> allEdges [
	^ nodes flatCollect: #allEdges
]

{ #category : #'as yet unclassified' }
SeaQueGraph >> allNodes [
	^ nodes flatCollect: #allNodes
]

{ #category : #accessing }
SeaQueGraph >> at: aString [
	^ variables at: aString
]

{ #category : #accessing }
SeaQueGraph >> at: aString ifAbsentPut: aBlock [
	^ variables at: aString ifAbsentPut: aBlock
]

{ #category : #accessing }
SeaQueGraph >> at: aString put: aNode [
	^ variables at: aString put: aNode
]

{ #category : #'as yet unclassified' }
SeaQueGraph >> cheapestShouldAndCanExecuteQueryOrNil [
	^ (((self allNodes , self allEdges
		select: [ :e | e shouldExecute and: [ e canExecute ] ])
		collect: [ :e | e -> e estimatedResultsSize ])
		sorted: [ :a :b | a value < b value ])
		ifEmpty: [ nil ]
		ifNotEmpty: [ :e | e first key ]
]

{ #category : #accessing }
SeaQueGraph >> execute [
	| entity |
	self assert: [ self shouldExecute and: [ self canExecute ] ].
	[ (entity := self cheapestShouldAndCanExecuteQueryOrNil) isNil ]
		whileFalse: [ entity execute ]
]

{ #category : #initialization }
SeaQueGraph >> initialize [
	super initialize.
	graph := self.
	variables := Dictionary new.
	nodes := Set new
]
