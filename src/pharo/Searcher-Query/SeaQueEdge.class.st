Class {
	#name : #SeaQueEdge,
	#superclass : #SeaQueQuery,
	#traits : 'SeaGraTEdge',
	#classTraits : 'SeaGraTEdge classTrait',
	#instVars : [
		'strategies',
		'optional'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueEdge class >> classForIdentifier: aString [
	| edgeClasses |
	edgeClasses := SeaQueEdge allSubclasses
		select: [ :e | 
			(e class includesSelector: #identifier)
				and: [ e identifier = aString ] ].
	self assert: [ edgeClasses size = 1 ].
	^ edgeClasses anyOne
]

{ #category : #compiling }
SeaQueEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext optional: aBoolean [
	self subclassResponsibility
]

{ #category : #accessing }
SeaQueEdge class >> identifier [
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
	self cheapestCanExecuteStrategy execute: optional
]

{ #category : #'as yet unclassified' }
SeaQueEdge >> explodeSource: aNode target: anotherNode [
	^ SeaGraDataEdge
		source: aNode
		target: anotherNode
		data: self class identifier
]

{ #category : #initialization }
SeaQueEdge >> initialize [
	super initialize.
	strategies := OrderedCollection new
]

{ #category : #accessing }
SeaQueEdge >> initializeOptional: aBoolean [
	self assert: [ optional isNil ].
	optional := aBoolean
]

{ #category : #printing }
SeaQueEdge >> printOn: aStream [
	aStream
		nextPutAll: self class identifier;
		nextPutAll: ' ';
		nextPutAll: self cost asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]

{ #category : #accessing }
SeaQueEdge >> results: aCollection [
	results := aCollection
]
