Class {
	#name : #SeaMatCartesianEdgeMatcher,
	#superclass : #SeaMatEdgeMatcher,
	#category : #'Searcher-Matcher'
}

{ #category : #testing }
SeaMatCartesianEdgeMatcher >> canMatch [
	^ edge source matcher dirty not and: [ edge target matcher dirty not ]
]

{ #category : #testing }
SeaMatCartesianEdgeMatcher >> canMatchSource: anObject target: anotherObject [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SeaMatCartesianEdgeMatcher >> estimatedMatchesSize [
	^ edge source matcher estimatedMatchesSize
		* edge target matcher estimatedMatchesSize
]

{ #category : #accessing }
SeaMatCartesianEdgeMatcher >> match [
	| sources targets old |
	self assert: [ self dirty and: [ self canMatch ] ].
	sources := edge source matcher matches.
	targets := edge target matcher matches.
	matches := sources
		inject: IdentitySet new
		into: [ :r :e | 
			targets
				do: [ :f | 
					(self canMatchSource: e target: f)
						ifTrue: [ r add: e -> f ] ].
			r ].
	"assume sources and targets do not change until here"
	old := sources size.
	sources removeAll: (sources copyWithoutAll: (matches collect: #key)).
	sources size = old
		ifFalse: [ edge source outgoing do: [ :e | e matcher dirty: true ] ].
	old := targets size.
	targets
		removeAll: (targets copyWithoutAll: (matches collect: #value)).
	targets size = old
		ifFalse: [ edge target outgoing do: [ :e | e matcher dirty: true ] ].
	dirty := false
]
