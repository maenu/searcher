Class {
	#name : #SeaQueClassDescriptionCollection,
	#superclass : #SeaQueCollection,
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueClassDescriptionCollection >> objects_ [
	^ (Smalltalk globals allClassesAndTraits
		flatCollect: [ :e | 
			{e.
			e classSide} ]) asIdentitySet
]
