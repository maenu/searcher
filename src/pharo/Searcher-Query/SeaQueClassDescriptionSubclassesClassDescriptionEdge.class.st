Class {
	#name : #SeaQueClassDescriptionSubclassesClassDescriptionEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueClassDescriptionSubclassesClassDescriptionEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext [
	^ self
		source:
			(aContext
				at: aNodePart
				ifPresent: [ :e | 
					self assert: [ e collection class = SeaQueClassDescriptionCollection ].
					e ]
				ifAbsentPut: [ :e | e object seaQueAsClassDescriptionNode ])
		target:
			(aContext
				at: anotherNodePart
				ifPresent: [ :e | 
					self assert: [ e collection class = SeaQueClassDescriptionCollection ].
					e ]
				ifAbsentPut: [ :e | e object seaQueAsClassDescriptionNode ])
]

{ #category : #accessing }
SeaQueClassDescriptionSubclassesClassDescriptionEdge class >> identifier [
	^ #classDescriptionSubclassesClassDescription
]

{ #category : #initialization }
SeaQueClassDescriptionSubclassesClassDescriptionEdge >> initialize [
	super initialize.
	strategies
		add:
			(SeaQueEdgeTargetCollectStrategy
				edge: self
				block: [ :t | t subclasses ]);
		add:
			(SeaQueEdgeSourceCollectStrategy
				edge: self
				block: [ :s | {s superclass} ]);
		add:
			(SeaQueEdgeSourceTargetSelectStrategy
				edge: self
				block: [ :s :t | s superclass == t ])
]
