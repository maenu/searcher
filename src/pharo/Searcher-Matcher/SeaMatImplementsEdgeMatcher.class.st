Class {
	#name : #SeaMatImplementsEdgeMatcher,
	#superclass : #SeaMatCartesianEdgeMatcher,
	#category : #'Searcher-Matcher'
}

{ #category : #accessing }
SeaMatImplementsEdgeMatcher >> canMatchSource: anObject target: anotherObject [
	^ (anObject lookupSelector: anotherObject selector) == anotherObject
]
