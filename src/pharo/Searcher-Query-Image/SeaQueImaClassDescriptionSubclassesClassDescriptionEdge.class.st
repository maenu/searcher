Class {
	#name : #SeaQueImaClassDescriptionSubclassesClassDescriptionEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query-Image'
}

{ #category : #'as yet unclassified' }
SeaQueImaClassDescriptionSubclassesClassDescriptionEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
	^ (self
		source:
		(aContext
		at: aNodePart
		ifPresent: [ :e | 
			self assert: [ e collection name = #classDescription ].
			e ]
		ifAbsentPut: [ :e | e object seaQueImaAsClassDescriptionNodeIn: aContext ])
		target:
		(aContext
				at: anotherNodePart
				ifPresent: [ :e | 
					self assert: [ e collection name = #classDescription ].
					e ]
				ifAbsentPut: [ :e | e object seaQueImaAsClassDescriptionNodeIn: aContext ]))
		initializeSourceOptional: aBoolean targetOptional: anotherBoolean;
		yourself
]

{ #category : #accessing }
SeaQueImaClassDescriptionSubclassesClassDescriptionEdge class >> identifier [
	^ #classDescriptionSubclassesClassDescription
]

{ #category : #initialization }
SeaQueImaClassDescriptionSubclassesClassDescriptionEdge >> initialize [
	super initialize.
	strategies
		add:
			(SeaQueEdgeTargetCollectStrategy
				edge: self
				block: [ :t | t subclasses ]);
		add:
			(SeaQueEdgeSourceCollectStrategy
				edge: self
				block: [ :s | s superclass ifNil: [ {} ] ifNotNil: [ {s superclass} ] ]);
		add:
			(SeaQueEdgeSourceTargetSelectStrategy
				edge: self
				block: [ :s :t | s superclass == t ])
]
