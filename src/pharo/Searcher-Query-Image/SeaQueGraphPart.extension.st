Extension { #name : #SeaQueGraphPart }

{ #category : #'*Searcher-Query-Image' }
SeaQueGraphPart >> compileForImage [
	| context |
	context := SeaQueImaCompilationContext
		nodes: (nodeParts collect: [ :e | e -> nil ]) asDictionary
		edges: (edgeParts collect: [ :e | e -> nil ]) asDictionary
		variables: variables copy.
	^ context compile
]

{ #category : #'*Searcher-Query-Image' }
SeaQueGraphPart >> compileForRemoteImage: aRemotePeer [
	| context |
	context := SeaQueImaRemoteCompilationContext
		nodes: (nodeParts collect: [ :e | e -> nil ]) asDictionary
		edges: (edgeParts collect: [ :e | e -> nil ]) asDictionary
		variables: variables copy
		remotePeer: aRemotePeer.
	^ context compile
]
