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
SeaQueImplementsEdge class >> sourcePart: aNodePart targetPart: anotherNodePart [
	| graph |
	graph := aNodePart graph.
	^ (self
		source:
		(aNodePart nodeOrPut: [ :e | e seaQueAsClassDescriptionNodeIn: graph ])
		target:
		(anotherNodePart
		nodeOrPut: [ :e | e seaQueAsMethodSelectorNodeIn: graph ]))
		graph: graph;
		yourself
]

{ #category : #accessing }
SeaQueImplementsEdge >> canExecuteSource: anObject target: anotherObject [
	^ (anObject lookupSelector: anotherObject selector) == anotherObject
]
