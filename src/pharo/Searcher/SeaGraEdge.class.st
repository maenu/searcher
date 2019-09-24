Class {
	#name : #SeaGraEdge,
	#superclass : #Object,
	#instVars : [
		'source',
		'target'
	],
	#category : #'Searcher-Graph'
}

{ #category : #'as yet unclassified' }
SeaGraEdge class >> source: aNode target: anotherNode [
	^ self new
		source: aNode target: anotherNode;
		yourself
]

{ #category : #printing }
SeaGraEdge >> printOn: aStream [
	source printOn: aStream.
	aStream nextPutAll: ' -> '.
	target printOn: aStream
]

{ #category : #accessing }
SeaGraEdge >> source [
	^ source
]

{ #category : #accessing }
SeaGraEdge >> source: aNode target: anotherNode [
	self assert: [ source isNil and: [ target isNil ] ].
	source := aNode.
	target := anotherNode.
	aNode outgoing add: self.
	anotherNode incoming add: self
]

{ #category : #accessing }
SeaGraEdge >> target [
	^ target
]
