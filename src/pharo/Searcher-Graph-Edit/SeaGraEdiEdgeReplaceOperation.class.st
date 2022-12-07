Class {
	#name : #SeaGraEdiEdgeReplaceOperation,
	#superclass : #SeaGraEdiEdgeOperation,
	#instVars : [
		'replacement'
	],
	#category : #'Searcher-Graph-Edit'
}

{ #category : #'as yet unclassified' }
SeaGraEdiEdgeReplaceOperation class >> node: aNode replacement: anotherNode cost: aNumber [
	^ self new
		initializeNode: aNode cost: aNumber;
		initializeReplacement: anotherNode;
		yourself
]

{ #category : #initialization }
SeaGraEdiEdgeReplaceOperation >> initializeReplacement: anotherNode [
	self assert: [ replacement isNil ].
	replacement := anotherNode
]

{ #category : #printing }
SeaGraEdiEdgeReplaceOperation >> printOn: aStream [
	edge printOn: aStream.
	aStream nextPutAll: '->'.
	replacement printOn: aStream.
	aStream nextPutAll: ' '.
	cost printOn: aStream
]

{ #category : #'as yet unclassified' }
SeaGraEdiEdgeReplaceOperation >> sourceOrNil [
	^ edge
]

{ #category : #'as yet unclassified' }
SeaGraEdiEdgeReplaceOperation >> targetOrNil [
	^ replacement
]
