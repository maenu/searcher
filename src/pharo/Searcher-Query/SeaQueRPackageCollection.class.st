Class {
	#name : #SeaQueRPackageCollection,
	#superclass : #SeaQueCollection,
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueRPackageCollection >> objects_ [
	^ RPackage organizer packages asIdentitySet
]
