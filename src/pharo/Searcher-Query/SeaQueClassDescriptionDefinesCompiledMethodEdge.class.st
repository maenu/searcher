Class {
	#name : #SeaQueClassDescriptionDefinesCompiledMethodEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueClassDescriptionDefinesCompiledMethodEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext optional: aBoolean [
	^ (self
		source:
		(aContext
		at: aNodePart
		ifPresent: [ :e | 
			self assert: [ e collection class = SeaQueClassDescriptionCollection ].
			e ]
		ifAbsentPut: [ :e | e object seaQueAsClassDescriptionNode ])
		target:
		(aContext
				at: anotherNodePart
				ifPresent: [ :e | 
					self assert: [ e collection class = SeaQueCompiledMethodCollection ].
					e ]
				ifAbsentPut: [ :e | e object seaQueAsCompiledMethodNode ]))
		initializeOptional: aBoolean;
		yourself
]

{ #category : #accessing }
SeaQueClassDescriptionDefinesCompiledMethodEdge class >> identifier [
	^ #classDescriptionDefinesCompiledMethod
]

{ #category : #initialization }
SeaQueClassDescriptionDefinesCompiledMethodEdge >> initialize [
	super initialize.
	strategies
		add:
			(SeaQueEdgeTargetCollectStrategy
				edge: self
				block: [ :t | {t methodClass} ]);
		add: (SeaQueEdgeSourceCollectStrategy edge: self block: [ :s | s methods ]);
		add:
			(SeaQueEdgeSourceTargetSelectStrategy
				edge: self
				block: [ :s :t | s includesMethod: t ])
]
