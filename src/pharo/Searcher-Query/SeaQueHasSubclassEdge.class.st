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

{ #category : #accessing }
SeaQueHasSubclassEdge >> executeSource: anObject [
	^ anObject subclasses
]
