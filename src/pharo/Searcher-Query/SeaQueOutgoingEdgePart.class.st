Class {
	#name : #SeaQueOutgoingEdgePart,
	#superclass : #SeaQueEdgePart,
	#category : #'Searcher-Query-Parts'
}

{ #category : #compiling }
SeaQueOutgoingEdgePart >> compileIn: aContext [
	^ object seaQueAsEdgeFactory
		compileSourcePart: nodePart
		targetPart: otherNodePart
		in: aContext
]

{ #category : #associating }
SeaQueOutgoingEdgePart >> ~> anObject [
	^ otherNodePart := graphPart nodePartFor: anObject
]
