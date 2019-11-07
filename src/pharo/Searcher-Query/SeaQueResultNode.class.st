Class {
	#name : #SeaQueResultNode,
	#superclass : #Object,
	#traits : 'SeaGraTNode',
	#classTraits : 'SeaGraTNode classTrait',
	#instVars : [
		'object'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueResultNode class >> object: anObject [
	^ self new
		initializeObject: anObject;
		yourself
]

{ #category : #initialization }
SeaQueResultNode >> initializeObject: anObject [
	self assert: [ object isNil ].
	object := anObject
]

{ #category : #accessing }
SeaQueResultNode >> object [
	^ object
]
