Class {
	#name : #SeaQueNode,
	#superclass : #SeaQueQuery,
	#traits : 'SeaGraTNode',
	#classTraits : 'SeaGraTNode classTrait',
	#instVars : [
		'context',
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

{ #category : #'as yet unclassified' }
SeaQueNode >> <~ anObject [
	^ SeaQueIncomingEdgePart object: anObject node: self context: context
]

{ #category : #accessing }
SeaQueNode >> context [
	^ context
]

{ #category : #accessing }
SeaQueNode >> context: anObject [
	context := anObject
]

{ #category : #accessing }
SeaQueNode >> identifier [
	^ identifier
]

{ #category : #accessing }
SeaQueNode >> identifier: anObject [
	self assert: [ identifier isNil ].
	identifier := anObject.
	context at: identifier put: self
]

{ #category : #initialization }
SeaQueNode >> initialize [
	super initialize.
	context := SeaQueContext new
]

{ #category : #testing }
SeaQueNode >> shouldExecute: aBoolean [
	(aBoolean and: [ shouldExecute not ])
		ifTrue: [ outgoing do: [ :e | e shouldExecute: aBoolean ] ].
	super shouldExecute: aBoolean
]

{ #category : #'as yet unclassified' }
SeaQueNode >> ~ anObject [
	^ SeaQueOutgoingEdgePart object: anObject node: self context: context
]
