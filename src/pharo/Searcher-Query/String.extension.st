Extension { #name : #String }

{ #category : #'*Searcher-Query' }
String >> seaQueAsClassDescriptionNodeIn: aContext [
	^ self seaQueIsIdentifier
		ifTrue: [ self seaQueAsVariableNode: aContext classDescriptionCollection ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: aContext classDescriptionCollection
				key: #name
				value: self ]
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsCompiledMethodNodeIn: aContext [
	^ self seaQueIsIdentifier
		ifTrue: [ self seaQueAsVariableNode: aContext compiledMethodCollection ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: aContext compiledMethodCollection
				key: #selector
				value: self ]
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsEdgeFactory [
	^ SeaQueEdge classForIdentifier: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsMetacelloProjectSpecNodeIn: aContext [
	^ self seaQueIsIdentifier
		ifTrue:
			[ self seaQueAsVariableNode: aContext metacelloProjectSpecCollection ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: aContext metacelloProjectSpecCollection
				key: #name
				value: self ]
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsRPackageNodeIn: aContext [
	^ self seaQueIsIdentifier
		ifTrue: [ self seaQueAsVariableNode: aContext rPackageCollection ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: aContext rPackageCollection
				key: #name
				value: self ]
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsVariableNode: aCollection [
	^ SeaQueVariableNode collection: aCollection
]

{ #category : #'*Searcher-Query' }
String >> seaQueIsIdentifier [
	^ self size >= 2 and: [ self first = $@ ]
]
