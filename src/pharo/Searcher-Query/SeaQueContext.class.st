Class {
	#name : #SeaQueContext,
	#superclass : #Object,
	#instVars : [
		'collections'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueContext >> collectionAt: aString [
	^ collections at: aString
]

{ #category : #accessing }
SeaQueContext >> edgeBlock: aBlock source: aNode optional: aBoolean target: anotherNode optional: anotherBoolean [
	^ SeaQueEdge
		source: aNode
		optional: aBoolean
		target: anotherNode
		optional: anotherBoolean
		data: aBlock
		strategies: {aBlock seaQueAsEdgeSourceCollectStrategy}
]

{ #category : #'as yet unclassified' }
SeaQueContext >> ensureCollection: aSymbol in: aNode [
	self
		assert: [ {aSymbol.
			#custom.
			#empty} includes: aNode collection name ].
	aNode collection name = #empty
		ifTrue: [ aNode collection: (self collectionAt: aSymbol) ]
]

{ #category : #initialization }
SeaQueContext >> initialize [
	super initialize.
	collections := Dictionary new
]
