Class {
	#name : #SeaQueDefinesMethodEdge,
	#superclass : #SeaQueReducingEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueDefinesMethodEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext [
	^ self
		source: (aContext at: aNodePart ifAbsentPut: #asClassDescriptionNameNode)
		target: (aContext at: anotherNodePart ifAbsentPut: #asCompiledMethodSelectorNode)
]

{ #category : #accessing }
SeaQueDefinesMethodEdge class >> identifier [
	^ #definesMethod
]

{ #category : #accessing }
SeaQueDefinesMethodEdge >> canExecuteSource: anObject target: anotherObject [
	^ anObject includesMethod: anotherObject
]
