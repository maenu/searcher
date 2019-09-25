Class {
	#name : #SeaMatNodeMatcher,
	#superclass : #SeaMatMatcher,
	#instVars : [
		'node'
	],
	#category : #'Searcher-Matcher'
}

{ #category : #testing }
SeaMatNodeMatcher >> makeDirty [
	super makeDirty.
	node outgoing do: [ :e | e matcher makeDirty ]
]

{ #category : #accessing }
SeaMatNodeMatcher >> node: anObject [
	node := anObject.
	matches := Set new.
	dirty := true
]
