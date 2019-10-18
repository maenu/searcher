Class {
	#name : #SeaQueDefinesEdge,
	#superclass : #SeaQueReducingEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueDefinesEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext [
	^ self
		source: (aContext at: aNodePart ifAbsentPut: #asClassDescriptionNameNode)
		target: (aContext at: anotherNodePart ifAbsentPut: #asCompiledMethodSelectorNode)
]

{ #category : #accessing }
SeaQueDefinesEdge class >> identifier [
	^ #defines
]

{ #category : #accessing }
SeaQueDefinesEdge >> canExecuteSource: anObject target: anotherObject [
	^ anObject includesMethod: anotherObject
]

{ #category : #printing }
SeaQueDefinesEdge >> printOn: aStream [
	aStream
		nextPutAll: 'defines ';
		nextPutAll: self estimatedResultsSize asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
