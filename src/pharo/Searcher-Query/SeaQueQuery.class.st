Class {
	#name : #SeaQueQuery,
	#superclass : #Object,
	#instVars : [
		'results',
		'shouldExecute'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueQuery >> allEdges [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SeaQueQuery >> allNodes [
	self subclassResponsibility
]

{ #category : #testing }
SeaQueQuery >> canExecute [
	^ true
]

{ #category : #'as yet unclassified' }
SeaQueQuery >> cheapestShouldAndCanExecuteEntityOrNil [
	^ (((self allNodes , self allEdges
		select: [ :e | e shouldExecute and: [ e canExecute ] ]) asArray
		collect: [ :e | e -> e estimatedResultsSize ])
		sorted: [ :a :b | a value < b value ])
		ifEmpty: [ nil ]
		ifNotEmpty: [ :e | e first key ]
]

{ #category : #'as yet unclassified' }
SeaQueQuery >> estimatedResultsSize [
	^ Float infinity
]

{ #category : #accessing }
SeaQueQuery >> execute [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SeaQueQuery >> executeAll [
	| entity |
	[ (entity := self cheapestShouldAndCanExecuteEntityOrNil) isNil ]
		whileFalse: [ entity execute ]
]

{ #category : #initialization }
SeaQueQuery >> initialize [
	super initialize.
	results := Set new.
	shouldExecute := true
]

{ #category : #testing }
SeaQueQuery >> results [
	^ results
]

{ #category : #testing }
SeaQueQuery >> shouldExecute [
	^ shouldExecute
]

{ #category : #accessing }
SeaQueQuery >> shouldExecute: aBoolean [
	shouldExecute := aBoolean
]
