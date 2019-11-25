Class {
	#name : #SeaQueImaClassDescriptionDefinesCompiledMethodEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query-Image'
}

{ #category : #'as yet unclassified' }
SeaQueImaClassDescriptionDefinesCompiledMethodEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
	^ (self
		source:
		(aContext
		at: aNodePart
		ifPresent: [ :e | 
			self assert: [ e collection name = #classDescription ].
			e ]
		ifAbsentPut: [ :e | e object seaQueImaAsClassDescriptionNodeIn: aContext ])
		target:
		(aContext
				at: anotherNodePart
				ifPresent: [ :e | 
					self assert: [ e collection name = #compiledMethod ].
					e ]
				ifAbsentPut: [ :e | e object seaQueImaAsCompiledMethodNodeIn: aContext ]))
		initializeSourceOptional: aBoolean targetOptional: anotherBoolean;
		yourself
]

{ #category : #initialization }
SeaQueImaClassDescriptionDefinesCompiledMethodEdge >> initialize [
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
