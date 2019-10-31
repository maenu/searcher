Class {
	#name : #SeaQueRPackageNameNode,
	#superclass : #SeaQueNode,
	#instVars : [
		'name'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueRPackageNameNode class >> name: aString [
	^ self new
		initializeWithName: aString;
		yourself
]

{ #category : #accessing }
SeaQueRPackageNameNode >> cost_ [
	^ 1
]

{ #category : #accessing }
SeaQueRPackageNameNode >> execute_ [
	self
		results:
			((SeaQueRPackageCollection instance indexedBy: #name)
				at: name
				ifAbsent: [ IdentitySet new ])
]

{ #category : #testing }
SeaQueRPackageNameNode >> includes: anObject [
	^ anObject name = name
		and: [ wasExecuted not or: [ results includes: anObject ] ]
]

{ #category : #accessing }
SeaQueRPackageNameNode >> initializeWithName: anObject [
	self assert: [ name isNil ].
	name := anObject
]

{ #category : #printing }
SeaQueRPackageNameNode >> printOn: aStream [
	aStream
		nextPutAll: 'rPackageName "';
		nextPutAll: name;
		nextPutAll: '" ';
		nextPutAll: self cost asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
