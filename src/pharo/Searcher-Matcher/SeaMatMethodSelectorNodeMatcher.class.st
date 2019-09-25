Class {
	#name : #SeaMatMethodSelectorNodeMatcher,
	#superclass : #SeaMatNodeMatcher,
	#instVars : [
		'selector'
	],
	#category : #'Searcher-Matcher'
}

{ #category : #accessing }
SeaMatMethodSelectorNodeMatcher class >> selector: aSymbol [
	^ self new
		selector: aSymbol;
		yourself
]

{ #category : #accessing }
SeaMatMethodSelectorNodeMatcher >> estimatedMatchesSize [
	^ CompiledMethod allInstances size
]

{ #category : #accessing }
SeaMatMethodSelectorNodeMatcher >> match [
	self assert: [ self dirty and: [ self canMatch ] ].
	matches := CompiledMethod allInstances
		inject: IdentitySet new "cannot use set as compiledmethod hash is not considering class and selector"
		into: [ :r :e | 
			e selector = selector
				ifTrue: [ r add: e ].
			r ].
	dirty := false
]

{ #category : #accessing }
SeaMatMethodSelectorNodeMatcher >> selector [
	^ selector
]

{ #category : #accessing }
SeaMatMethodSelectorNodeMatcher >> selector: anObject [
	selector := anObject
]
