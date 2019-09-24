Class {
	#name : #SeaMatGraEdgePart,
	#superclass : #Object,
	#instVars : [
		'matcher',
		'node'
	],
	#category : #'Searcher-Matcher-Graph'
}

{ #category : #'as yet unclassified' }
SeaMatGraEdgePart class >> matcher: aMatcher node: aNode [
	^ self new
		matcher: aMatcher node: aNode;
		yourself
]

{ #category : #'as yet unclassified' }
SeaMatGraEdgePart >> matcher: aMatcher node: aNode [
	self assert: [ matcher isNil and: [ node isNil ] ].
	matcher := aMatcher.
	node := aNode
]
