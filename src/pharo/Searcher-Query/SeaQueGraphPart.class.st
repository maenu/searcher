Class {
	#name : #SeaQueGraphPart,
	#superclass : #Object,
	#instVars : [
		'nodeParts',
		'edgeParts',
		'variables'
	],
	#category : #'Searcher-Query-Parts'
}

{ #category : #adding }
SeaQueGraphPart >> , anObject [
	^ self nodePartFor: anObject
]

{ #category : #accessing }
SeaQueGraphPart >> at: aString put: aNodePart [
	self
		assert: [ aString seaQueIsIdentifier
				and: [ (variables includesKey: aString) not ] ].
	^ variables at: aString put: aNodePart
]

{ #category : #'as yet unclassified' }
SeaQueGraphPart >> incomingEdgePartFor: anObject nodePart: aNodePart targetOptional: aBoolean [
	^ edgeParts
		add:
			(SeaQueIncomingEdgePart
				object: anObject
				graphPart: self
				nodePart: aNodePart
				targetOptional: aBoolean)
]

{ #category : #initialization }
SeaQueGraphPart >> initialize [
	super initialize.
	nodeParts := Set new.
	edgeParts := Set new.
	variables := Dictionary new
]

{ #category : #adding }
SeaQueGraphPart >> nodePartFor: anObject [
	^ (anObject seaQueIsIdentifier
		and: [ variables includesKey: anObject ])
		ifTrue: [ variables at: anObject ]
		ifFalse: [ | nodePart |
			nodePart := nodeParts
				add: (SeaQueNodePart object: anObject graphPart: self).
			anObject seaQueIsIdentifier
				ifTrue: [ variables at: anObject put: nodePart ].
			nodePart ]
]

{ #category : #'as yet unclassified' }
SeaQueGraphPart >> outgoingEdgePartFor: anObject nodePart: aNodePart sourceOptional: aBoolean [
	^ edgeParts
		add:
			(SeaQueOutgoingEdgePart
				object: anObject
				graphPart: self
				nodePart: aNodePart
				sourceOptional: aBoolean)
]
