Class {
	#name : #SeaQueHasSubclassEdge,
	#superclass : #SeaQueGeneratingEdge,
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueHasSubclassEdge >> executeSource: anObject [
	^ anObject subclasses
]
