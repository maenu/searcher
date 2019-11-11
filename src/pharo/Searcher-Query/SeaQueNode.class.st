Class {
	#name : #SeaQueNode,
	#superclass : #SeaQueQuery,
	#traits : 'SeaGraTNode',
	#classTraits : 'SeaGraTNode classTrait',
	#instVars : [
		'collection'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueNode class >> collection: aCollection [
	^ self new
		initializeCollection: aCollection;
		yourself
]

{ #category : #accessing }
SeaQueNode >> collection [
	^ collection
]

{ #category : #'as yet unclassified' }
SeaQueNode >> cost_ [
	^ collection size
]

{ #category : #accessing }
SeaQueNode >> execute_ [
	self results: (self results select: [ :e | self includes: e ])
]

{ #category : #'as yet unclassified' }
SeaQueNode >> explode: anObject [
	^ SeaGraDataNode data: anObject
]

{ #category : #testing }
SeaQueNode >> includes: anObject [
	^ wasExecuted not or: [ results includes: anObject ]
]

{ #category : #initialization }
SeaQueNode >> initializeCollection: aCollection [
	self assert: [ collection isNil ].
	collection := aCollection
]

{ #category : #printing }
SeaQueNode >> printOn: aStream [
	aStream
		nextPutAll: collection class name;
		nextPutAll: ' ';
		nextPutAll: self cost asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]

{ #category : #testing }
SeaQueNode >> results [
	^ wasExecuted
		ifTrue: [ results ]
		ifFalse: [ results := collection objects ]
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
