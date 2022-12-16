Trait {
	#name : #SeaQueTConstraint,
	#instVars : [
		'results',
		'shouldExecute',
		'wasExecuted'
	],
	#traits : 'SeaGraTEntity',
	#classTraits : 'SeaGraTEntity classTrait',
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
	self assert: [ self shouldExecute ].
	self assert: [ self canExecute ].
	self privateExecute.
	shouldExecute := false.
	wasExecuted := true.
	announcer announce: SeaGraChanged new
]

{ #category : #initialization }
SeaQueTConstraint >> initializeTConstraint [
	results := IdentitySet new.
	shouldExecute := true.
	wasExecuted := false
]

{ #category : #accessing }
SeaQueTConstraint >> privateExecute [
	self explicitRequirement
]

{ #category : #testing }
SeaQueTConstraint >> results [
	^ results
]

{ #category : #accessing }
SeaQueTConstraint >> seaGraAsColor [
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
	shouldExecute := aBoolean.
	announcer announce: SeaGraChanged new
]

{ #category : #accessing }
SeaQueTConstraint >> wasExecuted [
	^ wasExecuted
]
