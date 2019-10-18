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
	^ SeaQueClassAndTraitIndex instance size
]

{ #category : #accessing }
SeaQueClassDescriptionNameNode >> execute_ [
	results := SeaQueClassAndTraitIndex instance
		at: (Character space split: name) first
		ifPresent: [ :e | 
			(name includes: Character space)
				ifTrue: [ e collect: #classSide ]
				ifFalse: [ e ] ]
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
