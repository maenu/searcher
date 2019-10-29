Class {
	#name : #SeaQueImplementsMethodEdge,
	#superclass : #SeaQueReducingEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueImplementsMethodEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext [
	^ self
		source: (aContext at: aNodePart ifAbsentPut: #asClassDescriptionNameNode)
		target: (aContext at: anotherNodePart ifAbsentPut: #asCompiledMethodSelectorNode)
]

{ #category : #accessing }
SeaQueImplementsMethodEdge class >> identifier [
	^ #implementsMethod
]

{ #category : #accessing }
SeaQueImplementsMethodEdge >> canExecuteSource: anObject target: anotherObject [
	^ (anObject lookupSelector: anotherObject selector) == anotherObject
]
