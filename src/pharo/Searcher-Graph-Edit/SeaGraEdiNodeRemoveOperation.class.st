Class {
	#name : #SeaGraEdiNodeRemoveOperation,
	#superclass : #SeaGraEdiNodeOperation,
	#category : #'Searcher-Graph-Edit'
}

{ #category : #printing }
SeaGraEdiNodeRemoveOperation >> printOn: aStream [
	aStream nextPutAll: '-'.
	node printOn: aStream.
	aStream nextPutAll: ' '.
	cost printOn: aStream
]

{ #category : #'as yet unclassified' }
SeaGraEdiNodeRemoveOperation >> sourceOrNil [
	^ node
]
