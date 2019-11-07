Trait {
	#name : #SeaGraTNode,
	#instVars : [
		'incoming',
		'outgoing'
	],
	#category : #'Searcher-Graph'
}

{ #category : #enumerating }
SeaGraTNode >> allEdges [
	^ self allNodes flatCollect: #outgoing
]

{ #category : #enumerating }
SeaGraTNode >> allNodes [
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

{ #category : #accessing }
SeaGraTNode >> incoming [
	^ incoming
		ifNil: [ incoming := (CollectionValueHolder value: Set new)
				whenAddedDo: [ :e | self assert: [ e target == self ] ];
				yourself ]
]

{ #category : #accessing }
SeaGraTNode >> outgoing [
	^ outgoing
		ifNil: [ outgoing := (CollectionValueHolder value: Set new)
				whenAddedDo: [ :e | self assert: [ e source == self ] ];
				yourself ]
]

{ #category : #'as yet unclassified' }
SeaGraTNode >> seaGraGtGraphFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Graph';
		priority: 1;
		painting: [ :m | 
			| nodes edges |
			nodes := self allNodes.
			edges := self allEdges.
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
						toHead:
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
