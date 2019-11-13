Class {
	#name : #SeaQueEdgePart,
	#superclass : #SeaQuePart,
	#instVars : [
		'nodePart',
		'otherNodePart',
		'sourceOptional',
		'targetOptional'
	],
	#category : #'Searcher-Query-Parts'
}

{ #category : #compiling }
SeaQueEdgePart >> compileIn: aContext [
	self subclassResponsibility
]
