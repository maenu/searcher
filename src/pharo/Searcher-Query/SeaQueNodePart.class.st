Class {
	#name : #SeaQueNodePart,
	#superclass : #Object,
	#instVars : [
		'object',
		'graph',
		'node',
		'identifier'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueNodePart class >> object: anObject graph: aGraph [
	^ self new
		object: anObject graph: aGraph;
		yourself
]

{ #category : #'as yet unclassified' }
SeaQueNodePart >> ! anObject [
	self assert: [ object isNotNil ].
	identifier := anObject.
	^ self
]

{ #category : #copying }
SeaQueNodePart >> , anObject [
	^ graph , anObject
]

{ #category : #'as yet unclassified' }
SeaQueNodePart >> <~ anObject [
	^ SeaQueIncomingEdgePart nodePart: self edgeObject: anObject
]

{ #category : #accessing }
SeaQueNodePart >> graph [
	^ graph
]

{ #category : #accessing }
SeaQueNodePart >> node [
	^ self
		nodeOrPut: [ :e | "fallback to non-contextual node" object seaQueAsNodeFromPart: e ]
]

{ #category : #accessing }
SeaQueNodePart >> nodeOrPut: aBlock [
	^ node ifNil: [ node := aBlock value: self ]
]

{ #category : #'as yet unclassified' }
SeaQueNodePart >> object: anObject graph: aGraph [
	self
		assert: [ object isNil
				and: [ graph isNil and: [ node isNil and: [ identifier isNil ] ] ] ].
	object := anObject.
	graph := aGraph
]

{ #category : #'as yet unclassified' }
SeaQueNodePart >> ~ anObject [
	^ SeaQueOutgoingEdgePart nodePart: self edgeObject: anObject
]
