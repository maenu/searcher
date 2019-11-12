Extension { #name : #Object }

{ #category : #'*Searcher-Graph' }
Object >> seaGraGtElement [
	^ BlElement new
		geometry: BlCircle new;
		size: 5 @ 5;
		background: Color black;
		yourself
]
