Class {
	#name : #SeaQueMetacelloProjectSpecIncludesRPackageEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueMetacelloProjectSpecIncludesRPackageEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
	^ (self
		source:
		(aContext
		at: aNodePart
		ifPresent: [ :e | 
			self
				assert: [ e collection class = SeaQueMetacelloProjectSpecCollection ].
			e ]
		ifAbsentPut: [ :e | e object seaQueAsMetacelloProjectSpecNode ])
		target:
		(aContext
				at: anotherNodePart
				ifPresent: [ :e | 
					self assert: [ e collection class = SeaQueRPackageCollection ].
					e ]
				ifAbsentPut: [ :e | e object seaQueAsRPackageNode ]))
		initializeSourceOptional: aBoolean targetOptional: anotherBoolean;
		yourself
]

{ #category : #accessing }
SeaQueMetacelloProjectSpecIncludesRPackageEdge class >> identifier [
	^ #metacelloProjectSpecIncludesRPackage
]

{ #category : #accessing }
SeaQueMetacelloProjectSpecIncludesRPackageEdge >> generateSource: anObject target: anotherObject [
	^ anObject version spec seaQueCurrentlyLoadedPackages
		includes: anotherObject
]

{ #category : #initialization }
SeaQueMetacelloProjectSpecIncludesRPackageEdge >> initialize [
	super initialize.
	strategies
		add:
			(SeaQueEdgeSourceCollectStrategy
				edge: self
				block: [ :s | s version spec seaQueCurrentlyLoadedPackages ]);
		add:
			(SeaQueEdgeSourceTargetSelectStrategy
				edge: self
				block: [ :s :t | s version spec seaQueCurrentlyLoadedPackages includes: t ])
]
