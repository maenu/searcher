Class {
	#name : #SeaGraEdiNodeOperation,
	#superclass : #SeaGraEditOperation,
	#instVars : [
		'node'
	],
	#category : #'Searcher-Graph-Edit'
}

{ #category : #'as yet unclassified' }
SeaGraEdiNodeOperation class >> node: aNode cost: aNumber [
	^ self new
		initializeNode: aNode cost: aNumber;
		yourself
]

{ #category : #initialization }
SeaGraEdiNodeOperation >> initializeNode: aNode cost: aNumber [
	self assert: [ node isNil ].
	self assert: [ cost isNil ].
	node := aNode.
	cost := aNumber
]
