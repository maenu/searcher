Class {
	#name : #SeaMatGraEdge,
	#superclass : #SeaGraEdge,
	#instVars : [
		'matcher'
	],
	#category : #'Searcher-Matcher-Graph'
}

{ #category : #'as yet unclassified' }
SeaMatGraEdge class >> matcher: aMatcher source: aNode target: anotherNode [
	^ (self source: aNode target: anotherNode)
		matcher: aMatcher;
		yourself
]

{ #category : #accessing }
SeaMatGraEdge >> matcher [
	^ matcher
]

{ #category : #accessing }
SeaMatGraEdge >> matcher: anObject [
	matcher := anObject.
	anObject edge: self
]
