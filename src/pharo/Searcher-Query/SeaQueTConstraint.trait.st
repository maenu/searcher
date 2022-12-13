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

{ #category : #accessing }
SeaQueTConstraint >> cost [
	^ wasExecuted ifTrue: [ results size ] ifFalse: [ Float infinity ]
]

{ #category : #accessing }
SeaQueTConstraint >> execute [
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

{ #category : #accessing }
SeaQueTConstraint >> seaGraColor [
	self wasExecuted
		ifTrue: [ ^ Color blue ].
	self canExecute
		ifTrue: [ ^ Color green ].
	^ Color red
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
