Class {
	#name : #SeaQueMooPropertiesEdge,
	#superclass : #SeaQueEdge,
	#instVars : [
		'properties'
	],
	#category : #'Searcher-Query-Moose'
}

{ #category : #compiling }
SeaQueMooPropertiesEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
	self shouldNotImplement
]

{ #category : #compiling }
SeaQueMooPropertiesEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean properties: aSet [
	^ (self
		source:
		(aContext
		at: aNodePart
		ifPresent: [ :e | 
			self assert: [ e collection name = #entity ].
			e ]
		ifAbsentPut: [ :e | e object seaQueMooAsEntityNodeIn: aContext ])
		target:
		(aContext
				at: anotherNodePart
				ifPresent: [ :e | 
					self assert: [ e collection name = #entity ].
					e ]
				ifAbsentPut: [ :e | e object seaQueMooAsEntityNodeIn: aContext ]))
		initializeSourceOptional: aBoolean targetOptional: anotherBoolean;
		initializeProperties: aSet;
		yourself
]

{ #category : #initialization }
SeaQueMooPropertiesEdge >> initializeProperties: aSet [
	self assert: [ properties isNil ].
	self assert: [ aSet isNotEmpty ].
	properties := aSet.
	strategies
		add:
			(SeaQueEdgeSourceCollectStrategy
				edge: self
				block: [ :s | properties flatCollect: [ :p | p seaQueMooEntitiesFor: s ] ]).
	(aSet allSatisfy: #hasOpposite)
		ifTrue: [ strategies
				add:
					(SeaQueEdgeTargetCollectStrategy
						edge: self
						block:
							[ :t | properties flatCollect: [ :p | p opposite seaQueMooEntitiesFor: t ] ]) ]
]

{ #category : #printing }
SeaQueMooPropertiesEdge >> printOn: aStream [
	aStream
		nextPutAll: (properties collect: #name) asString;
		nextPutAll: ' ';
		nextPutAll: self cost asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
