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
SeaQueEdge class >> source: anObject target: anotherObject graph: aGraph [
	self subclassResponsibility
]

{ #category : #accessing }
SeaQueEdge >> graph: aGraph [
	super graph: aGraph.
	graph edges add: self
]

{ #category : #'as yet unclassified' }
SeaQueEdge >> seaQueAsEdgeSource: aNode target: otherNode [
	^ self
		source: aNode target: otherNode;
		graph: aNode graph;
		yourself
]
