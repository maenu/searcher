Class {
	#name : #SeaQueIncomingEdgePart,
	#superclass : #SeaQueEdgePart,
	#category : #'Searcher-Query-Parts'
}

{ #category : #arithmetic }
SeaQueIncomingEdgePart >> ?~ anObject [
	optional := false.
	^ otherNodePart := graphPart nodePartFor: anObject
]

{ #category : #compiling }
SeaQueIncomingEdgePart >> compileIn: aContext [
	^ object seaQueAsEdgeFactory
		compileSourcePart: otherNodePart
		targetPart: nodePart
		in: aContext
		optional: optional
]

{ #category : #arithmetic }
SeaQueIncomingEdgePart >> ~ anObject [
	optional := true.
	^ otherNodePart := graphPart nodePartFor: anObject
]
