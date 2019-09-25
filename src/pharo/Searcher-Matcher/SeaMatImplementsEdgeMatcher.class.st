Class {
	#name : #SeaMatImplementsEdgeMatcher,
	#superclass : #SeaMatEdgeMatcher,
	#category : #'Searcher-Matcher'
}

{ #category : #testing }
SeaMatImplementsEdgeMatcher >> canMatch [
	^ edge source matcher isDirty not and: [ edge target matcher isDirty not ]
]

{ #category : #accessing }
SeaMatImplementsEdgeMatcher >> match [
	| sources targets old |
	self assert: [ self isDirty and: [ self canMatch ] ].
	sources := edge source matcher matches.
	targets := edge target matcher matches.
	matches := sources
		inject: IdentitySet new
		into: [ :r :e | 
			targets
				do: [ :f | 
					(e lookupSelector: f selector) == f
						ifTrue: [ r add: e -> f ] ].
			r ].
	old := sources size.
	sources removeAll: (sources copyWithoutAll: (matches collect: #key)).
	sources size = old
		ifFalse: [ edge source outgoing do: [ :e | e matcher makeDirty ] ].
	old := targets size.
	targets
		removeAll: (targets copyWithoutAll: (matches collect: #value)).
	targets size = old
		ifFalse: [ edge target outgoing do: [ :e | e matcher makeDirty ] ].
	dirty := false
]
