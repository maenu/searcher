Extension { #name : #FM3Property }

{ #category : #'*Searcher-Query-Moose' }
FM3Property >> seaQueMooEntitiesFor: anEntity [
	| result |
	(anEntity class canPerform: self implementingSelector)
		ifFalse: [ ^ #() ].
	result := anEntity perform: self implementingSelector.
	result ifNil: [ ^ #() ].
	^ result isCollection
		ifTrue: [ result ]
		ifFalse: [ {result} ]
]
