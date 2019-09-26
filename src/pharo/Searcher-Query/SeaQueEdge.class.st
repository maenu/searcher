Class {
	#name : #SeaQueEdge,
	#superclass : #SeaQueQuery,
	#traits : 'SeaGraTEdge',
	#classTraits : 'SeaGraTEdge classTrait',
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueEdge class >> identifier [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SeaQueEdge class >> sourcePart: aNodePart targetPart: anotherNodePart [
	"Needs to ensure node on parts."

	self subclassResponsibility
]

{ #category : #accessing }
SeaQueEdge >> graph: aGraph [
	super graph: aGraph.
	graph edges add: self
]
