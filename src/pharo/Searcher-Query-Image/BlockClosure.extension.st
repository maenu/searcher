Extension { #name : #BlockClosure }

{ #category : #'*Searcher-Query-Image' }
BlockClosure >> seaQueImaAsClassDescriptionNodeIn: aContext [
	| collection |
	collection := aContext collectionAt: #classDescription.
	^ SeaQueMatchNode collection: collection block: self
]

{ #category : #'*Searcher-Query-Image' }
BlockClosure >> seaQueImaAsCompiledMethodNodeIn: aContext [
	| collection |
	collection := aContext collectionAt: #compiledMethod.
	^ SeaQueMatchNode collection: collection block: self
]

{ #category : #'*Searcher-Query-Image' }
BlockClosure >> seaQueImaAsMetacelloProjectSpecNodeIn: aContext [
	| collection |
	collection := aContext collectionAt: #metacelloProjectSpec.
	^ SeaQueMatchNode collection: collection block: self
]

{ #category : #'*Searcher-Query-Image' }
BlockClosure >> seaQueImaAsRPackageNodeIn: aContext [
	| collection |
	collection := aContext collectionAt: #rPackage.
	^ SeaQueMatchNode collection: collection block: self
]
