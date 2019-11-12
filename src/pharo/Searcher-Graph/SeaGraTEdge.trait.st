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
		initializeWithSource: aNode target: anotherNode;
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
SeaGraTEdge >> initializeWithSource: aNode target: anotherNode [
	self assert: [ source isNil and: [ target isNil ] ].
	source := aNode.
	target := anotherNode.
	aNode outgoing add: self.
	anotherNode incoming add: self
]

{ #category : #'as yet unclassified' }
SeaGraTEdge >> seaGraGtElement [
	^ BlParabollaArcElement new
		curvatureFraction: 0.2;
		border: (BlBorder paint: (Color gray alpha: 0.2) width: 1);
		toHead:
			(BlArrowheadSimpleArrow new
				arrowLengthFraction: 5;
				arrowNoseAngle: 60;
				border:
					(BlBorder builder
						paint: (Color gray alpha: 0.2);
						width: 1;
						build))
]

{ #category : #accessing }
SeaGraTEdge >> source [
	^ source
]

{ #category : #accessing }
SeaGraTEdge >> target [
	^ target
]
