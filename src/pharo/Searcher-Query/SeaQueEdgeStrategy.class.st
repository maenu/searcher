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
SeaQueEdgeStrategy class >> block: aBlock [
	^ self new
		initializeBlock: aBlock;
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
SeaQueEdgeStrategy >> execute [
	| results |
	edge results: (results := self results).
	edge sourceOptional
		ifFalse: [ edge source results: (results collect: #key) ].
	edge targetOptional
		ifFalse: [ edge target results: (results collect: #value) ]
]

{ #category : #initialization }
SeaQueEdgeStrategy >> initializeBlock: aBlock [
	self assert: [ block isNil ].
	block := aBlock
]

{ #category : #initialization }
SeaQueEdgeStrategy >> initializeEdge: anEdge [
	self assert: [ edge isNil ].
	edge := anEdge
]

{ #category : #accessing }
SeaQueEdgeStrategy >> results [
	self subclassResponsibility
]
