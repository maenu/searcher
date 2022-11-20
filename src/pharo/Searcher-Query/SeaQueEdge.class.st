Class {
	#name : #SeaQueEdge,
	#superclass : #Object,
	#traits : 'SeaGraTEdge + SeaQueTConstraint',
	#classTraits : 'SeaGraTEdge classTrait + SeaQueTConstraint classTrait',
	#instVars : [
		'strategies',
		'sourceOptional',
		'targetOptional'
	],
	#category : #'Searcher-Query'
}

{ #category : #compiling }
SeaQueEdge class >> compileSource: aNodePart optional: aBoolean target: anotherNodePart optional: anotherBoolean in: aContext [
	self subclassResponsibility
]

{ #category : #compiling }
SeaQueEdge class >> source: aNode optional: aBoolean target: anotherNode optional: anotherBoolean strategies: aCollection [
	^ self new
		initializeSource: aNode target: anotherNode;
		initializeSourceOptional: aBoolean
			targetOptional: anotherBoolean
			strategies: aCollection;
		yourself
]

{ #category : #accessing }
SeaQueEdge class >> source: aNode target: anotherNode [
	^ self new
		initializeSource: aNode target: anotherNode;
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

{ #category : #'as yet unclassified' }
SeaQueEdge >> cost_ [
	^ self cheapestCanExecuteStrategy cost
]

{ #category : #accessing }
SeaQueEdge >> execute_ [
	self cheapestCanExecuteStrategy execute
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
	aStream
		nextPutAll: self class name;
		nextPutAll: ' ';
		nextPutAll:
			(strategies
				detect: #canExecute
				ifFound: [ self cost asString ]
				ifNone: '(cannot execute)');
		nextPutAll: ' ';
		nextPutAll: results size asString
]

{ #category : #accessing }
SeaQueEdge >> results: aCollection [
	results := aCollection
]

{ #category : #accessing }
SeaQueEdge >> sourceOptional [
	^ sourceOptional
]

{ #category : #accessing }
SeaQueEdge >> targetOptional [
	^ targetOptional
]
