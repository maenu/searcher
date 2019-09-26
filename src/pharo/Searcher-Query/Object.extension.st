Extension { #name : #Object }

{ #category : #'*Searcher-Query' }
Object >> seaQueAsEdgeSource: aNode target: otherNode [
	^ self
		source: aNode target: otherNode;
		yourself
]

{ #category : #'*Searcher-Query' }
Object >> seaQueAsNodeIn: aContext [
	^ self
		context: aContext;
		yourself
]
