Class {
	#name : #SeaQueMethodSelectorNode,
	#superclass : #SeaQueNode,
	#instVars : [
		'selector'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueMethodSelectorNode class >> identifier: aString selector: aSymbol [
	^ (self identifier: aString)
		selector: aSymbol;
		yourself
]

{ #category : #accessing }
SeaQueMethodSelectorNode class >> selector: aSymbol [
	^ self new
		selector: aSymbol;
		yourself
]

{ #category : #accessing }
SeaQueMethodSelectorNode >> estimatedResultsSize_ [
	^ CompiledMethod allInstances size
]

{ #category : #accessing }
SeaQueMethodSelectorNode >> execute_ [
	results := CompiledMethod allInstances
		inject: IdentitySet new "cannot use set as compiledmethod hash is not considering class and selector"
		into: [ :r :e | 
			e selector = selector
				ifTrue: [ r add: e ].
			r ]
]

{ #category : #'as yet unclassified' }
SeaQueMethodSelectorNode >> seaQueAsMethodSelectorNodeIn: aGraph [
	^ self
		graph: aGraph;
		yourself
]

{ #category : #accessing }
SeaQueMethodSelectorNode >> selector: anObject [
	self assert: [ selector isNil ].
	selector := anObject
]
