Trait {
	#name : #SeaQueTConstraint,
	#instVars : [
		'results',
		'shouldExecute',
		'wasExecuted'
	],
	#category : #'Searcher-Query'
}

{ #category : #testing }
SeaQueTConstraint >> canExecute [
	^ true
]

{ #category : #'as yet unclassified' }
SeaQueTConstraint >> cost [
	^ wasExecuted
		ifTrue: [ results size ]
		ifFalse: [ self cost_ ]
]

{ #category : #'as yet unclassified' }
SeaQueTConstraint >> cost_ [
	^ Float infinity
]

{ #category : #accessing }
SeaQueTConstraint >> execute [
	self assert: [ self shouldExecute ].
	self assert: [ self canExecute ].
	self execute_.
	shouldExecute := false.
	wasExecuted := true
]

{ #category : #accessing }
SeaQueTConstraint >> execute_ [
	self subclassResponsibility
]

{ #category : #initialization }
SeaQueTConstraint >> initializeTConstraint [
	results := IdentitySet new.
	shouldExecute := true.
	wasExecuted := false
]

{ #category : #testing }
SeaQueTConstraint >> results [
	^ results
]

{ #category : #testing }
SeaQueTConstraint >> shouldExecute [
	^ shouldExecute
]

{ #category : #accessing }
SeaQueTConstraint >> shouldExecute: aBoolean [
	shouldExecute := aBoolean
]

{ #category : #accessing }
SeaQueTConstraint >> wasExecuted [
	^ wasExecuted
]
