Extension { #name : #Symbol }

{ #category : #'*Searcher-Query' }
Symbol >> seaQueBuildEdge: anEdgeBuilder [
	anEdgeBuilder perform: ('build' , self capitalized) asSymbol
]
