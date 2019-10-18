Class {
	#name : #SeaQueImplementsEdge,
	#superclass : #SeaQueReducingEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueImplementsEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext [
	^ self
		source: (aContext at: aNodePart ifAbsentPut: #asClassDescriptionNameNode)
		target: (aContext at: anotherNodePart ifAbsentPut: #asCompiledMethodSelectorNode)
]

{ #category : #accessing }
SeaQueImplementsEdge class >> identifier [
	^ #implements
]

{ #category : #accessing }
SeaQueImplementsEdge >> canExecuteSource: anObject target: anotherObject [
	^ (anObject lookupSelector: anotherObject selector) == anotherObject
]

{ #category : #printing }
SeaQueImplementsEdge >> printOn: aStream [
	aStream
		nextPutAll: 'implements ';
		nextPutAll: self estimatedResultsSize asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
