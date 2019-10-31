Class {
	#name : #SeaQueMetacelloProjectSpecCollection,
	#superclass : #SeaQueCollection,
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueMetacelloProjectSpecCollection >> objects_ [
	^ (Metacello image
		baseline: [ :spec | true ];
		list) asIdentitySet
]
