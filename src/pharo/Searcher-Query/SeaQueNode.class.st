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

{ #category : #accessing }
SeaQueNode >> results: aCollection [
	self assert: [ wasExecuted not and: [ results isEmpty ] ].
	results addAll: aCollection.
	self shouldExecute: true.
	shouldExecute := false.
	"setting results acts as execution"
	wasExecuted := true
]

{ #category : #accessing }
SeaQueNode >> retainResultsIn: aCollection [
	| changed |
	self
		assert:
			[ shouldExecute not and: [ (aCollection difference: results) isEmpty ] ].
	changed := false.
	results copy
		do: [ :e | 
			(aCollection includes: e)
				ifFalse: [ changed := true.
					results remove: e ] ].
	changed
		ifTrue: [ self shouldExecute: true.
			shouldExecute := false ]
]

{ #category : #testing }
SeaQueNode >> shouldExecute: aBoolean [
	(aBoolean and: [ shouldExecute not ])
		ifTrue:
			[ self incoming , self outgoing do: [ :e | e shouldExecute: aBoolean ] ].
	super shouldExecute: aBoolean
]
