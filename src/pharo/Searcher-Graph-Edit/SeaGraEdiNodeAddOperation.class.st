Class {
	#name : #SeaGraEdiNodeAddOperation,
	#superclass : #SeaGraEdiNodeOperation,
	#category : #'Searcher-Graph-Edit'
}

{ #category : #printing }
SeaGraEdiNodeAddOperation >> printOn: aStream [
	aStream nextPutAll: '+'.
	node printOn: aStream.
	aStream nextPutAll: ' '.
	cost printOn: aStream
]

{ #category : #'as yet unclassified' }
SeaGraEdiNodeAddOperation >> targetOrNil [
	^ node
]
