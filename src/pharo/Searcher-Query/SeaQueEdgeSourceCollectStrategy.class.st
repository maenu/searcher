Class {
	#name : #SeaQueEdgeSourceCollectStrategy,
	#superclass : #SeaQueEdgeStrategy,
	#category : #'Searcher-Query'
}

{ #category : #testing }
SeaQueEdgeSourceCollectStrategy >> canExecute [
	^ edge source shouldExecute not
]

{ #category : #'as yet unclassified' }
SeaQueEdgeSourceCollectStrategy >> cost [
	self flag: 'TODO 10 is arbitrary, better estimate?'.
	^ edge source cost * 10
]

{ #category : #'as yet unclassified' }
SeaQueEdgeSourceCollectStrategy >> results [
	| source target |
	source := edge source.
	target := edge target.
	^ source results
		inject: IdentitySet new
		into: [ :r :e | 
			r
				addAll:
					(((block cull: e) select: [ :f | target includes: f ])
						collect: [ :f | e -> f ]);
				yourself ]
]
