Class {
	#name : #SeaQueHasSubclassEdge,
	#superclass : #SeaQueGeneratingEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueHasSubclassEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext [
	^ self
		source: (aContext at: aNodePart ifAbsentPut: #asClassDescriptionNameNode)
		target: (aContext at: anotherNodePart ifAbsentPut: #asClassDescriptionNameNode)
]

{ #category : #accessing }
SeaQueHasSubclassEdge class >> identifier [
	^ #hasSubclass
]

{ #category : #accessing }
SeaQueHasSubclassEdge >> executeSource: anObject [
	^ anObject subclasses
]

{ #category : #printing }
SeaQueHasSubclassEdge >> printOn: aStream [
	aStream
		nextPutAll: 'hasSubclass ';
		nextPutAll: self estimatedResultsSize asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
