Extension { #name : #String }

{ #category : #'*Searcher-Query' }
String >> seaQueAsClassDescriptionNameNode [
	^ SeaQueClassDescriptionNameNode name: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsCompiledMethodSelectorNode [
	^ SeaQueCompiledMethodSelectorNode selector: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsEdgeFactory [
	^ SeaQueEdge classForIdentifier: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsMetacelloProjectSpecNameNode [
	^ SeaQueMetacelloProjectSpecNameNode name: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsRPackageNameNode [
	^ SeaQueRPackageNameNode name: self
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsVariableNode [
	^ SeaQueVariableNode new
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsVariableNodeWithResults: aSet [
	^ self seaQueAsVariableNode
		results: aSet;
		yourself
]

{ #category : #'*Searcher-Query' }
String >> seaQueIsIdentifier [
	^ self size >= 2 and: [ self first = $@ ]
]
