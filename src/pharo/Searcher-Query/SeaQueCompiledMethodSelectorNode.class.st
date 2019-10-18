Class {
	#name : #SeaQueCompiledMethodSelectorNode,
	#superclass : #SeaQueNode,
	#instVars : [
		'selector'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueCompiledMethodSelectorNode class >> selector: aSymbol [
	^ self new
		initializeWithSelector: aSymbol;
		yourself
]

{ #category : #accessing }
SeaQueCompiledMethodSelectorNode >> estimatedResultsSize_ [
	^ SeaQueCompiledMethodIndex instance size
]

{ #category : #accessing }
SeaQueCompiledMethodSelectorNode >> execute_ [
	results := SeaQueCompiledMethodIndex instance
		at: selector
		ifAbsent: [ Set new ]
]

{ #category : #accessing }
SeaQueCompiledMethodSelectorNode >> initializeWithSelector: anObject [
	self assert: [ selector isNil ].
	selector := anObject
]

{ #category : #printing }
SeaQueCompiledMethodSelectorNode >> printOn: aStream [
	aStream
		nextPutAll: 'compiledMethodSelector "';
		nextPutAll: selector;
		nextPutAll: '" ';
		nextPutAll: self estimatedResultsSize asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
