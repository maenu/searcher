Class {
	#name : #SeaQueClassAndTraitIndex,
	#superclass : #SeaQueIndex,
	#instVars : [
		'index'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueClassAndTraitIndex >> index [
	^ index
		ifNil: [ index := (Smalltalk globals allClassesAndTraits groupedBy: #name)
				collect: #asIdentitySet ]
]
