Class {
	#name : #SeaQueReducingEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query'
}

{ #category : #testing }
SeaQueReducingEdge >> canExecute [
	^ source shouldExecute not and: [ target shouldExecute not ]
]

{ #category : #testing }
SeaQueReducingEdge >> canExecuteSource: anObject target: anotherObject [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SeaQueReducingEdge >> estimatedResultsSize_ [
	^ source estimatedResultsSize * target estimatedResultsSize
]

{ #category : #accessing }
SeaQueReducingEdge >> execute_ [
	results := source results
		inject: IdentitySet new
		into: [ :r :e | 
			target results
				do: [ :f | 
					(self canExecuteSource: e target: f)
						ifTrue: [ r add: e -> f ] ].
			r ].
	source retainResultsIn: (results collect: #key).
	target retainResultsIn: (results collect: #value)
]
