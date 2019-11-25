Extension { #name : #MetacelloMCVersionSpec }

{ #category : #'*Searcher-Query-Image' }
MetacelloMCVersionSpec >> seaQueImaCurrentlyLoadedPackages [
	| packages_ |
	packages_ := Set new.
	self
		projectDo: [ :ignored |  ]
		packageDo: [ :packageSpec | 
			| wc |
			wc := [ packageSpec workingCopy ]
				on: Error
				do: [ :ex | ex return: nil ].
			wc ~~ nil
				ifTrue: [ packages_
						addAll: (MetacelloPlatform current packageInfoFor: wc) packages ] ]
		groupDo: [ :ignored |  ].
	^ packages_
]
