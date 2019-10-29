Class {
	#name : #SeaQueCompiledMethodIndex,
	#superclass : #SeaQueIndex,
	#instVars : [
		'index'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueCompiledMethodIndex >> index [
	^ index
		ifNil: [ index := (((Smalltalk globals allClassesAndTraits
				flatCollect: [ :e | 
					{e instanceSide.
					e classSide} ]) flatCollect: #methods) groupedBy: #selector)
				collect: #asIdentitySet ]
]
