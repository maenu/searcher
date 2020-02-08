Extension { #name : #Collection }

{ #category : #'*Searcher-Query' }
Collection >> seaQueIsIdentifier [
	^ false
]

{ #category : #'*Searcher-Query' }
Collection >> seaQueNodeIn: aContext [
	^ self seaQueIsIdentifier
		ifTrue: [ SeaQueVariableNode
				collection: (SeaQueCollection name: #empty initializer: [ IdentitySet new ]) ]
		ifFalse: [ SeaQueMatchNode
				collection: (SeaQueCollection name: #custom initializer: [ self asIdentitySet ])
				block: [ :e | self includes: e ] ]
]
