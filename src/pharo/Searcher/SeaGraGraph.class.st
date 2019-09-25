Class {
	#name : #SeaGraGraph,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'edges'
	],
	#category : #'Searcher-Graph'
}

{ #category : #'as yet unclassified' }
SeaGraGraph class >> nodes: aSet edges: anotherSet [
	^ self new
		nodes: aSet edges: anotherSet;
		yourself
]

{ #category : #accessing }
SeaGraGraph >> edges [
	^ edges
]

{ #category : #accessing }
SeaGraGraph >> nodes [
	^ nodes
]

{ #category : #'as yet unclassified' }
SeaGraGraph >> nodes: aSet edges: anotherSet [
	self
		assert: [ nodes isNil
				and: [ edges isNil
						and: [ aSet
								=
									(anotherSet
										flatCollect: [ :e | 
											{e source.
											e target} ]) ] ] ].
	nodes := aSet.
	edges := anotherSet
]

{ #category : #'as yet unclassified' }
SeaGraGraph >> seaGraGtGraphFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Graph';
		priority: 1;
		painting: [ :m | 
			m nodes
				stencil: [ :e | 
					BlElement new
						geometry: BlCircle new;
						size: 5 @ 5;
						background: Color black;
						yourself ];
				with: nodes.
			m edges
				fromNearestTightCircle;
				toNearestTightCircle;
				stencil: [ :e | 
					BlParabollaArcElement new
						curvatureFraction: 0.2;
						border: (BlBorder paint: (Color gray alpha: 0.2) width: 1);
						fromHead:
							(BlArrowheadSimpleArrow new
								arrowLengthFraction: 5;
								arrowNoseAngle: 60;
								border:
									(BlBorder builder
										paint: (Color gray alpha: 0.2);
										width: 1;
										build)) ];
				connect: edges from: #source to: #target.
			m layout tree ];
		yourself
]
