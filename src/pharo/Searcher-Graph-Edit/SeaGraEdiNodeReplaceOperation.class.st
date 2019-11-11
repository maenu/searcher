Class {
	#name : #SeaGraEdiNodeReplaceOperation,
	#superclass : #SeaGraEdiOperation,
	#instVars : [
		'replacement'
	],
	#category : #'Searcher-Graph-Edit'
}

{ #category : #'as yet unclassified' }
SeaGraEdiNodeReplaceOperation class >> node: aNode replacement: anotherNode cost: aNumber [
	^ self new
		initializeNode: aNode cost: aNumber;
		initializeReplacement: anotherNode;
		yourself
]

{ #category : #initialization }
SeaGraEdiNodeReplaceOperation >> initializeReplacement: anotherNode [
	self assert: [ replacement isNil ].
	replacement := anotherNode
]

{ #category : #printing }
SeaGraEdiNodeReplaceOperation >> printOn: aStream [
	node printOn: aStream.
	aStream nextPutAll: '->'.
	replacement printOn: aStream.
	aStream nextPutAll: ' '.
	cost printOn: aStream
]

{ #category : #'as yet unclassified' }
SeaGraEdiNodeReplaceOperation >> sourceOrNil [
	^ node
]

{ #category : #'as yet unclassified' }
SeaGraEdiNodeReplaceOperation >> targetOrNil [
	^ replacement
]
