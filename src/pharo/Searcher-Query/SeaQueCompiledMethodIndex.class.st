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
		ifNil: [ index := (CompiledMethod allInstances groupedBy: #selector)
				collect: #asIdentitySet ]
]
