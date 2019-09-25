Class {
	#name : #SeaMatClassDescriptionNameNodeMatcher,
	#superclass : #SeaMatNodeMatcher,
	#instVars : [
		'name'
	],
	#category : #'Searcher-Matcher'
}

{ #category : #accessing }
SeaMatClassDescriptionNameNodeMatcher class >> name: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #accessing }
SeaMatClassDescriptionNameNodeMatcher >> estimatedMatchesSize [
	^ 1
]

{ #category : #accessing }
SeaMatClassDescriptionNameNodeMatcher >> match [
	self assert: [ self dirty and: [ self canMatch ] ].
	Smalltalk globals
		at: (Character space split: name) first asSymbol
		ifPresent: [ :e | 
			matches := Set
				with:
					((name includes: Character space)
						ifTrue: [ e classSide ]
						ifFalse: [ e ]) ]
		ifAbsent: [ matches := Set new ].
	dirty := false
]

{ #category : #accessing }
SeaMatClassDescriptionNameNodeMatcher >> name [
	^ name
]

{ #category : #accessing }
SeaMatClassDescriptionNameNodeMatcher >> name: anObject [
	name := anObject.
	matches := Set new
]
