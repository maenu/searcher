Extension { #name : #String }

{ #category : #'*Searcher-Query' }
String >> seaQueAsClassDescriptionNodeIn: aGraph [
	^ self seaQueIsVariableName
		ifTrue: [ self seaQueAsVariableNameNodeIn: aGraph ]
		ifFalse: [ (SeaQueClassDescriptionNameNode name: self)
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
String >> seaQueAsMethodSelectorNodeIn: aGraph [
	^ self seaQueIsVariableName
		ifTrue: [ self seaQueAsVariableNameNodeIn: aGraph ]
		ifFalse: [ (SeaQueMethodSelectorNode selector: self)
				graph: aGraph;
				yourself ]
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsNodeIn: aGraph [
	^ self seaQueAsVariableNameNodeIn: aGraph
]

{ #category : #'*Searcher-Query' }
String >> seaQueAsVariableNameNodeIn: aGraph [
	self assert: [ self seaQueIsVariableName ].
	^ aGraph variables
		at: self
		ifAbsentPut: [ (SeaQueVariableNameNode identifier: self)
				graph: aGraph;
				yourself ]
]

{ #category : #'*Searcher-Query' }
String >> seaQueIsVariableName [
	^ self size >= 2 and: [ self first = $@ ]
]
