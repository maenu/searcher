Extension { #name : #BlockClosure }

{ #category : #'*Searcher-Query-Image' }
BlockClosure >> seaQueImaMatch [
	^ (SeaQueGraph context: SeaQueImaCompilationContext new) match: self
]
