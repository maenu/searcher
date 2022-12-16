Trait {
	#name : #SeaGraTNode,
	#instVars : [
		'incoming',
		'outgoing'
	],
	#traits : 'SeaGraTEntity',
	#classTraits : 'SeaGraTEntity classTrait',
	#category : #'Searcher-Graph'
}

{ #category : #enumerating }
SeaGraTNode >> allNodes [
	| whites blacks |
	whites := Set with: self.
	blacks := Set new.
	[ whites isEmpty ]
		whileFalse: [ | gray |
			gray := whites remove: whites anyOne.
			blacks add: gray.
			whites
				addAll:
					((gray outgoing collect: #target) , (gray incoming collect: #source)
						copyWithoutAll: blacks) ].
	^ blacks
]

{ #category : #accessing }
SeaGraTNode >> incoming [
	^ incoming
]

{ #category : #initialization }
SeaGraTNode >> initializeTNode [
	self initializeTEntity.
	incoming := (CollectionValueHolder value: Set new)
			whenAddedDo: [ :e | self assert: [ e target == self ] ];
			yourself.
	outgoing := (CollectionValueHolder value: Set new)
			whenAddedDo: [ :e | self assert: [ e source == self ] ];
			yourself
]

{ #category : #accessing }
SeaGraTNode >> outgoing [
	^ outgoing
]

{ #category : #accessing }
SeaGraTNode >> seaGraAsElement [
	| element |
	element := BrEditor new
			constraintsDo: [ :c | 
				c maxWidth: 200.
				c maxHeight: 200.
				c horizontal fitContent.
				c vertical fitContent.
				c frame horizontal alignCenter.
				c frame vertical alignCenter ];
			beReadOnlyWithoutSelection;
			aptitude: BrGlamorousEditorAptitude;
			text: self seaGraAsString;
			border: self seaGraAsColor;
			background: Color white;
			when: BlClickEvent
				do: [ :e | 
					e consumed: true.
					e target phlow spawnObject: self ];
			yourself.
	announcer
		when: SeaGraChanged
		do: [ element
				text: self seaGraAsString;
				border: self seaGraAsColor ].
	^ element
]
