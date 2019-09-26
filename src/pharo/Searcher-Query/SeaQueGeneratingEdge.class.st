Class {
	#name : #SeaQueGeneratingEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query'
}

{ #category : #testing }
SeaQueGeneratingEdge >> canExecute [
	^ source shouldExecute not
]

{ #category : #'as yet unclassified' }
SeaQueGeneratingEdge >> estimatedResultsSize_ [
	^ source estimatedResultsSize
]

{ #category : #accessing }
SeaQueGeneratingEdge >> executeSource: anObject [
	self subclassResponsibility
]

{ #category : #accessing }
SeaQueGeneratingEdge >> execute_ [
	| targetWasExecuted |
	targetWasExecuted := target wasExecuted.
	results := source results
		inject: IdentitySet new
		into: [ :r :e | 
			(self executeSource: e)
				do: [ :f | 
					(targetWasExecuted not or: [ target results includes: f ])
						ifTrue: [ r add: e -> f ] ].
			r ].
	source retainResultsIn: (results collect: #key).
	targetWasExecuted
		ifTrue: [ target retainResultsIn: (results collect: #value) ]
		ifFalse: [ target results: (results collect: #value) ]
]
