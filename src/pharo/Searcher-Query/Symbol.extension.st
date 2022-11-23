Extension { #name : #Symbol }

{ #category : #'*Searcher-Query' }
Symbol >> seaQueEdgeContext: aContext source: aNode optional: aBoolean target: anotherNode optional: anotherBoolean [
	^ aContext
		perform:
			('edge' , self capitalized , 'Source:optional:target:optional:')
				asSymbol
		withArguments:
			{aNode.
			aBoolean.
			anotherNode.
			anotherBoolean}
]
