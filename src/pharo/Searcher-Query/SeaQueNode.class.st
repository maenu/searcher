Class {
	#name : #SeaQueNode,
	#superclass : #SeaQueQuery,
	#traits : 'SeaGraTNode',
	#classTraits : 'SeaGraTNode classTrait',
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueNode >> <~ anObject [
	^ SeaQueIncomingEdgePart object: anObject node: self
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
