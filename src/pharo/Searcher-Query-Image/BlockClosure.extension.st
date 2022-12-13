Extension { #name : #BlockClosure }

{ #category : #'*Searcher-Query-Image' }
BlockClosure >> seaQueImaMatch [
	^ (SeaQueGraph context: SeaQueImaContext new) match: self
]
