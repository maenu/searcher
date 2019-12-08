Class {
	#name : #SeaQueImaMetacelloProjectSpecIncludesRPackageEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query-Image'
}

{ #category : #'as yet unclassified' }
SeaQueImaMetacelloProjectSpecIncludesRPackageEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
	^ (self
		source:
		(aContext
		at: aNodePart
		ifPresent: [ :e | 
			self assert: [ e collection name = #metacelloProjectSpec ].
			e ]
		ifAbsentPut: [ :e | e object seaQueImaAsMetacelloProjectSpecNodeIn: aContext ])
		target:
		(aContext
				at: anotherNodePart
				ifPresent: [ :e | 
					self assert: [ e collection name = #rPackage ].
					e ]
				ifAbsentPut: [ :e | e object seaQueImaAsRPackageNodeIn: aContext ]))
		initializeSourceOptional: aBoolean targetOptional: anotherBoolean;
		yourself
]

{ #category : #initialization }
SeaQueImaMetacelloProjectSpecIncludesRPackageEdge >> initialize [
	super initialize.
	strategies
		add:
			(SeaQueEdgeSourceCollectStrategy
				edge: self
				block: [ :s | s version spec seaQueImaCurrentlyLoadedPackages ])
]
