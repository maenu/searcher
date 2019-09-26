Trait {
	#name : #SeaGraTEdge,
	#instVars : [
		'source',
		'target'
	],
	#category : #'Searcher-Graph'
}

{ #category : #accessing }
SeaGraTEdge classSide >> source: aNode target: anotherNode [
	^ self new
		source: aNode target: anotherNode;
		yourself
]

{ #category : #enumerating }
SeaGraTEdge >> allEdges [
	^ source allEdges
]

{ #category : #enumerating }
SeaGraTEdge >> allNodes [
	^ source allNodes
]

{ #category : #accessing }
SeaGraTEdge >> source [
	^ source
]

{ #category : #accessing }
SeaGraTEdge >> source: aNode target: anotherNode [
	self assert: [ source isNil and: [ target isNil ] ].
	source := aNode.
	target := anotherNode.
	aNode outgoing add: self.
	anotherNode incoming add: self
]

{ #category : #accessing }
SeaGraTEdge >> target [
	^ target
]
