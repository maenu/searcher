Class {
	#name : #SeaQueImplementsEdge,
	#superclass : #SeaQueReducingEdge,
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueImplementsEdge class >> identifier [
	^ #implements
]

{ #category : #'as yet unclassified' }
SeaQueImplementsEdge class >> source: anObject target: anotherObject graph: aGraph [
	^ (self
		source: (anObject seaQueAsClassDescriptionNodeIn: aGraph)
		target: (anotherObject seaQueAsMethodSelectorNodeIn: aGraph))
		graph: aGraph;
		yourself
]

{ #category : #accessing }
SeaQueImplementsEdge >> canExecuteSource: anObject target: anotherObject [
	^ (anObject lookupSelector: anotherObject selector) == anotherObject
]
