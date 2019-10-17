Extension { #name : #String }

{ #category : #'*Searcher-Query' }
String >> seaQueAsClassDescriptionNodeFromPart: aGraph [
	^ self seaQueIsIdentifier
		ifTrue: [ self seaQueAsVariableNodeFromPart: aGraph ]
		ifFalse: [ (SeaQueClassDescriptionNameNode name: self)
				graph: aGraph;
				yourself ]
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsCompiledMethodSelectorNodeFromPart: aGraph [
	^ self seaQueIsIdentifier
		ifTrue: [ self seaQueAsVariableNodeFromPart: aGraph ]
		ifFalse: [ (SeaQueCompiledMethodSelectorNode selector: self)
				graph: aGraph;
				yourself ]
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsEdgeSourcePart: aNodePart targetPart: anotherNodePart [
	| edgeClasses |
	edgeClasses := SeaQueEdge allSubclasses
		select:
			[ :e | (e class includesSelector: #identifier) and: [ e identifier = self ] ].
	self assert: [ edgeClasses size = 1 ].
	^ edgeClasses first sourcePart: aNodePart targetPart: anotherNodePart
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsIdentifier [
	self assert: [ self seaQueIsIdentifier ].
	^ self
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsNodeFromPart: aGraph [
	^ self seaQueAsVariableNodeFromPart: aGraph
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsVariableNodeFromPart: aGraph [
	| identifier |
	identifier := self seaQueAsIdentifier.
	^ aGraph variables
		at: identifier
		ifAbsentPut: [ (SeaQueVariableNode identifier: identifier)
				graph: aGraph;
				yourself ]
]

{ #category : #'*Searcher-Query' }
String >> seaQueIsIdentifier [
	^ self size >= 2 and: [ self first = $@ ]
]
