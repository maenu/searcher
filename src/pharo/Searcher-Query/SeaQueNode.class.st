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

{ #category : #accessing }
SeaQueNode >> graph: aGraph [
	super graph: aGraph.
	identifier
		ifNotNil: [ self assert: [ (graph variables includesKey: identifier) not ].
			graph variables at: identifier put: self ].
	graph nodes add: self
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

{ #category : #testing }
SeaQueNode >> shouldExecute: aBoolean [
	(aBoolean and: [ shouldExecute not ])
		ifTrue: [ outgoing do: [ :e | e shouldExecute: aBoolean ] ].
	super shouldExecute: aBoolean
]
