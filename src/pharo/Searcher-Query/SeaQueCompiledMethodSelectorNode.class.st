Class {
	#name : #SeaQueCompiledMethodSelectorNode,
	#superclass : #SeaQueNode,
	#instVars : [
		'selector'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueCompiledMethodSelectorNode class >> identifier: aString selector: aSymbol [
	^ (self identifier: aString)
		selector: aSymbol;
		yourself
]

{ #category : #accessing }
SeaQueCompiledMethodSelectorNode class >> selector: aSymbol [
	^ self new
		selector: aSymbol;
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

{ #category : #'as yet unclassified' }
SeaQueCompiledMethodSelectorNode >> seaQueAsMethodSelectorNodeIn: aGraph [
	^ self
		graph: aGraph;
		yourself
]

{ #category : #accessing }
SeaQueCompiledMethodSelectorNode >> selector: anObject [
	self assert: [ selector isNil ].
	selector := anObject
]
