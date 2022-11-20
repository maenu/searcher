Class {
	#name : #SeaQueImaCompilationContext,
	#superclass : #SeaQueCompilationContext,
	#category : #'Searcher-Query-Image'
}

{ #category : #initialization }
SeaQueImaCompilationContext >> initializeCollections [
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
