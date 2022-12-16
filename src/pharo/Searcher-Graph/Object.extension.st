Extension { #name : #Object }

{ #category : #'*Searcher-Graph' }
Object >> seaGraAsColor [
	^ Color black
]

{ #category : #'*Searcher-Graph' }
Object >> seaGraAsElement [
	^ BlElement new
		geometry: BlCircleGeometry new;
		size: 5 @ 5;
		background: self seaGraAsColor;
		yourself
]

{ #category : #'*Searcher-Graph' }
Object >> seaGraAsString [
	^ self asString
]
