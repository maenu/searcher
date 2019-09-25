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
	^ (((graph nodes , graph edges
		select: [ :e | e matcher isDirty and: [ e matcher canMatch ] ])
		asArray collect: [ :e | e -> e matcher estimatedCost ])
		sorted: [ :a :b | a value < b value ])
		ifEmpty: [ nil ]
		ifNotEmpty: [ :e | e first key ]
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
		whileFalse: [ entity matcher match ].
	dirty := graph nodes , graph edges anySatisfy: [ :e | e matcher isDirty ]
]
