Class {
	#name : #SeaQueEdgeTargetCollectStrategy,
	#superclass : #SeaQueEdgeStrategy,
	#category : #'Searcher-Query'
}

{ #category : #testing }
SeaQueEdgeTargetCollectStrategy >> canExecute [
	^ edge target shouldExecute not
]

{ #category : #'as yet unclassified' }
SeaQueEdgeTargetCollectStrategy >> cost [
	^ edge target cost
]

{ #category : #'as yet unclassified' }
SeaQueEdgeTargetCollectStrategy >> results [
	| source target |
	source := edge source.
	target := edge target.
	^ target results
		inject: IdentitySet new
		into: [ :r :e | 
			r
				addAll:
					(((block cull: e) select: [ :f | source includes: f ])
						collect: [ :f | f -> e ]);
				yourself ]
]
