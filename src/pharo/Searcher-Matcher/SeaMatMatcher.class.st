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

{ #category : #testing }
SeaMatMatcher >> dirty [
	^ dirty
]

{ #category : #accessing }
SeaMatMatcher >> dirty: aBoolean [
	dirty := aBoolean
]

{ #category : #'as yet unclassified' }
SeaMatMatcher >> estimatedMatchesSize [
	^ Float infinity
]

{ #category : #initialization }
SeaMatMatcher >> initialize [
	super initialize.
	matches := Set new.
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
