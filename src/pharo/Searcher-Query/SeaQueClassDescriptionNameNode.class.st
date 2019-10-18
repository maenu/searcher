Class {
	#name : #SeaQueClassDescriptionNameNode,
	#superclass : #SeaQueNode,
	#instVars : [
		'name'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueClassDescriptionNameNode class >> name: aString [
	^ self new
		initializeWithName: aString;
		yourself
]

{ #category : #accessing }
SeaQueClassDescriptionNameNode >> estimatedResultsSize_ [
	^ SeaQueClassDescriptionIndex instance size
]

{ #category : #accessing }
SeaQueClassDescriptionNameNode >> execute_ [
	results := SeaQueClassDescriptionIndex instance
		at: name
		ifPresent: #yourself
		ifAbsent: [ Set new ]
]

{ #category : #accessing }
SeaQueClassDescriptionNameNode >> initializeWithName: anObject [
	self assert: [ name isNil ].
	name := anObject
]

{ #category : #printing }
SeaQueClassDescriptionNameNode >> printOn: aStream [
	aStream
		nextPutAll: 'classDescriptionName "';
		nextPutAll: name;
		nextPutAll: '" ';
		nextPutAll: self estimatedResultsSize asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
