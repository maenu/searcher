Class {
	#name : #SeaQueCompiledMethodCollection,
	#superclass : #SeaQueCollection,
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueCompiledMethodCollection >> objects_ [
	^ ((Smalltalk globals allClassesAndTraits
		flatCollect: [ :e | 
			{e instanceSide.
			e classSide} ]) flatCollect: #methods) asIdentitySet
]
