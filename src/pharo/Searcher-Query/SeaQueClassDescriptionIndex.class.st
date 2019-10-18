Class {
	#name : #SeaQueClassDescriptionIndex,
	#superclass : #SeaQueIndex,
	#instVars : [
		'index'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueClassDescriptionIndex >> index [
	^ index
		ifNil: [ index := ((Smalltalk globals allClassesAndTraits
				flatCollect: [ :e | 
					{e.
					e classSide} ]) groupedBy: #name) collect: #asIdentitySet ]
]
