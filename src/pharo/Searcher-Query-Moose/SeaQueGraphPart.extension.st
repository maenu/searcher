Extension { #name : #SeaQueGraphPart }

{ #category : #'*Searcher-Query-Moose' }
SeaQueGraphPart >> compileForModel: aModel [
	| context |
	context := SeaQueMooCompilationContext
		nodes: (nodeParts collect: [ :e | e -> nil ]) asDictionary
		edges: (edgeParts collect: [ :e | e -> nil ]) asDictionary
		variables: variables copy
		model: aModel.
	^ context compile
]
