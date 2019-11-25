Extension { #name : #String }

{ #category : #'*Searcher-Query-Image' }
String >> seaQueImaAsClassDescriptionNodeIn: aContext [
	^ self seaQueIsIdentifier
		ifTrue: [ self seaQueAsVariableNode: aContext classDescriptionCollection ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: aContext classDescriptionCollection
				key: #name
				value: self ]
]

{ #category : #'*Searcher-Query-Image' }
String >> seaQueImaAsCompiledMethodNodeIn: aContext [
	^ self seaQueIsIdentifier
		ifTrue: [ self seaQueAsVariableNode: aContext compiledMethodCollection ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: aContext compiledMethodCollection
				key: #selector
				value: self ]
]

{ #category : #'*Searcher-Query-Image' }
String >> seaQueImaAsMetacelloProjectSpecNodeIn: aContext [
	^ self seaQueIsIdentifier
		ifTrue:
			[ self seaQueAsVariableNode: aContext metacelloProjectSpecCollection ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: aContext metacelloProjectSpecCollection
				key: #name
				value: self ]
]

{ #category : #'*Searcher-Query-Image' }
String >> seaQueImaAsRPackageNodeIn: aContext [
	^ self seaQueIsIdentifier
		ifTrue: [ self seaQueAsVariableNode: aContext rPackageCollection ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: aContext rPackageCollection
				key: #name
				value: self ]
]
