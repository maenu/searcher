Class {
	#name : #SeaGraGraph,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'edges'
	],
	#category : #'Searcher-Graph'
}

{ #category : #accessing }
SeaGraGraph class >> nodes: aCollection [
	^ self new
		initializeNodes: aCollection asSet;
		yourself
]

{ #category : #accessing }
SeaGraGraph >> edges [
	^ edges
]

{ #category : #'as yet unclassified' }
SeaGraGraph >> gtInspectorGraphFor: aComposite [
	<gtInspectorPresentationOrder: 1>
	^ aComposite roassal2
		title: [ 'Graph' ];
		initializeView: [ | b |
			b := RTMondrian new.
			b shape circle
				size: 30;
				color: #seaGraColor.
			b nodes: nodes.
			b shape arrowedBezier
				color: (Color gray alpha: 0.5);
				withShorterDistanceAttachPoint.
			b edges connectToAll: [ :e | e outgoing collect: #target ].
			b layout forceWithCharge: -400.
			b ]
]

{ #category : #accessing }
SeaGraGraph >> initializeNodes: aSet [
	self assert: [ nodes isNil ].
	self assert: [ edges isNil ].
	nodes := aSet.
	edges := nodes flatCollect: [ :e | e incoming , e outgoing ]
]

{ #category : #accessing }
SeaGraGraph >> nodes [
	^ nodes
]

{ #category : #'as yet unclassified' }
SeaGraGraph >> seaGraGtGraphFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Graph';
		priority: 1;
		painting: [ :m | 
			m nodes
				stencil: [ :e | e seaGraGtElement ];
				with: nodes.
			m edges
				fromNearestTightCircle;
				toNearestTightCircle;
				stencil: [ :e | e seaGraGtElement ];
				connect: edges from: #source to: #target.
			m layout force ];
		yourself
]
