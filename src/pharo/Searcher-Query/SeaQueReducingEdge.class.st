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
SeaQueReducingEdge >> estimatedResultsSize [
	^ source estimatedResultsSize * target estimatedResultsSize
]

{ #category : #accessing }
SeaQueReducingEdge >> execute [
	| sources targets old |
	self assert: [ self shouldExecute and: [ self canExecute ] ].
	sources := source results.
	targets := target results.
	results := sources
		inject: IdentitySet new
		into: [ :r :e | 
			targets
				do: [ :f | 
					(self canExecuteSource: e target: f)
						ifTrue: [ r add: e -> f ] ].
			r ].
	"assume sources and targets do not change until here"
	old := sources size.
	sources removeAll: (sources copyWithoutAll: (results collect: #key)).
	sources size = old
		ifFalse: [ source outgoing do: [ :e | e shouldExecute: true ] ].
	old := targets size.
	targets
		removeAll: (targets copyWithoutAll: (results collect: #value)).
	targets size = old
		ifFalse: [ target outgoing do: [ :e | e shouldExecute: true ] ].
	shouldExecute := false
]
