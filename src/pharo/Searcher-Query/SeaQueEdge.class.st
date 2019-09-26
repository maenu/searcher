Class {
	#name : #SeaQueEdge,
	#superclass : #SeaQueQuery,
	#traits : 'SeaGraTEdge',
	#classTraits : 'SeaGraTEdge classTrait',
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueEdge >> seaQueAsEdgeSource: aNode target: otherNode [
	^ self
		graph: aNode graph;
		source: aNode target: otherNode;
		yourself
]
