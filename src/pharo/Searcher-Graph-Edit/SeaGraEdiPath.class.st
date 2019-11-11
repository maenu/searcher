Class {
	#name : #SeaGraEdiPath,
	#superclass : #Object,
	#instVars : [
		'operations'
	],
	#category : #'Searcher-Graph-Edit'
}

{ #category : #adding }
SeaGraEdiPath >> add: anOperation [
	operations add: anOperation
]

{ #category : #adding }
SeaGraEdiPath >> addAll: aCollection [
	operations addAll: aCollection
]

{ #category : #copying }
SeaGraEdiPath >> copyWith: anOperation [
	^ self copy
		add: anOperation;
		yourself
]

{ #category : #copying }
SeaGraEdiPath >> copyWithAll: aCollection [
	^ self copy
		addAll: aCollection;
		yourself
]

{ #category : #'as yet unclassified' }
SeaGraEdiPath >> cost [
	^ operations sum: #cost
]

{ #category : #ui }
SeaGraEdiPath >> gtItemsFor: aView [
	<gtView>
	^ (operations gtItemsFor: aView) title: 'Operations'
]

{ #category : #initialization }
SeaGraEdiPath >> initialize [
	super initialize.
	operations := OrderedCollection new
]

{ #category : #copying }
SeaGraEdiPath >> postCopy [
	super postCopy.
	operations := operations copy
]

{ #category : #accessing }
SeaGraEdiPath >> size [
	^ operations size
]

{ #category : #accessing }
SeaGraEdiPath >> sources [
	^ (operations collect: #sourceOrNil) reject: #isNil
]

{ #category : #accessing }
SeaGraEdiPath >> targets [
	^ (operations collect: #targetOrNil) reject: #isNil
]
