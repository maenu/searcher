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
		source: (aNodePart nodeOrPut: [ :e | e seaQueAsClassDescriptionNodeFromPart: e ])
		target:
		(anotherNodePart
		nodeOrPut: [ :e | e seaQueAsCompiledMethodSelectorNodeFromPart: e ]))
		graph: graph;
		yourself
]

{ #category : #accessing }
SeaQueImplementsEdge >> canExecuteSource: anObject target: anotherObject [
	^ (anObject lookupSelector: anotherObject selector) == anotherObject
]
