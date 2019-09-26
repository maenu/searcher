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
SeaQueHasSubclassEdge class >> source: anObject target: anotherObject graph: aGraph [
	^ (self
		source: (anObject seaQueAsClassDescriptionNodeIn: aGraph)
		target: (anotherObject seaQueAsClassDescriptionNodeIn: aGraph))
		graph: aGraph;
		yourself
]

{ #category : #'as yet unclassified' }
SeaQueHasSubclassEdge class >> sourcePart: aNodePart targetPart: anotherNodePart [
	| graph |
	graph := aNodePart graph.
	^ (self
		source: (aNodePart nodeOrPut: [ :e | e seaQueAsClassDescriptionNodeIn: graph ])
		target:
		(anotherNodePart
		nodeOrPut: [ :e | e seaQueAsClassDescriptionNodeIn: graph ]))
		graph: graph;
		yourself
]

{ #category : #accessing }
SeaQueHasSubclassEdge >> executeSource: anObject [
	^ anObject subclasses
]
