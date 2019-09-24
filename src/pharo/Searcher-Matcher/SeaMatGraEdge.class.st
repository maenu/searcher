Class {
	#name : #SeaMatGraEdge,
	#superclass : #SeaGraEdge,
	#traits : 'SeaMatGraTEntity',
	#classTraits : 'SeaMatGraTEntity classTrait',
	#category : #'Searcher-Matcher-Graph'
}

{ #category : #'as yet unclassified' }
SeaMatGraEdge class >> matcher: aMatcher source: aNode target: anotherNode [
	^ (self source: aNode target: anotherNode)
		matcher: aMatcher;
		yourself
]
