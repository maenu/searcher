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
SeaQueCompiledMethodSelectorNode >> cost_ [
	^ 1
]

{ #category : #accessing }
SeaQueCompiledMethodSelectorNode >> execute_ [
	self
		results:
			((SeaQueCompiledMethodCollection instance indexedBy: #selector)
				at: selector
				ifAbsent: [ IdentitySet new ])
]

{ #category : #testing }
SeaQueCompiledMethodSelectorNode >> includes: anObject [
	^ anObject selector = selector
		and: [ wasExecuted not or: [ results includes: anObject ] ]
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
		nextPutAll: self cost asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
