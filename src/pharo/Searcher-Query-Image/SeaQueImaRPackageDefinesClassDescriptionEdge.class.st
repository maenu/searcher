Class {
	#name : #SeaQueImaRPackageDefinesClassDescriptionEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query-Image'
}

{ #category : #'as yet unclassified' }
SeaQueImaRPackageDefinesClassDescriptionEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
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
						assert: [ #(classDescription custom empty) includes: e collection name ].
					e collection name = #empty
						ifTrue: [ e collection: (aContext collectionAt: #classDescription) ].
					e ]
				ifAbsentPut: [ :e | e object seaQueImaAsClassDescriptionNodeIn: aContext ]))
		initializeSourceOptional: aBoolean targetOptional: anotherBoolean;
		yourself
]

{ #category : #initialization }
SeaQueImaRPackageDefinesClassDescriptionEdge >> initialize [
	super initialize.
	strategies
		add:
			(SeaQueEdgeTargetCollectStrategy
				edge: self
				block: [ :t | {t package} ]);
		add:
			(SeaQueEdgeSourceCollectStrategy
				edge: self
				block: [ :s | s definedClasses ]);
		add:
			(SeaQueEdgeSourceTargetSelectStrategy
				edge: self
				block: [ :s :t | s definesClass: t ])
]
