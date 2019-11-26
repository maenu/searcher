Extension { #name : #String }

{ #category : #'*Searcher-Query-Moose' }
String >> seaQueMooAsEntityNodeIn: aContext [
	| collection |
	collection := aContext collectionAt: #entity.
	^ self seaQueIsIdentifier
		ifTrue: [ SeaQueVariableNode collection: collection ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: collection
				key: #name
				value: self ]
]
