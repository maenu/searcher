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
SeaQueGraph >> explode [
	| map |
	map := IdentityDictionary new.
	nodes
		do: [ :e | e results do: [ :f | map at: f ifAbsentPut: [ SeaGraDataNode data: f ] ] ].
	edges
		do: [ :e | 
			e results
				do: [ :f | 
					SeaGraDataEdge
						source: (map at: f key)
						target: (map at: f value)
						data: e data ] ].
	^ SeaGraGraph nodes: map values
]

{ #category : #accessing }
SeaQueGraph >> gtActionExecuteFor: anAction [
	<gtAction>
	^ anAction explicit
		priority: 11;
		stencil: [ | element |
			element := BrButton new
					aptitude: BrGlamorousButtonWithIconAptitude new
							+ (GtPhlowLabelTooltipAptitude new text: 'Execute');
					icon: BrGlamorousIcons play asElement;
					action: [ self execute ];
					enabled: self canExecute & wasExecuted not;
					yourself.
			announcer
				when: SeaGraChanged
				do: [ element enabled: self canExecute & wasExecuted not ].
			element ]
]

{ #category : #accessing }
SeaQueGraph >> gtActionExplodeFor: anAction [
	<gtAction>
	^ anAction explicit
		priority: 12;
		stencil: [ | element |
			element := BrButton new
					aptitude: BrGlamorousButtonWithIconAptitude new
							+ (GtPhlowLabelTooltipAptitude new text: 'Explode');
					icon: BrGlamorousIcons search asElement;
					action: [ :button | button phlow spawnObject: self explode ];
					enabled: wasExecuted;
					yourself.
			announcer when: SeaGraChanged do: [ element enabled: wasExecuted ].
			element ]
]

{ #category : #accessing }
SeaQueGraph >> gtActionStepFor: anAction [
	<gtAction>
	^ anAction explicit
		priority: 10;
		stencil: [ | element |
			element := BrButton new
					aptitude: BrGlamorousButtonWithIconAptitude new
							+ (GtPhlowLabelTooltipAptitude new text: 'Execute');
					icon: BrGlamorousIcons over asElement;
					action: [ self step ];
					enabled: self canExecute & wasExecuted not;
					yourself.
			announcer
				when: SeaGraChanged
				do: [ element enabled: self canExecute & wasExecuted not ].
			element ]
]

{ #category : #accessing }
SeaQueGraph >> initialize [
	super initialize.
	self initializeTEntity.
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
SeaQueGraph >> privateExecute [
	[ wasExecuted ] whileFalse: [ self step ]
]

{ #category : #accessing }
SeaQueGraph >> step [
	self cheapestShouldAndCanExecuteOrNil
		ifNil: [ shouldExecute := false.
			wasExecuted := true ]
		ifNotNil: #execute.
	announcer announce: SeaGraChanged new
]
