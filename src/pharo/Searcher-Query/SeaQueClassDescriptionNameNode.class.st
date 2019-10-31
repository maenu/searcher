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
SeaQueClassDescriptionNameNode >> cost_ [
	^ 1
]

{ #category : #accessing }
SeaQueClassDescriptionNameNode >> execute_ [
	self
		results:
			((SeaQueClassDescriptionCollection instance indexedBy: #name)
				at: name
				ifAbsent: [ IdentitySet new ])
]

{ #category : #asserting }
SeaQueClassDescriptionNameNode >> includes: anObject [
	^ anObject name = name
		and: [ wasExecuted not or: [ results includes: anObject ] ]
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
		nextPutAll: self cost asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
