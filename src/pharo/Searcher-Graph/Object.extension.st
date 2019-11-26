Extension { #name : #Object }

{ #category : #'*Searcher-Graph' }
Object >> seaGraColor [
	^ Color black
]

{ #category : #'*Searcher-Graph' }
Object >> seaGraGtElement [
	^ BlElement new
		geometry: BlCircle new;
		size: 5 @ 5;
		background: self seaGraColor;
		yourself
]
