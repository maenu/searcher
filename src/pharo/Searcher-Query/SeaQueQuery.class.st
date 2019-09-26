Class {
	#name : #SeaQueQuery,
	#superclass : #Object,
	#instVars : [
		'results',
		'shouldExecute',
		'graph'
	],
	#category : #'Searcher-Query'
}

{ #category : #testing }
SeaQueQuery >> canExecute [
	^ true
]

{ #category : #'as yet unclassified' }
SeaQueQuery >> estimatedResultsSize [
	^ Float infinity
]

{ #category : #accessing }
SeaQueQuery >> execute [
	self subclassResponsibility
]

{ #category : #accessing }
SeaQueQuery >> graph [
	^ graph
]

{ #category : #accessing }
SeaQueQuery >> graph: anObject [
	self assert: [ graph isNil ].
	graph := anObject
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
