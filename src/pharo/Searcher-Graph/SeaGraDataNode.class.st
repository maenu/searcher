Class {
	#name : #SeaGraDataNode,
	#superclass : #Object,
	#traits : 'SeaGraTNode',
	#classTraits : 'SeaGraTNode classTrait',
	#instVars : [
		'data'
	],
	#category : #'Searcher-Graph'
}

{ #category : #accessing }
SeaGraDataNode class >> data: anObject [
	^ self new
		data: anObject;
		yourself
]

{ #category : #comparing }
SeaGraDataNode >> = anObject [
	^ self == anObject
		or: [ self class = anObject class and: [ data = anObject data ] ]
]

{ #category : #accessing }
SeaGraDataNode >> data [
	^ data
]

{ #category : #accessing }
SeaGraDataNode >> data: anObject [
	data := anObject
]

{ #category : #comparing }
SeaGraDataNode >> hash [
	^ data hash
]

{ #category : #initialization }
SeaGraDataNode >> initialize [
	super initialize.
	self initializeTNode
]

{ #category : #printing }
SeaGraDataNode >> printOn: aStream [
	aStream nextPutAll: data asString
]

{ #category : #'as yet unclassified' }
SeaGraDataNode >> seaGraAsColor [
	^ data seaGraAsColor
]

{ #category : #accessing }
SeaGraDataNode >> seaGraAsString [
	^ data seaGraAsString
]
