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
SeaQueGraph >> execute [
	self assert: [ self shouldExecute ].
	self assert: [ self canExecute ].
	[ wasExecuted ]
		whileFalse: [ self step ].
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
				aptitude: BrGlamorousButtonWithIconAptitude;
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
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousIcons search asElement;
				action: [ :button | button phlow spawnObject: self explode ] ]
]

{ #category : #accessing }
SeaQueGraph >> gtActionStepFor: anAction [
	<gtAction>
	self canExecute ifFalse: [ ^ anAction ].
	self wasExecuted ifTrue: [ ^ anAction ].
	^ anAction button
		icon: BrGlamorousIcons over asElement;
		tooltip: 'Step';
		priority: 10;
		action: [ :button :tab | 
			self step.
			tab viewContentElement phlow syncUpdate ]
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
	arguments := aBlock argumentNames
			collect: [ :name | 
				(SeaQueNode empty: context)
					data: name;
					yourself ].
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
