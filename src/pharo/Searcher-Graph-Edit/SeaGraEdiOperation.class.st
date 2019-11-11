Class {
	#name : #SeaGraEdiOperation,
	#superclass : #Object,
	#instVars : [
		'node',
		'cost'
	],
	#category : #'Searcher-Graph-Edit'
}

{ #category : #'as yet unclassified' }
SeaGraEdiOperation class >> node: aNode cost: aNumber [
	^ self new
		initializeNode: aNode cost: aNumber;
		yourself
]

{ #category : #'as yet unclassified' }
SeaGraEdiOperation >> cost [
	^ cost
]

{ #category : #initialization }
SeaGraEdiOperation >> initializeNode: aNode cost: aNumber [
	self assert: [ node isNil ].
	self assert: [ cost isNil ].
	node := aNode.
	cost := aNumber
]

{ #category : #'as yet unclassified' }
SeaGraEdiOperation >> sourceOrNil [
	^ nil
]

{ #category : #'as yet unclassified' }
SeaGraEdiOperation >> targetOrNil [
	^ nil
]
