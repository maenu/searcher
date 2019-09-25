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
SeaMatMethodSelectorNodeMatcher >> estimatedCost [
	^ CompiledMethod withAllSubclasses
		inject: 0
		into: [ :r :e | r + e allInstances size ]
]

{ #category : #accessing }
SeaMatMethodSelectorNodeMatcher >> match [
	self assert: [ self isDirty and: [ self canMatch ] ].
	matches := CompiledMethod withAllSubclasses
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
