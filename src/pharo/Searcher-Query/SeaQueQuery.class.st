Class {
	#name : #SeaQueQuery,
	#superclass : #Object,
	#instVars : [
		'results',
		'shouldExecute',
		'wasExecuted'
	],
	#category : #'Searcher-Query'
}

{ #category : #testing }
SeaQueQuery >> canExecute [
	^ true
]

{ #category : #'as yet unclassified' }
SeaQueQuery >> estimatedResultsSize [
	^ wasExecuted
		ifTrue: [ results size ]
		ifFalse: [ self estimatedResultsSize_ ]
]

{ #category : #'as yet unclassified' }
SeaQueQuery >> estimatedResultsSize_ [
	^ Float infinity
]

{ #category : #accessing }
SeaQueQuery >> execute [
	self assert: [ self shouldExecute and: [ self canExecute ] ].
	self execute_.
	shouldExecute := false.
	wasExecuted := true
]

{ #category : #accessing }
SeaQueQuery >> execute_ [
	self subclassResponsibility
]

{ #category : #initialization }
SeaQueQuery >> initialize [
	super initialize.
	results := Set new.
	shouldExecute := true.
	wasExecuted := false
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

{ #category : #accessing }
SeaQueQuery >> wasExecuted [
	^ wasExecuted
]
