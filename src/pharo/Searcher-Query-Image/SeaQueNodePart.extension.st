Extension { #name : #SeaQueNodePart }

{ #category : #'*Searcher-Query-Image' }
SeaQueNodePart >> compileForImage [
	^ graphPart compileForImage
]

{ #category : #'*Searcher-Query-Image' }
SeaQueNodePart >> compileForRemoteImage: aRemotePeer [
	^ graphPart compileForRemoteImage: aRemotePeer
]
