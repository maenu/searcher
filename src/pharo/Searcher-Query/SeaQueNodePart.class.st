Class {
	#name : #SeaQueNodePart,
	#superclass : #SeaQuePart,
	#category : #'Searcher-Query-Parts'
}

{ #category : #'as yet unclassified' }
SeaQueNodePart class >> object: anObject graphPart: aGraphPart [
	^ self new
		initializeObject: anObject graphPart: aGraphPart;
		yourself
]

{ #category : #copying }
SeaQueNodePart >> , anObject [
	^ graphPart , anObject
]

{ #category : #'as yet unclassified' }
SeaQueNodePart >> <~ anObject [
	^ graphPart
		incomingEdgePartFor: anObject
		nodePart: self
		targetOptional: false
]

{ #category : #'as yet unclassified' }
SeaQueNodePart >> <~? anObject [
	^ graphPart
		incomingEdgePartFor: anObject
		nodePart: self
		targetOptional: true
]

{ #category : #'as yet unclassified' }
SeaQueNodePart >> @ aString [
	^ graphPart at: aString put: self
]

{ #category : #compiling }
SeaQueNodePart >> compile [
	^ graphPart compile
]

{ #category : #compiling }
SeaQueNodePart >> compileForRemotePeer: aRemotePeer [
	^ graphPart compileForRemotePeer: aRemotePeer
]

{ #category : #'as yet unclassified' }
SeaQueNodePart >> ~ anObject [
	^ graphPart
		outgoingEdgePartFor: anObject
		nodePart: self
		sourceOptional: false
]

{ #category : #'as yet unclassified' }
SeaQueNodePart >> ~? anObject [
	^ graphPart
		outgoingEdgePartFor: anObject
		nodePart: self
		sourceOptional: true
]
