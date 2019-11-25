Extension { #name : #String }

{ #category : #'*Searcher-Query-Image' }
String >> seaQueImaAsClassDescriptionNodeIn: aContext [
	| collection |
	collection := aContext collectionAt: #classDescription.
	^ self seaQueIsIdentifier
		ifTrue: [ SeaQueVariableNode collection: collection ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: collection
				key: #name
				value: self ]
]

{ #category : #'*Searcher-Query-Image' }
String >> seaQueImaAsCompiledMethodNodeIn: aContext [
	| collection |
	collection := aContext collectionAt: #compiledMethod.
	^ self seaQueIsIdentifier
		ifTrue: [ SeaQueVariableNode collection: collection ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: collection
				key: #selector
				value: self ]
]

{ #category : #'*Searcher-Query-Image' }
String >> seaQueImaAsMetacelloProjectSpecNodeIn: aContext [
	| collection |
	collection := aContext collectionAt: #metacelloProjectSpec.
	^ self seaQueIsIdentifier
		ifTrue: [ SeaQueVariableNode collection: collection ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: collection
				key: #name
				value: self ]
]

{ #category : #'*Searcher-Query-Image' }
String >> seaQueImaAsRPackageNodeIn: aContext [
	| collection |
	collection := aContext collectionAt: #rPackage.
	^ self seaQueIsIdentifier
		ifTrue: [ SeaQueVariableNode collection: collection ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: collection
				key: #name
				value: self ]
]
