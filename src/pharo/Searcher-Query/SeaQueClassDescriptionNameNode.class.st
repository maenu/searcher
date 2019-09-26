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
SeaQueClassDescriptionNameNode >> estimatedResultsSize [
	^ 1
]

{ #category : #accessing }
SeaQueClassDescriptionNameNode >> execute [
	self assert: [ self shouldExecute and: [ self canExecute ] ].
	Smalltalk globals
		at: (Character space split: name) first asSymbol
		ifPresent: [ :e | 
			results := Set
				with:
					((name includes: Character space)
						ifTrue: [ e classSide ]
						ifFalse: [ e ]) ]
		ifAbsent: [ results := Set new ].
	shouldExecute := false
]

{ #category : #accessing }
SeaQueClassDescriptionNameNode >> name: anObject [
	self assert: [ name isNil ].
	name := anObject
]
