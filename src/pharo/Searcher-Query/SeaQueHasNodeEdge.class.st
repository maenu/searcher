Class {
	#name : #SeaQueHasNodeEdge,
	#superclass : #SeaQueReducingEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueHasNodeEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext [
	self flag: 'FIXME the distinction between types and names is weird'.
	^ self
		source: (aContext at: aNodePart ifAbsentPut: #asCompiledMethodSelectorNode)
		target: (aContext at: anotherNodePart ifAbsentPut: #asRBProgramNodeNode)
]

{ #category : #accessing }
SeaQueHasNodeEdge class >> identifier [
	^ #hasNode
]

{ #category : #accessing }
SeaQueHasNodeEdge >> canExecuteSource: anObject target: anotherObject [
	^ anObject includesClass: anotherObject
]
