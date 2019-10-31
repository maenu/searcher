Class {
	#name : #SeaQueRBProgramNodeCollection,
	#superclass : #SeaQueCollection,
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueRBProgramNodeCollection >> objects_ [
	^ (SeaQueCompiledMethodCollection instance objects
		flatCollect: [ :e | {e ast} , e ast allChildren ]) asIdentitySet
]
