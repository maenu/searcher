Class {
	#name : #SeaMatNodeMatcher,
	#superclass : #SeaMatMatcher,
	#instVars : [
		'node'
	],
	#category : #'Searcher-Matcher'
}

{ #category : #testing }
SeaMatNodeMatcher >> dirty: aBoolean [
	super dirty: aBoolean.
	aBoolean
		ifTrue: [ node outgoing do: [ :e | e matcher dirty: aBoolean ] ]
]

{ #category : #accessing }
SeaMatNodeMatcher >> node: anObject [
	node := anObject.
	matches := Set new.
	dirty := true
]
