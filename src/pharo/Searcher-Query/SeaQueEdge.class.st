Class {
	#name : #SeaQueEdge,
	#superclass : #SeaQueQuery,
	#traits : 'SeaGraTEdge',
	#classTraits : 'SeaGraTEdge classTrait',
	#instVars : [
		'strategies',
		'sourceOptional',
		'targetOptional'
	],
	#category : #'Searcher-Query'
}

{ #category : #compiling }
SeaQueEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext sourceOptional: aBoolean targetOptional: anotherBoolean [
	self subclassResponsibility
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

{ #category : #'as yet unclassified' }
SeaQueEdge >> cost_ [
	^ self cheapestCanExecuteStrategy cost
]

{ #category : #accessing }
SeaQueEdge >> execute_ [
	self cheapestCanExecuteStrategy
		executeSourceOptional: sourceOptional
		targetOptional: targetOptional
]

{ #category : #'as yet unclassified' }
SeaQueEdge >> explode: anObject with: aDictionary [
	^ SeaGraDataEdge
		source: (aDictionary at: anObject key)
		target: (aDictionary at: anObject value)
		data: anObject
]

{ #category : #initialization }
SeaQueEdge >> initialize [
	super initialize.
	strategies := OrderedCollection new
]

{ #category : #accessing }
SeaQueEdge >> initializeSourceOptional: aBoolean targetOptional: anotherBoolean [
	self assert: [ sourceOptional isNil ].
	self assert: [ targetOptional isNil ].
	sourceOptional := aBoolean.
	targetOptional := anotherBoolean
]

{ #category : #printing }
SeaQueEdge >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: ' ';
		nextPutAll: self cost asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]

{ #category : #accessing }
SeaQueEdge >> results: aCollection [
	results := aCollection
]
