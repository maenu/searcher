Class {
	#name : #SeaQueCompilationContext,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'edges',
		'variables',
		'collections'
	],
	#category : #'Searcher-Query-Parts'
}

{ #category : #'as yet unclassified' }
SeaQueCompilationContext class >> nodes: aDictionary edges: anotherDictionary variables: yetAnotherDictionary [
	^ self new
		initializeNodes: aDictionary
			edges: anotherDictionary
			variables: yetAnotherDictionary;
		yourself
]

{ #category : #accessing }
SeaQueCompilationContext >> at: aNodePart ifAbsentPut: aBlock [
	^ self at: aNodePart ifPresent: #yourself ifAbsentPut: aBlock
]

{ #category : #accessing }
SeaQueCompilationContext >> at: aNodePart ifPresent: aBlock ifAbsentPut: anotherBlock [
	self assert: [ nodes includesKey: aNodePart ].
	^ (nodes at: aNodePart)
		ifNil: [ nodes at: aNodePart put: (anotherBlock value: aNodePart) ]
		ifNotNil: aBlock
]

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> classDescriptionCollection [
	^ collections
		at: #classDescription
		ifAbsentPut: [ SeaQueCollection
				name: #classDescription
				initializer: self classDescriptionCollectionInitializer ]
]

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> classDescriptionCollectionInitializer [
	^ [ (Smalltalk globals allClassesAndTraits
		flatCollect: [ :e | 
			{e.
			e classSide} ]) asIdentitySet ]
]

{ #category : #compiling }
SeaQueCompilationContext >> compile [
	self
		assert: [ (nodes values allSatisfy: #isNil)
				and: [ edges values allSatisfy: #isNil ] ].
	edges := (edges associations
		collect: [ :e | e key -> (e key compileIn: self) ]) asDictionary.
	self
		assert: [ (nodes values allSatisfy: #isNotNil)
				and: [ edges values allSatisfy: #isNotNil ] ].
	variables := variables collect: [ :e | nodes at: e ].
	^ SeaQueGraph
		nodes: nodes values
		edges: edges values
		variables: variables
]

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> compiledMethodCollection [
	^ collections
		at: #compiledMethod
		ifAbsentPut: [ SeaQueCollection
				name: #compiledMethod
				initializer: self compiledMethodCollectionInitializer ]
]

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> compiledMethodCollectionInitializer [
	^ [ ((Smalltalk globals allClassesAndTraits
		flatCollect: [ :e | 
			{e instanceSide.
			e classSide} ]) flatCollect: #methods) asIdentitySet ]
]

{ #category : #initialization }
SeaQueCompilationContext >> initializeNodes: aDictionary edges: anotherDictionary variables: yetAnotherDictionary [
	self
		assert: [ nodes isNil and: [ edges isNil and: [ variables isNil ] ] ].
	nodes := aDictionary.
	edges := anotherDictionary.
	variables := yetAnotherDictionary
]

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> metacelloProjectSpecCollection [
	^ collections
		at: #metacelloProjectSpec
		ifAbsentPut: [ SeaQueCollection
				name: #metacelloProjectSpec
				initializer: self metacelloProjectSpecCollectionInitializer ]
]

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> metacelloProjectSpecCollectionInitializer [
	^ [ (Metacello image
		baseline: [ :spec | true ];
		list) asIdentitySet ]
]

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> rBProgramNodeCollection [
	^ collections
		at: #rBProgramNode
		ifAbsentPut: [ SeaQueCollection
				name: #rBProgramNode
				initializer: self rBProgramNodeCollectionInitializer ]
]

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> rBProgramNodeCollectionInitializer [
	^ [ (((Smalltalk globals allClassesAndTraits
		flatCollect: [ :e | 
			{e instanceSide.
			e classSide} ]) flatCollect: #methods)
		flatCollect: [ :e | {e ast} , e ast allChildren ]) asIdentitySet ]
]

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> rPackageCollection [
	^ collections
		at: #rPackage
		ifAbsentPut: [ SeaQueCollection
				name: #rPackage
				initializer: self rPackageCollectionInitializer ]
]

{ #category : #'as yet unclassified' }
SeaQueCompilationContext >> rPackageCollectionInitializer [
	^ [ RPackage organizer packages asIdentitySet ]
]
