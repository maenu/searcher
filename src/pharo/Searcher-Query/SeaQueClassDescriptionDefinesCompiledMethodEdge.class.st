Class {
	#name : #SeaQueClassDescriptionDefinesCompiledMethodEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueClassDescriptionDefinesCompiledMethodEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
	^ (self
		source:
		(aContext
		at: aNodePart
		ifPresent: [ :e | 
			self assert: [ e collection name = #classDescription ].
			e ]
		ifAbsentPut: [ :e | e object seaQueAsClassDescriptionNodeIn: aContext ])
		target:
		(aContext
				at: anotherNodePart
				ifPresent: [ :e | 
					self assert: [ e collection name = #compiledMethod ].
					e ]
				ifAbsentPut: [ :e | e object seaQueAsCompiledMethodNodeIn: aContext ]))
		initializeSourceOptional: aBoolean targetOptional: anotherBoolean;
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
