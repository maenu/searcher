Class {
	#name : #SeaQueImaRPackageDefinesCompiledMethodEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query-Image'
}

{ #category : #'as yet unclassified' }
SeaQueImaRPackageDefinesCompiledMethodEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
	^ (self
		source:
		(aContext
		at: aNodePart
		ifPresent: [ :e | 
			self assert: [ #(rPackage custom empty) includes: e collection name ].
			e collection name = #empty
				ifTrue: [ e collection: (aContext collectionAt: #rPackage) ].
			e ]
		ifAbsentPut: [ :e | e object seaQueImaAsRPackageNodeIn: aContext ])
		target:
		(aContext
				at: anotherNodePart
				ifPresent: [ :e | 
					self
						assert: [ #(compiledMethod custom empty) includes: e collection name ].
					e collection name = #empty
						ifTrue: [ e collection: (aContext collectionAt: #compiledMethod) ].
					e ]
				ifAbsentPut: [ :e | e object seaQueImaAsCompiledMethodNodeIn: aContext ]))
		initializeSourceOptional: aBoolean targetOptional: anotherBoolean;
		yourself
]

{ #category : #initialization }
SeaQueImaRPackageDefinesCompiledMethodEdge >> initialize [
	super initialize.
	strategies
		add:
			(SeaQueEdgeTargetCollectStrategy
				edge: self
				block: [ :t | {t package} ]);
		add: (SeaQueEdgeSourceCollectStrategy edge: self block: [ :s | s methods ]);
		add:
			(SeaQueEdgeSourceTargetSelectStrategy
				edge: self
				block: [ :s :t | s includesSelector: t selector ofClass: t methodClass ])
]
