Class {
	#name : #SeaQuePackageNameNode,
	#superclass : #SeaQueNode,
	#instVars : [
		'name'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQuePackageNameNode class >> name: aString [
	^ self new
		initializeWithName: aString;
		yourself
]

{ #category : #accessing }
SeaQuePackageNameNode >> estimatedResultsSize_ [
	^ SeaQuePackageIndex instance size
]

{ #category : #accessing }
SeaQuePackageNameNode >> execute_ [
	results := SeaQuePackageIndex instance
		at: name
		ifPresent: #yourself
		ifAbsent: [ Set new ]
]

{ #category : #accessing }
SeaQuePackageNameNode >> initializeWithName: anObject [
	self assert: [ name isNil ].
	name := anObject
]

{ #category : #printing }
SeaQuePackageNameNode >> printOn: aStream [
	aStream
		nextPutAll: 'packageName "';
		nextPutAll: name;
		nextPutAll: '" ';
		nextPutAll: self estimatedResultsSize asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
