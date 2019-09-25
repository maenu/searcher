Class {
	#name : #SeaMatEdgeMatcher,
	#superclass : #SeaMatMatcher,
	#instVars : [
		'edge'
	],
	#category : #'Searcher-Matcher'
}

{ #category : #accessing }
SeaMatEdgeMatcher >> edge: anObject [
	edge := anObject.
	matches := Set new.
	dirty := true
]
