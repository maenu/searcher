Class {
	#name : #SeaQueRPackageIncludesCompiledMethodEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueRPackageIncludesCompiledMethodEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext optional: aBoolean [
	^ (self
		source:
		(aContext
		at: aNodePart
		ifPresent: [ :e | 
			self assert: [ e collection class = SeaQueRPackageCollection ].
			e ]
		ifAbsentPut: [ :e | e object seaQueAsRPackageNode ])
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
