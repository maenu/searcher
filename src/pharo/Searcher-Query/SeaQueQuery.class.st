Class {
	#name : #SeaQueQuery,
	#superclass : #Object,
	#instVars : [
		'results',
		'shouldExecute'
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
