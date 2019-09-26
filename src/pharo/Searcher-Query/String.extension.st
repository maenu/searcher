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
String >> seaQueAsEdgeSource: anObject target: anotherObject graph: aGraph [
	| edgeClasses |
	edgeClasses := SeaQueEdge allSubclasses
		select:
			[ :e | (e class includesSelector: #identifier) and: [ e identifier = self ] ].
	edgeClasses
		ifEmpty: [ Error signal: 'no edge class with identifier found' ].
	edgeClasses size > 1
		ifTrue: [ Error signal: 'more than one edge class with identifier found' ].
	^ edgeClasses first
		source: anObject
		target: anotherObject
		graph: aGraph
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
