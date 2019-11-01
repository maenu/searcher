Class {
	#name : #SeaQueClassDescriptionImplementsCompiledMethodEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueClassDescriptionImplementsCompiledMethodEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext [
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
					self assert: [ e collection class = SeaQueCompiledMethodCollection ].
					e ]
				ifAbsentPut: [ :e | e object seaQueAsCompiledMethodNode ])
]

{ #category : #accessing }
SeaQueClassDescriptionImplementsCompiledMethodEdge class >> identifier [
	^ #classDescriptionImplementsCompiledMethod
]

{ #category : #initialization }
SeaQueClassDescriptionImplementsCompiledMethodEdge >> initialize [
	super initialize.
	strategies
		add:
			(SeaQueEdgeTargetCollectStrategy
				edge: self
				block: [ :t | t methodClass withAllSubclasses ]);
		add:
			(SeaQueEdgeSourceCollectStrategy
				edge: self
				block: [ :s | s allMethods ]);
		add:
			(SeaQueEdgeSourceTargetSelectStrategy
				edge: self
				block: [ :s :t | (s lookupSelector: t selector) == t ])
]
