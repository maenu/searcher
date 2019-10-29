Class {
	#name : #SeaQueHasSuperclassEdge,
	#superclass : #SeaQueReducingEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueHasSuperclassEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext [
	^ self
		source: (aContext at: aNodePart ifAbsentPut: #asClassDescriptionNameNode)
		target: (aContext at: anotherNodePart ifAbsentPut: #asClassDescriptionNameNode)
]

{ #category : #accessing }
SeaQueHasSuperclassEdge class >> identifier [
	^ #hasSuperclass
]

{ #category : #accessing }
SeaQueHasSuperclassEdge >> canExecuteSource: anObject target: anotherObject [
	(anObject isInstanceSide and: [ anotherObject isInstanceSide ])
		ifTrue: [ ^ anObject superclass == anotherObject ].
	(anObject isClassSide and: [ anotherObject isClassSide ])
		ifTrue: [ ^ anObject instanceSide superclass == anotherObject instanceSide ].
	^ false
]
