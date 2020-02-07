Extension { #name : #Collection }

{ #category : #'*Searcher-Query' }
Collection >> seaQueIsIdentifier [
	^ false
]

{ #category : #'*Searcher-Query' }
Collection >> seaQueNodeIn: aContext [
	^ SeaQueVariableNode
		collection: (SeaQueCollection name: #custom initializer: [ self ])
]
