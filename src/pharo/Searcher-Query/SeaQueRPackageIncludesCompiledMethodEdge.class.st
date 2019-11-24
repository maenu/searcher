Class {
	#name : #SeaQueRPackageIncludesCompiledMethodEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueRPackageIncludesCompiledMethodEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
	^ (self
		source:
		(aContext
		at: aNodePart
		ifPresent: [ :e | 
			self assert: [ e collection name = #rPackage ].
			e ]
		ifAbsentPut: [ :e | e object seaQueAsRPackageNodeIn: aContext ])
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
SeaQueRPackageIncludesCompiledMethodEdge class >> identifier [
	^ #rPackageIncludesCompiledMethod
]

{ #category : #initialization }
SeaQueRPackageIncludesCompiledMethodEdge >> initialize [
	super initialize.
	strategies
		add:
			(SeaQueEdgeTargetCollectStrategy
				edge: self
				block: [ :t | {t package} ]);
		add:
			(SeaQueEdgeSourceCollectStrategy
				edge: self
				block: [ :s | s extensionMethods ]);
		add:
			(SeaQueEdgeSourceTargetSelectStrategy
				edge: self
				block: [ :s :t | s includesSelector: t selector ofClass: t methodClass ])
]
