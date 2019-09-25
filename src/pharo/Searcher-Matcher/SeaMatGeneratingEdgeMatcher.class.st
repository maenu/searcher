Class {
	#name : #SeaMatGeneratingEdgeMatcher,
	#superclass : #SeaMatEdgeMatcher,
	#category : #'Searcher-Matcher'
}

{ #category : #testing }
SeaMatGeneratingEdgeMatcher >> canMatch [
	^ edge source matcher dirty not
]

{ #category : #accessing }
SeaMatGeneratingEdgeMatcher >> canMatchSource: anObject [
	^ true
]

{ #category : #accessing }
SeaMatGeneratingEdgeMatcher >> match [
	| sources targets targetDirty old |
	self assert: [ self dirty and: [ self canMatch ] ].
	sources := edge source matcher matches.
	targets := edge target matcher matches.
	targetDirty := edge target dirty.
	matches := sources
		inject: IdentitySet new
		into: [ :r :e | 
			(self canMatchSource: e)
				ifTrue: [ (self matchSourceOrNil: e)
						ifNotNil: [ :f | 
							(targetDirty or: [ targets includes: f ])
								ifTrue: [ r add: e -> f ] ] ].
			r ].
	"assume sources and targets do not change until here"
	old := sources size.
	sources removeAll: (sources copyWithoutAll: (matches collect: #key)).
	sources size = old
		ifFalse: [ edge source outgoing do: [ :e | e matcher dirty: true ] ].
	old := targets size.
	targetDirty
		ifTrue: [ targets
				removeAll;
				addAll: (matches collect: #value).
			edge target dirty: false ]
		ifFalse: [ targets
				removeAll: (targets copyWithoutAll: (matches collect: #value)) ].
	targets size = old
		ifFalse: [ edge target outgoing do: [ :e | e matcher dirty: true ] ].
	dirty := false
]

{ #category : #accessing }
SeaMatGeneratingEdgeMatcher >> matchSourceOrNil: anObject [
	self subclassResponsibility
]
