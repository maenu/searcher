Class {
	#name : #SeaQueMatchNode,
	#superclass : #SeaQueNode,
	#instVars : [
		'block'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueMatchNode class >> collection: aCollection block: aBlock [
	^ (self collection: aCollection)
		initializeBlock: aBlock;
		yourself
]

{ #category : #'as yet unclassified' }
SeaQueMatchNode >> cost_ [
	self flag: 'TODO 10 is random'.
	^ collection size / 10
]

{ #category : #accessing }
SeaQueMatchNode >> execute_ [
	self results: self matchingNodes
]

{ #category : #testing }
SeaQueMatchNode >> includes: anObject [
	^ (self matchingNodes includes: anObject)
		and: [ super includes: anObject ]
]

{ #category : #initialization }
SeaQueMatchNode >> initializeBlock: aBlock [
	self assert: [ block isNil ].
	block := aBlock
]

{ #category : #accessing }
SeaQueMatchNode >> matchingNodes [
	^ collection objects select: block
]

{ #category : #printing }
SeaQueMatchNode >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' '.
	block printOn: aStream
]
