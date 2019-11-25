"
I am a copy of class SeaQueCompilationContext. This comment is copied from there, and might not be entirely accurate

Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	collections:		<Object>
	edges:		<Object>
	nodes:		<Object>
	variables:		<Object>


    Implementation Points
"
Class {
	#name : #SeaQueImaCompilationContext,
	#superclass : #SeaQueCompilationContext,
	#category : #'Searcher-Query-Image'
}

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext class >> nodes: aDictionary edges: anotherDictionary variables: yetAnotherDictionary [
	^ self new
		initializeNodes: aDictionary
			edges: anotherDictionary
			variables: yetAnotherDictionary;
		yourself
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> classDescriptionCollection [
	^ collections
		at: #classDescription
		ifAbsentPut: [ SeaQueCollection
				name: #classDescription
				initializer: self classDescriptionCollectionInitializer ]
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> classDescriptionCollectionInitializer [
	^ [ (Smalltalk globals allClassesAndTraits
		flatCollect: [ :e | 
			{e.
			e classSide} ]) asIdentitySet ]
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> compiledMethodCollection [
	^ collections
		at: #compiledMethod
		ifAbsentPut: [ SeaQueCollection
				name: #compiledMethod
				initializer: self compiledMethodCollectionInitializer ]
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> compiledMethodCollectionInitializer [
	^ [ ((Smalltalk globals allClassesAndTraits
		flatCollect: [ :e | 
			{e instanceSide.
			e classSide} ]) flatCollect: #methods) asIdentitySet ]
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> metacelloProjectSpecCollection [
	^ collections
		at: #metacelloProjectSpec
		ifAbsentPut: [ SeaQueCollection
				name: #metacelloProjectSpec
				initializer: self metacelloProjectSpecCollectionInitializer ]
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> metacelloProjectSpecCollectionInitializer [
	^ [ (Metacello image
		baseline: [ :spec | true ];
		list) asIdentitySet ]
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> rBProgramNodeCollection [
	^ collections
		at: #rBProgramNode
		ifAbsentPut: [ SeaQueCollection
				name: #rBProgramNode
				initializer: self rBProgramNodeCollectionInitializer ]
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> rBProgramNodeCollectionInitializer [
	^ [ (((Smalltalk globals allClassesAndTraits
		flatCollect: [ :e | 
			{e instanceSide.
			e classSide} ]) flatCollect: #methods)
		flatCollect: [ :e | {e ast} , e ast allChildren ]) asIdentitySet ]
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> rPackageCollection [
	^ collections
		at: #rPackage
		ifAbsentPut: [ SeaQueCollection
				name: #rPackage
				initializer: self rPackageCollectionInitializer ]
]

{ #category : #'as yet unclassified' }
SeaQueImaCompilationContext >> rPackageCollectionInitializer [
	^ [ RPackage organizer packages asIdentitySet ]
]
