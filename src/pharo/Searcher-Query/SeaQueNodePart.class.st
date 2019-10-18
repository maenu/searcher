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

{ #category : #'as yet unclassified' }
SeaQueNodePart >> ! aString [
	^ graphPart at: aString put: self
]

{ #category : #copying }
SeaQueNodePart >> , anObject [
	^ graphPart , anObject
]

{ #category : #'as yet unclassified' }
SeaQueNodePart >> <~ anObject [
	^ graphPart incomingEdgePartFor: anObject nodePart: self
]

{ #category : #converting }
SeaQueNodePart >> asClassDescriptionNameNode [
	^ object seaQueIsIdentifier
		ifTrue: [ object
				seaQueAsVariableNodeWithResults: SeaQueClassDescriptionIndex instance all ]
		ifFalse: [ object seaQueAsClassDescriptionNameNode ]
]

{ #category : #converting }
SeaQueNodePart >> asCompiledMethodSelectorNode [
	^ object seaQueIsIdentifier
		ifTrue: [ object
				seaQueAsVariableNodeWithResults: SeaQueCompiledMethodIndex instance all ]
		ifFalse: [ object seaQueAsCompiledMethodSelectorNode ]
]

{ #category : #compiling }
SeaQueNodePart >> compile [
	^ graphPart compile
]

{ #category : #'as yet unclassified' }
SeaQueNodePart >> ~ anObject [
	^ graphPart outgoingEdgePartFor: anObject nodePart: self
]
