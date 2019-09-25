Class {
	#name : #SeaQueMethodSelectorNode,
	#superclass : #SeaQueNode,
	#instVars : [
		'selector'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueMethodSelectorNode class >> selector: aSymbol [
	^ self new
		selector: aSymbol;
		yourself
]

{ #category : #accessing }
SeaQueMethodSelectorNode >> estimatedResultsSize [
	^ CompiledMethod allInstances size
]

{ #category : #accessing }
SeaQueMethodSelectorNode >> execute [
	self assert: [ self shouldExecute and: [ self canExecute ] ].
	results := CompiledMethod allInstances
		inject: IdentitySet new "cannot use set as compiledmethod hash is not considering class and selector"
		into: [ :r :e | 
			e selector = selector
				ifTrue: [ r add: e ].
			r ].
	shouldExecute := false
]

{ #category : #accessing }
SeaQueMethodSelectorNode >> selector: anObject [
	self assert: [ selector isNil ].
	selector := anObject
]
