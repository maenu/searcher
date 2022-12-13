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
		initializeSource: aNode target: anotherNode;
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
SeaGraTEdge >> initializeSource: aNode target: anotherNode [
	self assert: [ source isNil and: [ target isNil ] ].
	source := aNode.
	target := anotherNode.
	aNode outgoing add: self.
	anotherNode incoming add: self
]

{ #category : #accessing }
SeaGraTEdge >> seaGraGtElement [
	^ BlParabollaArcElement new
		layout: BlFrameLayout new;
		zIndex: -1;
		clipChildren: false;
		curvatureFraction: 0.33;
		border: (BlBorder builder
				paint: self seaGraColor;
				width: 1;
				build);
		toHead: (BlArrowheadTriangle new
				scale: 2;
				border: (BlBorder builder
						paint: self seaGraColor;
						width: 1;
						build);
				background: self seaGraColor;
				yourself);
		addChild: (BrEditor new
				constraintsDo: [ :c | 
					c frame horizontal alignCenter.
					c frame vertical alignCenter ];
				beReadOnlyWithoutSelection;
				fitContent;
				aptitude: BrGlamorousEditorAptitude;
				text: self asString;
				when: BlClickEvent
					do: [ :e | 
						e consumed: true.
						e target phlow spawnObject: self ];
				yourself);
		yourself
]

{ #category : #accessing }
SeaGraTEdge >> source [
	^ source
]

{ #category : #accessing }
SeaGraTEdge >> target [
	^ target
]
