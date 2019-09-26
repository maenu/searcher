Class {
	#name : #SeaQueContext,
	#superclass : #Object,
	#instVars : [
		'variables'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueContext >> at: aString [
	^ variables at: aString
]

{ #category : #accessing }
SeaQueContext >> at: aString put: aNode [
	^ variables at: aString put: aNode
]

{ #category : #initialization }
SeaQueContext >> initialize [
	super initialize.
	variables := Dictionary new
]
