Class {
	#name : #SeaQueNode,
	#superclass : #SeaQueQuery,
	#traits : 'SeaGraTNode',
	#classTraits : 'SeaGraTNode classTrait',
	#category : #'Searcher-Query'
}

{ #category : #testing }
SeaQueNode >> includes: anObject [
	self subclassResponsibility
]

{ #category : #accessing }
SeaQueNode >> results: aCollection [
	results = aCollection
		ifTrue: [ ^ self ].
	self assert: [ aCollection allSatisfy: [ :e | self includes: e ] ].
	results := aCollection.
	wasExecuted := true.
	self incoming , self outgoing do: [ :e | e shouldExecute: true ].
	shouldExecute := false
]
