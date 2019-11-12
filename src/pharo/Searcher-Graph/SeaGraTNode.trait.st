Trait {
	#name : #SeaGraTNode,
	#instVars : [
		'incoming',
		'outgoing'
	],
	#category : #'Searcher-Graph'
}

{ #category : #enumerating }
SeaGraTNode >> allEdges [
	^ self allNodes flatCollect: #outgoing
]

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
		ifNil: [ incoming := (CollectionValueHolder value: Set new)
				whenAddedDo: [ :e | self assert: [ e target == self ] ];
				yourself ]
]

{ #category : #accessing }
SeaGraTNode >> outgoing [
	^ outgoing
		ifNil: [ outgoing := (CollectionValueHolder value: Set new)
				whenAddedDo: [ :e | self assert: [ e source == self ] ];
				yourself ]
]

{ #category : #'as yet unclassified' }
SeaGraTNode >> seaGraGtElement [
	^ BlElement new
		geometry: BlCircle new;
		size: 5 @ 5;
		background: Color black;
		yourself
]
