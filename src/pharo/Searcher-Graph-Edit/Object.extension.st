Extension { #name : #Object }

{ #category : #'*Searcher-Graph-Edit' }
Object >> seaGraEdiReplaceCost: anObject [
	self = anObject
		ifTrue: [ ^ 0 ].
	self class = anObject class
		ifTrue: [ ^ 0.25 ].
	self class instanceSide = anObject class instanceSide
		ifTrue: [ ^ 0.375 ].
	((self class includesBehavior: anObject class)
		or: [ anObject class includesBehavior: self class ])
		ifTrue: [ ^ 0.5 ].
	((self class instanceSide
		includesBehavior: anObject class instanceSide)
		or: [ anObject class instanceSide
				includesBehavior: self class instanceSide ])
		ifTrue: [ ^ 0.625 ].
	^ 1
]
