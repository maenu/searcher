Class {
	#name : #SeaQueHasSubclassEdge,
	#superclass : #SeaQueGeneratingEdge,
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueHasSubclassEdge class >> identifier [
	^ #hasSubclass
]

{ #category : #'as yet unclassified' }
SeaQueHasSubclassEdge class >> sourcePart: aNodePart targetPart: anotherNodePart [
	| graph |
	graph := aNodePart graph.
	^ (self
		source: (aNodePart nodeOrPut: [ :e | e seaQueAsClassDescriptionNodeFromPart: e ])
		target:
		(anotherNodePart
		nodeOrPut: [ :e | e seaQueAsClassDescriptionNodeFromPart: e ]))
		graph: graph;
		yourself
]

{ #category : #accessing }
SeaQueHasSubclassEdge >> executeSource: anObject [
	^ anObject subclasses
]
