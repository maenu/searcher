Class {
	#name : #SeaQueEdgeBuilder,
	#superclass : #Object,
	#instVars : [
		'argument',
		'source',
		'target',
		'sourceOptional',
		'targetOptional',
		'strategies',
		'context'
	],
	#category : #'Searcher-Query-Parts'
}

{ #category : #adding }
SeaQueEdgeBuilder >> build [
	argument seaQueBuildEdge: self.
	^ SeaQueEdge
		source: source
		optional: sourceOptional
		target: target
		optional: targetOptional
		strategies: strategies
]

{ #category : #'as yet unclassified' }
SeaQueEdgeBuilder >> buildBlock [
	strategies add: argument seaQueAsEdgeSourceCollectStrategy
]

{ #category : #accessing }
SeaQueEdgeBuilder >> buildMessageOrInstanceVariable [
	self assert: [ argument numArgs <= 1 ].
	self flag: 'should be added as default?'.
	argument numArgs = 0
		ifTrue: [ strategies
				add:
					[ :s | 
					(s class canPerform: argument)
						ifTrue: [ (s perform: argument) asCollection ]
						ifFalse: [ (s class hasInstVarNamed: argument)
								ifTrue: [ (s instVarNamed: argument) asCollection ]
								ifFalse: [ #() ] ] ] seaQueAsEdgeSourceCollectStrategy ]
		ifFalse:
			[ strategies add: [ :s :t | s perform: argument with: t ] ]
				seaQueAsEdgeSourceTargetSelectStrategy
]

{ #category : #'as yet unclassified' }
SeaQueEdgeBuilder >> ensureCollection: aSymbol in: aNode [
	self
		assert: [ {aSymbol.
			#custom.
			#empty} includes: aNode collection name ].
	aNode collection name = #empty
		ifTrue: [ aNode collection: (context collectionAt: aSymbol) ]
]

{ #category : #'as yet unclassified' }
SeaQueEdgeBuilder >> initialize [
	super initialize.
	strategies := OrderedCollection new
]
