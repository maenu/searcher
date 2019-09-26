Class {
	#name : #SeaQueNode,
	#superclass : #SeaQueQuery,
	#traits : 'SeaGraTNode',
	#classTraits : 'SeaGraTNode classTrait',
	#instVars : [
		'identifier'
	],
	#category : #'Searcher-Query'
}

{ #category : #generated }
SeaQueNode class >> identifier: aString [
	^ self new
		identifier: aString;
		yourself
]

{ #category : #copying }
SeaQueNode >> , aNode [
	^ SeaQueGraph
		nodes:
			{self.
			aNode}
]

{ #category : #'as yet unclassified' }
SeaQueNode >> <~ anObject [
	^ SeaQueIncomingEdgePart object: anObject node: self
]

{ #category : #accessing }
SeaQueNode >> graph: aGraph [
	super graph: aGraph.
	identifier ifNotNil: [ graph at: identifier put: self ]
]

{ #category : #accessing }
SeaQueNode >> identifier [
	^ identifier
]

{ #category : #accessing }
SeaQueNode >> identifier: anObject [
	self assert: [ identifier isNil ].
	identifier := anObject
]

{ #category : #'as yet unclassified' }
SeaQueNode >> seaQueAsNodeIn: aGraph [
	^ self
		graph: aGraph;
		yourself
]

{ #category : #testing }
SeaQueNode >> shouldExecute: aBoolean [
	(aBoolean and: [ shouldExecute not ])
		ifTrue: [ outgoing do: [ :e | e shouldExecute: aBoolean ] ].
	super shouldExecute: aBoolean
]

{ #category : #'as yet unclassified' }
SeaQueNode >> ~ anObject [
	^ SeaQueOutgoingEdgePart object: anObject node: self
]
