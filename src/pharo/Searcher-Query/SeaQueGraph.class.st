Class {
	#name : #SeaQueGraph,
	#superclass : #SeaGraGraph,
	#traits : 'SeaQueTConstraint',
	#classTraits : 'SeaQueTConstraint classTrait',
	#instVars : [
		'context',
		'results',
		'shouldExecute',
		'wasExecuted'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueGraph class >> context: aContext [
	^ self new
		initializeContext: aContext;
		yourself
]

{ #category : #'as yet unclassified' }
SeaQueGraph >> cheapestShouldAndCanExecuteOrNil [
	^ (((nodes , edges
		select: [ :e | e shouldExecute and: [ e canExecute ] ])
		collect: [ :e | e -> e cost ])
		sorted: [ :a :b | a value < b value ])
		ifEmpty: [ nil ]
		ifNotEmpty: [ :e | e first key ]
]

{ #category : #accessing }
SeaQueGraph >> execute_ [
	| entity |
	[ (entity := self cheapestShouldAndCanExecuteOrNil) isNil ]
		whileFalse: [ entity traceCr.
			entity execute.
			entity traceCr ]
]

{ #category : #'as yet unclassified' }
SeaQueGraph >> explode [
	| map |
	map := IdentityDictionary new.
	nodes
		do:
			[ :e | e results do: [ :f | map at: f ifAbsentPut: [ e explode: f ] ] ].
	edges
		do: [ :e | 
			e results
				do: [ :f | e explode: f with: map ] ].
	^ SeaGraGraph nodes: map values
]

{ #category : #accessing }
SeaQueGraph >> gtActionExecuteFor: anAction [
	<gtAction>
	self canExecute
		ifFalse: [ ^ anAction ].
	self wasExecuted
		ifTrue: [ ^ anAction ].
	^ anAction explicit
		stencil: [ BrButton new
				look: BrGlamorousButtonWithIconLook;
				icon: BrGlamorousIcons play asElement;
				action: [ :button | button phlow spawnObject: self execute ] ]
]

{ #category : #accessing }
SeaQueGraph >> gtActionExplodeFor: anAction [
	<gtAction>
	self wasExecuted
		ifFalse: [ ^ anAction ].
	^ anAction explicit
		stencil: [ BrButton new
				look: BrGlamorousButtonWithIconLook;
				icon: BrGlamorousIcons search asElement;
				action: [ :button | button phlow spawnObject: self explode ] ]
]

{ #category : #accessing }
SeaQueGraph >> gtActionStepFor: anAction [
	<gtAction>
	self canExecute
		ifFalse: [ ^ anAction ].
	self wasExecuted
		ifTrue: [ ^ anAction ].
	^ anAction explicit
		stencil: [ BrButton new
				look: BrGlamorousButtonWithIconLook;
				icon: BrGlamorousIcons over asElement;
				action: [ :button | button phlow spawnObject: self step ] ]
]

{ #category : #'as yet unclassified' }
SeaQueGraph >> initialize [
	super initialize.
	self initializeTConstraint
]

{ #category : #initialization }
SeaQueGraph >> initializeContext: aContext [
	self assert: [ context isNil ].
	context := aContext
]

{ #category : #'key matching' }
SeaQueGraph >> match: aBlock [
	| arguments |
	arguments := aBlock numArgs
		timesCollect: [ SeaQueNode empty: context ].
	aBlock valueWithArguments: arguments.
	self initializeNodes: arguments
]

{ #category : #accessing }
SeaQueGraph >> step [
	self cheapestShouldAndCanExecuteOrNil
		ifNil: [ shouldExecute := false.
			wasExecuted := true ]
		ifNotNil: #execute
]
