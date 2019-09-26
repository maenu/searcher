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
