Class {
	#name : #SeaMatMatcher,
	#superclass : #Object,
	#instVars : [
		'matches',
		'dirty'
	],
	#category : #'Searcher-Matcher'
}

{ #category : #testing }
SeaMatMatcher >> canMatch [
	^ true
]

{ #category : #'as yet unclassified' }
SeaMatMatcher >> estimatedCost [
	^ self isDirty
		ifTrue: [ Float infinity ]
		ifFalse: [ 0 ]
]

{ #category : #initialization }
SeaMatMatcher >> initialize [
	super initialize.
	matches := Set new.
	dirty := true
]

{ #category : #testing }
SeaMatMatcher >> isDirty [
	^ dirty
]

{ #category : #testing }
SeaMatMatcher >> makeDirty [
	dirty := true
]

{ #category : #accessing }
SeaMatMatcher >> match [
	self subclassResponsibility
]

{ #category : #testing }
SeaMatMatcher >> matches [
	^ matches
]
