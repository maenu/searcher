Class {
	#name : #SeaMatClassDescriptionNameNodeMatcher,
	#superclass : #SeaMatNodeMatcher,
	#instVars : [
		'name'
	],
	#category : #'Searcher-Matcher'
}

{ #category : #accessing }
SeaMatClassDescriptionNameNodeMatcher >> estimatedCost [
	^ ClassDescription withAllSubclasses
		inject: 0
		into: [ :r :e | r + e allInstances size ]
]

{ #category : #accessing }
SeaMatClassDescriptionNameNodeMatcher >> match [
	self assert: [ self isDirty and: [ self canMatch ] ].
	matches := ClassDescription withAllSubclasses
		inject: IdentitySet new
		into: [ :r :e | 
			e name = name
				ifTrue: [ r add: e ].
			r ].
	dirty := false
]

{ #category : #accessing }
SeaMatClassDescriptionNameNodeMatcher >> name [
	^ name
]

{ #category : #accessing }
SeaMatClassDescriptionNameNodeMatcher >> name: anObject [
	name := anObject.
	matches := Set new
]
