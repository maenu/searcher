Class {
	#name : #SeaQueEdgeSourceTargetSelectStrategy,
	#superclass : #SeaQueEdgeStrategy,
	#category : #'Searcher-Query'
}

{ #category : #testing }
SeaQueEdgeSourceTargetSelectStrategy >> canExecute [
	^ edge source shouldExecute not and: [ edge target shouldExecute not ]
]

{ #category : #'as yet unclassified' }
SeaQueEdgeSourceTargetSelectStrategy >> cost [
	^ edge source cost * edge target cost
]

{ #category : #'as yet unclassified' }
SeaQueEdgeSourceTargetSelectStrategy >> results [
	| source target |
	'sourceTarget' logCr.
	source := edge source.
	target := edge target.
	^ source results
		inject: IdentitySet new
		into: [ :r :e | 
			r
				addAll:
					((target results select: [ :f | block cull: e cull: f ])
						collect: [ :f | e -> f ]);
				yourself ]
]
