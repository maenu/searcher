Extension { #name : #FM3Property }

{ #category : #'*Searcher-Query-Moose' }
FM3Property >> seaQueMooEntitiesFor: anEntity [
	| result |
	(anEntity class canPerform: self implementingSelector)
		ifFalse: [ ^ #() ].
	result := anEntity perform: self implementingSelector.
	result ifNil: [ ^ #() ].
	result isCollection
		ifFalse: [ ^ {result} ].
	self isMultivalued
		ifFalse: [ ^ result ].
	^ result
		collect: [ :e | 
			e isAssociation
				ifTrue: [ e from == anEntity
						ifTrue: [ e to ]
						ifFalse: [ e from ] ]
				ifFalse: [ e ] ]
]
