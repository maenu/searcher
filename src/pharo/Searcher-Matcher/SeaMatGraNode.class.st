Class {
	#name : #SeaMatGraNode,
	#superclass : #SeaGraNode,
	#traits : 'SeaMatGraTEntity',
	#classTraits : 'SeaMatGraTEntity classTrait',
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

{ #category : #'as yet unclassified' }
SeaMatGraNode >> ~ anObject [
	^ SeaMatGraOutgoingEdgePart
		matcher: anObject seaMatAsMatcher
		node: self
]
