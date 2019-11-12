Class {
	#name : #SeaQueEdgeStrategy,
	#superclass : #Object,
	#instVars : [
		'edge',
		'block'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueEdgeStrategy class >> edge: anEdge block: aBlock [
	^ self new
		initializeWithEdge: anEdge block: aBlock;
		yourself
]

{ #category : #testing }
SeaQueEdgeStrategy >> canExecute [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SeaQueEdgeStrategy >> cost [
	self subclassResponsibility
]

{ #category : #testing }
SeaQueEdgeStrategy >> execute: aBoolean [
	| results |
	edge results: (results := self results).
	aBoolean
		ifFalse: [ edge source results: (results collect: #key) ].
	edge target results: (results collect: #value)
]

{ #category : #initialization }
SeaQueEdgeStrategy >> initializeWithEdge: anEdge block: aBlock [
	self assert: [ edge isNil ].
	self assert: [ block isNil ].
	edge := anEdge.
	block := aBlock
]

{ #category : #accessing }
SeaQueEdgeStrategy >> results [
	self subclassResponsibility
]
