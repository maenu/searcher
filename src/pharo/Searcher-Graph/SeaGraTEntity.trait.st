Trait {
	#name : #SeaGraTEntity,
	#instVars : [
		'announcer'
	],
	#category : #'Searcher-Graph'
}

{ #category : #enumerating }
SeaGraTEntity >> allEdges [
	^ self allNodes flatCollect: #outgoing
]

{ #category : #enumerating }
SeaGraTEntity >> allNodes [
	self explicitRequirement
]

{ #category : #accessing }
SeaGraTEntity >> announcer [
	^ announcer
]

{ #category : #initialization }
SeaGraTEntity >> initializeTEntity [
	announcer := Announcer new
]

{ #category : #'as yet unclassified' }
SeaGraTEntity >> seaGraGtElementFor: aView [
	<gtView>
	^ aView explicit
		title: 'Element';
		priority: 1;
		stencil: [ self seaGraAsElement ];
		yourself
]
