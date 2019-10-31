Class {
	#name : #SeaQueMetacelloProjectSpecNameNode,
	#superclass : #SeaQueNode,
	#instVars : [
		'name'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueMetacelloProjectSpecNameNode class >> name: aString [
	^ self new
		initializeWithName: aString;
		yourself
]

{ #category : #accessing }
SeaQueMetacelloProjectSpecNameNode >> cost_ [
	^ 1
]

{ #category : #accessing }
SeaQueMetacelloProjectSpecNameNode >> execute_ [
	self
		results:
			((SeaQueMetacelloProjectSpecCollection instance indexedBy: #name)
				at: name
				ifAbsent: [ IdentitySet new ])
]

{ #category : #testing }
SeaQueMetacelloProjectSpecNameNode >> includes: anObject [
	^ anObject name = name
]

{ #category : #accessing }
SeaQueMetacelloProjectSpecNameNode >> initializeWithName: anObject [
	self assert: [ name isNil ].
	name := anObject
]

{ #category : #printing }
SeaQueMetacelloProjectSpecNameNode >> printOn: aStream [
	aStream
		nextPutAll: 'metacelloProjectSpecName "';
		nextPutAll: name;
		nextPutAll: '" ';
		nextPutAll: self cost asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
