Class {
	#name : #SeaGraEdiEdgeAddOperation,
	#superclass : #SeaGraEdiEdgeOperation,
	#category : #'Searcher-Graph-Edit'
}

{ #category : #printing }
SeaGraEdiEdgeAddOperation >> printOn: aStream [
	aStream nextPutAll: '+'.
	edge printOn: aStream.
	aStream nextPutAll: ' '.
	cost printOn: aStream
]

{ #category : #'as yet unclassified' }
SeaGraEdiEdgeAddOperation >> targetOrNil [
	^ edge
]
