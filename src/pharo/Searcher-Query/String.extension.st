Extension { #name : #String }

{ #category : #'*Searcher-Query' }
String >> seaQueAsClassDescriptionNode [
	^ self seaQueIsIdentifier
		ifTrue:
			[ self seaQueAsVariableNode: SeaQueClassDescriptionCollection instance ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: SeaQueClassDescriptionCollection instance
				key: #name
				value: self ]
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsCompiledMethodNode [
	^ self seaQueIsIdentifier
		ifTrue: [ self seaQueAsVariableNode: SeaQueCompiledMethodCollection instance ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: SeaQueCompiledMethodCollection instance
				key: #selector
				value: self ]
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsEdgeFactory [
	^ SeaQueEdge classForIdentifier: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsMetacelloProjectSpecNode [
	^ self seaQueIsIdentifier
		ifTrue: [ self
				seaQueAsVariableNode: SeaQueMetacelloProjectSpecCollection instance ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: SeaQueMetacelloProjectSpecCollection instance
				key: #name
				value: self ]
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsRPackageNode [
	^ self seaQueIsIdentifier
		ifTrue: [ self seaQueAsVariableNode: SeaQueRPackageCollection instance ]
		ifFalse: [ SeaQueMatchByPropertyNode
				collection: SeaQueRPackageCollection instance
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
