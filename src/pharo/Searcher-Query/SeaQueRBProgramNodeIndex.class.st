Class {
	#name : #SeaQueRBProgramNodeIndex,
	#superclass : #SeaQueIndex,
	#instVars : [
		'index'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueRBProgramNodeIndex >> index [
	^ index
		ifNil: [ index := ((SeaQueCompiledMethodIndex instance all
				flatCollect: [ :e | {e ast} , e ast allChildren ])
				groupedBy: #class) collect: #asIdentitySet ]
]
