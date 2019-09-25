Class {
	#name : #SeaMatGraphMatcher,
	#superclass : #SeaMatMatcher,
	#instVars : [
		'graph'
	],
	#category : #'Searcher-Matcher'
}

{ #category : #'as yet unclassified' }
SeaMatGraphMatcher >> cheapestDirtyAndCanMatchEntityOrNil [
	^ ((graph nodes , graph edges
		select: [ :e | e isDirty and: [ e canMatch ] ])
		sorted: [ :a :b | a estimatedCost < b estimatedCost ])
		ifEmpty: [ nil ]
		ifNotEmpty: #first
]

{ #category : #accessing }
SeaMatGraphMatcher >> graph: anObject [
	graph := anObject.
	matches := Set new.
	dirty := true
]

{ #category : #accessing }
SeaMatGraphMatcher >> match [
	| entity |
	self assert: [ self isDirty ].
	[ (entity := self cheapestDirtyAndCanMatchEntityOrNil) isNil ]
		whileFalse: [ entity match ].
	dirty := graph nodes , graph edges anySatisfy: #isDirty
]
