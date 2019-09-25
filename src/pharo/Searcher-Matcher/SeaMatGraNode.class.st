Class {
	#name : #SeaMatGraNode,
	#superclass : #SeaGraNode,
	#instVars : [
		'matcher'
	],
	#category : #'Searcher-Matcher-Graph'
}

{ #category : #accessing }
SeaMatGraNode class >> matcher: aMatcher [
	^ self new
		matcher: aMatcher;
		yourself
]

{ #category : #'as yet unclassified' }
SeaMatGraNode >> <~ anObject [
	^ SeaMatGraIncomingEdgePart
		matcher: anObject seaMatAsMatcher
		node: self
]

{ #category : #accessing }
SeaMatGraNode >> matcher [
	^ matcher
]

{ #category : #accessing }
SeaMatGraNode >> matcher: anObject [
	matcher := anObject.
	anObject node: self
]

{ #category : #'as yet unclassified' }
SeaMatGraNode >> ~ anObject [
	^ SeaMatGraOutgoingEdgePart
		matcher: anObject seaMatAsMatcher
		node: self
]
