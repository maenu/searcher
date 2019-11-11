Class {
	#name : #SeaGraDataEdge,
	#superclass : #Object,
	#traits : 'SeaGraTEdge',
	#classTraits : 'SeaGraTEdge classTrait',
	#instVars : [
		'data'
	],
	#category : #'Searcher-Graph'
}

{ #category : #accessing }
SeaGraDataEdge class >> source: aNode target: anotherNode data: anObject [
	^ (self source: aNode target: anotherNode)
		data: anObject;
		yourself
]

{ #category : #comparing }
SeaGraDataEdge >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ data = anObject data
						and: [ source = anObject source and: [ target = anObject target ] ] ] ]
]

{ #category : #accessing }
SeaGraDataEdge >> data [
	^ data
]

{ #category : #accessing }
SeaGraDataEdge >> data: anObject [
	data := anObject
]

{ #category : #comparing }
SeaGraDataEdge >> hash [
	^ (data hash bitXor: source hash) bitXor: target hash
]

{ #category : #printing }
SeaGraDataEdge >> printOn: aStream [
	source printOn: aStream.
	aStream nextPutAll: '-'.
	data printOn: aStream.
	aStream nextPutAll: '->'.
	target printOn: aStream
]
