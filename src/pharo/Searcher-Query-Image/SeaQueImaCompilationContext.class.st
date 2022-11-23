Class {
	#name : #SeaQueImaCompilationContext,
	#superclass : #SeaQueCompilationContext,
	#category : #'Searcher-Query-Image'
}

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> edgeClassDescriptionDefinesCompiledMethodSource: aNode optional: aBoolean target: anotherNode optional: anotherBoolean [
	self ensureCollection: #classDescription in: aNode.
	self ensureCollection: #compiledMethod in: anotherNode.
	^ SeaQueEdge
		source: aNode
		optional: aBoolean
		target: anotherNode
		optional: anotherBoolean
		strategies:
			{[ :t | {t methodClass} ] seaQueAsEdgeTargetCollectStrategy.
			[ :s | s methods ] seaQueAsEdgeSourceCollectStrategy.
			[ :s :t | s includesMethod: t ]
				seaQueAsEdgeSourceTargetSelectStrategy}
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> edgeClassDescriptionImplementsCompiledMethodSource: aNode optional: aBoolean target: anotherNode optional: anotherBoolean [
	self ensureCollection: #classDescription in: aNode.
	self ensureCollection: #compiledMethod in: anotherNode.
	^ SeaQueEdge
		source: aNode
		optional: aBoolean
		target: anotherNode
		optional: anotherBoolean
		strategies:
			{[ :t | t methodClass withAllSubclasses ]
				seaQueAsEdgeTargetCollectStrategy.
			[ :s | s allMethods ] seaQueAsEdgeSourceCollectStrategy.
			[ :s :t | (s lookupSelector: t selector) == t ]
				seaQueAsEdgeSourceTargetSelectStrategy}
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> edgeClassDescriptionSubclassesClassDescriptionSource: aNode optional: aBoolean target: anotherNode optional: anotherBoolean [
	self ensureCollection: #classDescription in: aNode.
	self ensureCollection: #classDescription in: anotherNode.
	^ SeaQueEdge
		source: aNode
		optional: aBoolean
		target: anotherNode
		optional: anotherBoolean
		strategies:
			{[ :t | t subclasses ] seaQueAsEdgeTargetCollectStrategy.
			[ :s | s superclass ifNil: [ {} ] ifNotNil: [ {s superclass} ] ]
				seaQueAsEdgeSourceCollectStrategy.
			[ :s :t | s superclass == t ]
				seaQueAsEdgeSourceTargetSelectStrategy}
]

{ #category : #accessing }
SeaQueImaCompilationContext >> edgeMessageOrInstanceVariable: aSymbol source: aNode optional: aBoolean target: anotherNode optional: anotherBoolean [
	self assert: [ aSymbol numArgs <= 1 ].
	self flag: 'should be added as default?'.
	aSymbol numArgs = 0
		ifTrue: [ ^ SeaQueEdge
				source: aNode
				optional: aBoolean
				target: anotherNode
				optional: anotherBoolean
				strategies:
					{[ :s | 
					(s class canPerform: aSymbol)
						ifTrue: [ (s perform: aSymbol) asCollection ]
						ifFalse: [ (s class hasInstVarNamed: aSymbol)
								ifTrue: [ (s instVarNamed: aSymbol) asCollection ]
								ifFalse: [ #() ] ] ] seaQueAsEdgeSourceCollectStrategy} ].
	^ SeaQueEdge
		source: aNode
		optional: aBoolean
		target: anotherNode
		optional: anotherBoolean
		strategies:
			{[ :s :t | s perform: aSymbol with: t ]
				seaQueAsEdgeSourceTargetSelectStrategy}
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> edgeMetacelloProjectSpecIncludesRPackageSource: aNode optional: aBoolean target: anotherNode optional: anotherBoolean [
	self ensureCollection: #metacelloProjectSpec in: aNode.
	self ensureCollection: #rPackage in: anotherNode.
	^ SeaQueEdge
		source: aNode
		optional: aBoolean
		target: anotherNode
		optional: anotherBoolean
		strategies:
			{[ :s | s version spec seaQueImaCurrentlyLoadedPackages ]
				seaQueAsEdgeSourceCollectStrategy}
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> edgeRPackageDefinesClassDescriptionSource: aNode optional: aBoolean target: anotherNode optional: anotherBoolean [
	self ensureCollection: #rPackage in: aNode.
	self ensureCollection: #classDescription in: anotherNode.
	^ SeaQueEdge
		source: aNode
		optional: aBoolean
		target: anotherNode
		optional: anotherBoolean
		strategies:
			{[ :t | {t package} ] seaQueAsEdgeTargetCollectStrategy.
			[ :s | s definedClasses ] seaQueAsEdgeSourceCollectStrategy.
			[ :s :t | s definesClass: t ]
				seaQueAsEdgeSourceTargetSelectStrategy}
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> edgeRPackageDefinesCompiledMethodSource: aNode optional: aBoolean target: anotherNode optional: anotherBoolean [
	self ensureCollection: #rPackage in: aNode.
	self ensureCollection: #compiledMethod in: anotherNode.
	^ SeaQueEdge
		source: aNode
		optional: aBoolean
		target: anotherNode
		optional: anotherBoolean
		strategies:
			{[ :t | {t package} ] seaQueAsEdgeTargetCollectStrategy.
			[ :s | s methods ] seaQueAsEdgeSourceCollectStrategy.
			[ :s :t | s includesSelector: t selector ofClass: t methodClass ]
				seaQueAsEdgeSourceTargetSelectStrategy}
]

{ #category : #initialization }
SeaQueImaCompilationContext >> initialize [
	super initialize.
	collections
		at: #classDescription
			put:
			(SeaQueCollection
				name: #classDescription
				initializer: [ (Smalltalk globals allClassesAndTraits
						flatCollect: [ :e | 
							{e.
							e classSide} ]) asIdentitySet ]);
		at: #compiledMethod
			put:
			(SeaQueCollection
				name: #compiledMethod
				initializer: [ ((Smalltalk globals allClassesAndTraits
						flatCollect: [ :e | 
							{e instanceSide.
							e classSide} ]) flatCollect: #methods) asIdentitySet ]);
		at: #metacelloProjectSpec
			put:
			(SeaQueCollection
				name: #metacelloProjectSpec
				initializer: [ (Metacello image
						baseline: [ :spec | true ];
						list) asIdentitySet ]);
		at: #rBProgramNode
			put:
			(SeaQueCollection
				name: #rBProgramNode
				initializer: [ (((Smalltalk globals allClassesAndTraits
						flatCollect: [ :e | 
							{e instanceSide.
							e classSide} ]) flatCollect: #methods)
						flatCollect: [ :e | {e ast} , e ast allChildren ]) asIdentitySet ]);
		at: #rPackage
			put:
			(SeaQueCollection
				name: #rPackage
				initializer: [ RPackage organizer packages asIdentitySet ])
]
