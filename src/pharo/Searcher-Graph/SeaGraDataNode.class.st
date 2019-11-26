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

{ #category : #printing }
SeaGraDataNode >> printOn: aStream [
	data printOn: aStream
]

{ #category : #'as yet unclassified' }
SeaGraDataNode >> seaGraColor [
	^ data seaGraColor
]

{ #category : #'as yet unclassified' }
SeaGraDataNode >> seaGraGtElement [
	^ data seaGraGtElement
]
