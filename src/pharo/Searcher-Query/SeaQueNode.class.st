"
nil
"
Class {
	#name : #SeaQueNode,
	#superclass : #SeaGraDataNode,
	#traits : 'SeaQueTConstraint',
	#classTraits : 'SeaQueTConstraint classTrait',
	#instVars : [
		'collection',
		'filter',
		'context'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueNode class >> collection: aCollection context: aContext [
	^ self new
		initializeCollection: aCollection context: aContext;
		yourself
]

{ #category : #requirements }
SeaQueNode class >> empty: aContext [
	^ self
		collection: (SeaQueCollection name: #empty initializer: [ IdentitySet new ])
		context: aContext
]

{ #category : #'instance creation' }
SeaQueNode class >> fromCollection: aCollection context: aContext [
	^ (self
		collection:
		(SeaQueCollection
		name: #custom
		initializer: [ aCollection asIdentitySet ])
		context: aContext)
		initializeFilter: [ :c | c objects intersection: aCollection ];
		yourself
]

{ #category : #'as yet unclassified' }
SeaQueNode >> <~ anObject [
	^ SeaQueIncomingEdgeBuilder
		argument: anObject
		target: self
		optional: false
		context: context
]

{ #category : #'as yet unclassified' }
SeaQueNode >> <~? anObject [
	^ SeaQueIncomingEdgeBuilder
		argument: anObject
		target: self
		optional: true
		context: context
]

{ #category : #accessing }
SeaQueNode >> collection [
	^ collection
]

{ #category : #accessing }
SeaQueNode >> collection: aCollection [
	collection := aCollection.
	results := IdentitySet new.
	shouldExecute := true
]

{ #category : #accessing }
SeaQueNode >> cost [
	^ wasExecuted ifTrue: [ results size ] ifFalse: [ collection size ]
]

{ #category : #accessing }
SeaQueNode >> execute [
	self assert: [ self shouldExecute ].
	self assert: [ self canExecute ].
	self results: (self results select: [ :e | self includes: e ]).
	shouldExecute := false.
	wasExecuted := true
]

{ #category : #'as yet unclassified' }
SeaQueNode >> explode: anObject [
	^ SeaGraDataNode data: anObject
]

{ #category : #testing }
SeaQueNode >> includes: anObject [
	^ wasExecuted not or: [ results includes: anObject ]
]

{ #category : #'as yet unclassified' }
SeaQueNode >> initialize [
	super initialize.
	self initializeTConstraint.
	filter := #objects
]

{ #category : #initialization }
SeaQueNode >> initializeCollection: aCollection context: aContext [
	self assert: [ collection isNil ].
	self assert: [ context isNil ].
	collection := aCollection.
	context := aContext
]

{ #category : #initialization }
SeaQueNode >> initializeFilter: aBlock [
	self assert: [ filter isNil ].
	filter := aBlock
]

{ #category : #printing }
SeaQueNode >> printOn: aStream [
	super printOn: aStream.
	aStream
		lf;
		nextPutAll: collection name;
		lf;
		nextPutAll: 'cost: ';
		nextPutAll: self cost asString;
		lf;
		nextPutAll: 'results: ';
		nextPutAll: results size asString
]

{ #category : #testing }
SeaQueNode >> results [
	^ wasExecuted
		ifTrue: [ results ]
		ifFalse: [ results := filter value: collection ]
]

{ #category : #accessing }
SeaQueNode >> results: aCollection [
	results = aCollection
		ifFalse: [ self assert: [ aCollection allSatisfy: [ :e | self includes: e ] ].
			results := aCollection.
			self incoming , self outgoing do: [ :e | e shouldExecute: true ] ].
	wasExecuted := true.
	shouldExecute := false
]

{ #category : #'as yet unclassified' }
SeaQueNode >> | aString [
	filter := [ :c | (c indexedBy: #name) at: aString ifAbsent: [ IdentitySet new ] ]
]

{ #category : #'as yet unclassified' }
SeaQueNode >> ~ anObject [
	^ SeaQueOutgoingEdgeBuilder
		argument: anObject
		source: self
		optional: false
		context: context
]

{ #category : #'as yet unclassified' }
SeaQueNode >> ~? anObject [
	^ SeaQueOutgoingEdgeBuilder
		argument: anObject
		source: self
		optional: true
		context: context
]
