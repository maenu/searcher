Class {
	#name : #SeaQueNodePart,
	#superclass : #Object,
	#instVars : [
		'object',
		'graph',
		'node'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueNodePart class >> object: anObject graph: aGraph [
	^ self new
		object: anObject graph: aGraph;
		yourself
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
	^ node
		ifNil:
			[ "fallback to non-contextual node" node := object seaQueAsNodeIn: graph ]
]

{ #category : #accessing }
SeaQueNodePart >> node: anObject [
	self assert: [ node isNil ].
	node := anObject
]

{ #category : #accessing }
SeaQueNodePart >> nodeOrPut: aBlock [
	^ node ifNil: [ node := aBlock value: object ]
]

{ #category : #'as yet unclassified' }
SeaQueNodePart >> object: anObject graph: aGraph [
	self
		assert: [ object isNil and: [ graph isNil and: [ node isNil ] ] ].
	object := anObject.
	graph := aGraph
]

{ #category : #'as yet unclassified' }
SeaQueNodePart >> ~ anObject [
	^ SeaQueOutgoingEdgePart nodePart: self edgeObject: anObject
]
