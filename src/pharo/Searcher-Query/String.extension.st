Extension { #name : #String }

{ #category : #'*Searcher-Query' }
String >> seaQueAsClassDescriptionNameNode [
	^ SeaQueMatchByPropertyNode
		collection: SeaQueClassDescriptionCollection instance
		key: #name
		value: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsCompiledMethodSelectorNode [
	^ SeaQueMatchByPropertyNode
		collection: SeaQueCompiledMethodCollection instance
		key: #selector
		value: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsEdgeFactory [
	^ SeaQueEdge classForIdentifier: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsMetacelloProjectSpecNameNode [
	^ SeaQueMatchByPropertyNode
		collection: SeaQueMetacelloProjectSpecCollection instance
		key: #name
		value: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsRPackageNameNode [
	^ SeaQueMatchByPropertyNode
		collection: SeaQueRPackageCollection instance
		key: #name
		value: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsVariableNode: aCollection [
	^ SeaQueVariableNode collection: aCollection
]

{ #category : #'*Searcher-Query' }
String >> seaQueIsIdentifier [
	^ self size >= 2 and: [ self first = $@ ]
]
