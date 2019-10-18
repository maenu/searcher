Class {
	#name : #SeaQueNode,
	#superclass : #SeaQueQuery,
	#traits : 'SeaGraTNode',
	#classTraits : 'SeaGraTNode classTrait',
	#category : #'Searcher-Query'
}

{ #category : #generated }
SeaQueNode class >> identifier: aString [
	^ self new
		identifier: aString;
		yourself
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
