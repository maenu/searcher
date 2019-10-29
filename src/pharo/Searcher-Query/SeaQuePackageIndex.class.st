Class {
	#name : #SeaQuePackageIndex,
	#superclass : #SeaQueIndex,
	#instVars : [
		'index'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQuePackageIndex >> index [
	^ index
		ifNil: [ index := (RPackage organizer packages groupedBy: #name)
				collect: #asIdentitySet ]
]
