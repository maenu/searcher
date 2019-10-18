Class {
	#name : #SeaQueIncomingEdgePart,
	#superclass : #SeaQueEdgePart,
	#category : #'Searcher-Query-Parts'
}

{ #category : #compiling }
SeaQueIncomingEdgePart >> compileIn: aContext [
	^ object seaQueAsEdgeFactory
		compileSourcePart: otherNodePart
		targetPart: nodePart
		in: aContext
]

{ #category : #arithmetic }
SeaQueIncomingEdgePart >> ~ anObject [
	^ otherNodePart := graphPart nodePartFor: anObject
]
