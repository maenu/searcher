Class {
	#name : #SeaQueClassDescriptionNameNode,
	#superclass : #SeaQueNode,
	#instVars : [
		'name'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueClassDescriptionNameNode class >> identifier: aString name: anotherString [
	^ (self identifier: aString)
		name: aString;
		yourself
]

{ #category : #accessing }
SeaQueClassDescriptionNameNode class >> name: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #accessing }
SeaQueClassDescriptionNameNode >> estimatedResultsSize_ [
	^ 1
]

{ #category : #accessing }
SeaQueClassDescriptionNameNode >> execute_ [
	Smalltalk globals
		at: (Character space split: name) first asSymbol
		ifPresent: [ :e | 
			results := Set
				with:
					((name includes: Character space)
						ifTrue: [ e classSide ]
						ifFalse: [ e ]) ]
		ifAbsent: [ results := Set new ]
]

{ #category : #accessing }
SeaQueClassDescriptionNameNode >> name: anObject [
	self assert: [ name isNil ].
	name := anObject
]

{ #category : #'as yet unclassified' }
SeaQueClassDescriptionNameNode >> seaQueAsClassDescriptionNodeIn: aGraph [
	^ self
		graph: aGraph;
		yourself
]
