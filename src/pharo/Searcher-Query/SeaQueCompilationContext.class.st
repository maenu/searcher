Class {
	#name : #SeaQueCompilationContext,
	#superclass : #Object,
	#instVars : [
		'collections'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> collectionAt: aString [
	^ collections at: aString
]

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> edgeBlock: aBlock source: aNode optional: aBoolean target: anotherNode optional: anotherBoolean [
	^ SeaQueEdge
		source: aNode
		optional: aBoolean
		target: anotherNode
		optional: anotherBoolean
		strategies: {aBlock seaQueAsEdgeSourceCollectStrategy}
]

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> ensureCollection: aSymbol in: aNode [
	self
		assert: [ {aSymbol.
			#custom.
			#empty} includes: aNode collection name ].
	aNode collection name = #empty
		ifTrue: [ aNode collection: (self collectionAt: aSymbol) ]
]

{ #category : #initialization }
SeaQueCompilationContext >> initialize [
	super initialize.
	collections := Dictionary new
]
