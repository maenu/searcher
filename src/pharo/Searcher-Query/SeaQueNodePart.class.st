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
				seaQueAsVariableNode: SeaQueClassDescriptionCollection instance ]
		ifFalse: [ object seaQueAsClassDescriptionNameNode ]
]

{ #category : #converting }
SeaQueNodePart >> asCompiledMethodSelectorNode [
	^ object seaQueIsIdentifier
		ifTrue:
			[ object seaQueAsVariableNode: SeaQueCompiledMethodCollection instance ]
		ifFalse: [ object seaQueAsCompiledMethodSelectorNode ]
]

{ #category : #converting }
SeaQueNodePart >> asMetacelloProjectSpecNameNode [
	^ object seaQueIsIdentifier
		ifTrue: [ object
				seaQueAsVariableNode: SeaQueMetacelloProjectSpecCollection instance ]
		ifFalse: [ object seaQueAsMetacelloProjectSpecNameNode ]
]

{ #category : #converting }
SeaQueNodePart >> asRPackageNameNode [
	^ object seaQueIsIdentifier
		ifTrue: [ object seaQueAsVariableNode: SeaQueRPackageCollection instance ]
		ifFalse: [ object seaQueAsRPackageNameNode ]
]

{ #category : #compiling }
SeaQueNodePart >> compile [
	^ graphPart compile
]

{ #category : #'as yet unclassified' }
SeaQueNodePart >> ~ anObject [
	^ graphPart outgoingEdgePartFor: anObject nodePart: self
]
