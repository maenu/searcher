Class {
	#name : #SeaGraEdiDistance,
	#superclass : #Object,
	#instVars : [
		'source',
		'target'
	],
	#category : #'Searcher-Graph-Edit'
}

{ #category : #accessing }
SeaGraEdiDistance class >> source: aGraph target: anotherGraph [
	^ self new
		initializeSource: aGraph target: anotherGraph;
		yourself
]

{ #category : #'as yet unclassified' }
SeaGraEdiDistance >> bestFrom: aSet [
	| path |
	path := ((aSet
		collect: [ :e | e -> (e cost + (self costHeuristicLeaf: e)) ])
		sorted: [ :a :b | a value < b value ]) first key.
	^ aSet remove: path
]

{ #category : #building }
SeaGraEdiDistance >> compute [
	| open u1 p |
	open := Set new.
	u1 := source nodes anyOne.
	target nodes
		do: [ :e | 
			open
				add:
					(SeaGraEdiPath new
						add: (self newReplaceNode: u1 replacement: e);
						yourself) ].
	open
		add:
			(SeaGraEdiPath new
				add: (self newRemoveNode: u1);
				yourself).
	p := self bestFrom: open.
	[ self isComplete: p ]
		whileFalse: [ | targets |
			targets := target nodes copyWithoutAll: p targets.
			p size < source nodes size
				ifTrue: [ | next |
					next := (source nodes copyWithoutAll: p sources) anyOne.
					targets
						do:
							[ :e | open add: (p copyWith: (self newReplaceNode: next replacement: e)) ].
					open add: (p copyWith: (self newRemoveNode: next)) ]
				ifFalse: [ open
						add: (p copyWithAll: (targets collect: [ :e | self newAddNode: e ])) ].
			p := self bestFrom: open ].
	^ p
]

{ #category : #'instance creation' }
SeaGraEdiDistance >> costAddNode: aNode [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SeaGraEdiDistance >> costHeuristicLeaf: aPath [
	self subclassResponsibility
]

{ #category : #'instance creation' }
SeaGraEdiDistance >> costRemoveNode: aNode [
	self subclassResponsibility
]

{ #category : #'instance creation' }
SeaGraEdiDistance >> costReplaceNode: aNode replacement: anotherNode [
	self subclassResponsibility
]

{ #category : #initialization }
SeaGraEdiDistance >> initializeSource: aGraph target: anotherGraph [
	self assert: [ source isNil ].
	self assert: [ target isNil ].
	source := aGraph.
	target := anotherGraph
]

{ #category : #testing }
SeaGraEdiDistance >> isComplete: aPath [
	^ aPath targets size = target nodes size
]

{ #category : #'instance creation' }
SeaGraEdiDistance >> newAddNode: aNode [
	^ SeaGraEdiNodeAddOperation
		node: aNode
		cost: (self costAddNode: aNode)
]

{ #category : #'instance creation' }
SeaGraEdiDistance >> newRemoveNode: aNode [
	^ SeaGraEdiNodeRemoveOperation
		node: aNode
		cost: (self costRemoveNode: aNode)
]

{ #category : #'instance creation' }
SeaGraEdiDistance >> newReplaceNode: aNode replacement: anotherNode [
	^ SeaGraEdiNodeReplaceOperation
		node: aNode
		replacement: anotherNode
		cost: (self costReplaceNode: aNode replacement: anotherNode)
]
