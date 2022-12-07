Class {
	#name : #SeaGraEdiEdgeOperation,
	#superclass : #SeaGraEditOperation,
	#instVars : [
		'edge'
	],
	#category : #'Searcher-Graph-Edit'
}

{ #category : #'as yet unclassified' }
SeaGraEdiEdgeOperation class >> edge: anEdge cost: aNumber [
	^ self new
		initializeEdge: anEdge cost: aNumber;
		yourself
]

{ #category : #initialization }
SeaGraEdiEdgeOperation >> initializeEdge: anEdge cost: aNumber [
	self assert: [ edge isNil ].
	self assert: [ cost isNil ].
	edge := anEdge.
	cost := aNumber
]
