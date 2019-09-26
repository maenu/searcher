Extension { #name : #String }

{ #category : #'*Searcher-Query' }
String >> seaQueAsNodeIn: aGraph [
	^ aGraph
		at: self
		ifAbsentPut: [ (SeaQueImplicitNode identifier: self)
				graph: aGraph;
				yourself ]
]
