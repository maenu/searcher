Class {
	#name : #SeaGraNode,
	#superclass : #Object,
	#instVars : [
		'incoming',
		'outgoing'
	],
	#category : #'Searcher-Graph'
}

{ #category : #enumerating }
SeaGraNode >> allEdges [
	^ self allNodes flatCollect: #outgoing
]

{ #category : #enumerating }
SeaGraNode >> allNodes [
	| whites blacks |
	whites := Set with: self.
	blacks := Set new.
	[ whites isEmpty ]
		whileFalse: [ | gray |
			gray := whites remove: whites anyOne.
			blacks add: gray.
			whites
				addAll:
					((gray outgoing collect: #target) , (gray incoming collect: #source)
						copyWithoutAll: blacks) ].
	^ blacks
]

{ #category : #converting }
SeaGraNode >> asElement [
	^ BlElement new
		geometry: BlCircle new;
		size: 25 @ 25;
		background: Color black;
		yourself
]

{ #category : #converting }
SeaGraNode >> asGraph [
	^ SeaGraGraph nodes: self allNodes edges: self allEdges
]

{ #category : #accessing }
SeaGraNode >> incoming [
	^ incoming
]

{ #category : #initialization }
SeaGraNode >> initialize [
	super initialize.
	incoming := CollectionValueHolder value: Set new.
	outgoing := CollectionValueHolder value: Set new.
	incoming whenAddedDo: [ :e | self assert: [ e target == self ] ].
	outgoing whenAddedDo: [ :e | self assert: [ e source == self ] ]
]

{ #category : #accessing }
SeaGraNode >> outgoing [
	^ outgoing
]

{ #category : #'as yet unclassified' }
SeaGraNode >> seaGraGtGraphFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Graph';
		priority: 1;
		painting: [ :m | 
			| nodes edges |
			nodes := self allNodes.
			edges := nodes flatCollect: #outgoing.
			m nodes
				stencil: [ :e | 
					BlElement new
						geometry: BlCircle new;
						size: 5 @ 5;
						background:
							(e == self
								ifTrue: [ Color red ]
								ifFalse: [ Color black ]);
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
