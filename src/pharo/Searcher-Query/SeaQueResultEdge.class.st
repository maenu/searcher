Class {
	#name : #SeaQueResultEdge,
	#superclass : #Object,
	#traits : 'SeaGraTEdge',
	#classTraits : 'SeaGraTEdge classTrait',
	#instVars : [
		'identifier'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueResultEdge class >> source: aNode target: anotherNode identifier: aString [
	^ (self source: aNode target: anotherNode)
		initializeIdentifier: aString;
		yourself
]

{ #category : #accessing }
SeaQueResultEdge >> identifier [
	^ identifier
]

{ #category : #initialization }
SeaQueResultEdge >> initializeIdentifier: aString [
	self assert: [ identifier isNil ].
	identifier := aString
]
