Class {
	#name : #SeaGraEdiEdgeRemoveOperation,
	#superclass : #SeaGraEdiEdgeOperation,
	#category : #'Searcher-Graph-Edit'
}

{ #category : #printing }
SeaGraEdiEdgeRemoveOperation >> printOn: aStream [
	aStream nextPutAll: '-'.
	edge printOn: aStream.
	aStream nextPutAll: ' '.
	cost printOn: aStream
]

{ #category : #'as yet unclassified' }
SeaGraEdiEdgeRemoveOperation >> sourceOrNil [
	^ edge
]
