Class {
	#name : #SeaQueMatchByPropertyNode,
	#superclass : #SeaQueNode,
	#instVars : [
		'key',
		'value'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueMatchByPropertyNode class >> collection: aCollection key: aString value: anObject [
	^ (self collection: aCollection)
		initializeKey: aString value: anObject;
		yourself
]

{ #category : #'as yet unclassified' }
SeaQueMatchByPropertyNode >> cost_ [
	self flag: 'TODO 10 is random'.
	^ collection size / 10
]

{ #category : #accessing }
SeaQueMatchByPropertyNode >> execute_ [
	self results: self matchingNodes
]

{ #category : #testing }
SeaQueMatchByPropertyNode >> includes: anObject [
	^ (self matchingNodes includes: anObject)
		and: [ super includes: anObject ]
]

{ #category : #initialization }
SeaQueMatchByPropertyNode >> initializeKey: aString value: anObject [
	self assert: [ key isNil ].
	self assert: [ value isNil ].
	key := aString.
	value := anObject
]

{ #category : #accessing }
SeaQueMatchByPropertyNode >> matchingNodes [
	^ (collection indexedBy: key) at: value ifAbsent: [ IdentitySet new ]
]

{ #category : #printing }
SeaQueMatchByPropertyNode >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' ';
		nextPutAll: key;
		nextPutAll: ' = '.
	value printOn: aStream
]
