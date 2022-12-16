Class {
	#name : #SeaQueEdge,
	#superclass : #SeaGraDataEdge,
	#traits : 'SeaQueTConstraint',
	#classTraits : 'SeaQueTConstraint classTrait',
	#instVars : [
		'strategies',
		'sourceOptional',
		'targetOptional'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueEdge class >> source: aNode optional: aBoolean target: anotherNode optional: anotherBoolean data: anObject strategies: aCollection [
	^ self new
		initializeSource: aNode target: anotherNode;
		initializeSourceOptional: aBoolean
			targetOptional: anotherBoolean
			strategies: aCollection;
		data: anObject;
		yourself
]

{ #category : #testing }
SeaQueEdge >> canExecute [
	^ strategies anySatisfy: #canExecute
]

{ #category : #'as yet unclassified' }
SeaQueEdge >> cheapestCanExecuteStrategy [
	^ ((strategies select: #canExecute)
		sorted: [ :a :b | a cost < b cost ]) first
]

{ #category : #accessing }
SeaQueEdge >> cost [
	^ wasExecuted
		ifTrue: [ results size ]
		ifFalse: [ self cheapestCanExecuteStrategy cost ]
]

{ #category : #initialization }
SeaQueEdge >> initialize [
	super initialize.
	self initializeTConstraint
]

{ #category : #accessing }
SeaQueEdge >> initializeSourceOptional: aBoolean targetOptional: anotherBoolean strategies: aCollection [
	self assert: [ sourceOptional isNil ].
	self assert: [ targetOptional isNil ].
	self assert: [ strategies isNil ].
	sourceOptional := aBoolean.
	targetOptional := anotherBoolean.
	strategies := aCollection.
	strategies do: [ :e | e initializeEdge: self ]
]

{ #category : #printing }
SeaQueEdge >> printOn: aStream [
	super printOn: aStream.
	aStream
		lf;
		nextPutAll: 'cost: ';
		nextPutAll: (self canExecute ifTrue: [ self cost asString ] ifFalse: 'cannot execute');
		lf;
		nextPutAll: 'results: ';
		nextPutAll: results size asString
]

{ #category : #accessing }
SeaQueEdge >> privateExecute [
	self cheapestCanExecuteStrategy execute
]

{ #category : #accessing }
SeaQueEdge >> results: aCollection [
	results := aCollection.
	announcer announce: SeaGraChanged new
]

{ #category : #accessing }
SeaQueEdge >> sourceOptional [
	^ sourceOptional
]

{ #category : #accessing }
SeaQueEdge >> targetOptional [
	^ targetOptional
]
