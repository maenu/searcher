Trait {
	#name : #SeaGraTEdge,
	#instVars : [
		'source',
		'target'
	],
	#traits : 'SeaGraTEntity',
	#classTraits : 'SeaGraTEntity classTrait',
	#category : #'Searcher-Graph'
}

{ #category : #accessing }
SeaGraTEdge classSide >> source: aNode target: anotherNode [
	^ self new
		initializeSource: aNode target: anotherNode;
		yourself
]

{ #category : #enumerating }
SeaGraTEdge >> allNodes [
	^ source allNodes
]

{ #category : #accessing }
SeaGraTEdge >> initializeSource: aNode target: anotherNode [
	self assert: [ source isNil ].
	self assert: [ target isNil ].
	self initializeTEntity.
	source := aNode.
	target := anotherNode.
	aNode outgoing add: self.
	anotherNode incoming add: self
]

{ #category : #accessing }
SeaGraTEdge >> seaGraAsElement [
	| element |
	element := BlParabollaArcElement new
			layout: BlFrameLayout new;
			zIndex: -1;
			clipChildren: false;
			curvatureFraction: 0.25;
			border: self seaGraAsColor;
			toHead: (BlArrowheadTriangle new
					scale: 4;
					border: self seaGraAsColor;
					background: self seaGraAsColor;
					yourself);
			addChild: (BrEditor new
					constraintsDo: [ :c | 
						c maxWidth: 200.
						c maxHeight: 200.
						c horizontal fitContent.
						c vertical fitContent.
						c frame horizontal alignCenter.
						c frame vertical alignCenter ];
					beReadOnlyWithoutSelection;
					aptitude: BrGlamorousEditorAptitude;
					text: self seaGraAsString;
					when: BlClickEvent
						do: [ :e | 
							e consumed: true.
							e target phlow spawnObject: self ];
					yourself);
			yourself.
	announcer
		when: SeaGraChanged
		do: [ element border: self seaGraAsColor.
			element children last text: self seaGraAsString.
			element toHead
				border: self seaGraAsColor;
				background: self seaGraAsColor ].
	^ element
]

{ #category : #accessing }
SeaGraTEdge >> source [
	^ source
]

{ #category : #accessing }
SeaGraTEdge >> target [
	^ target
]
