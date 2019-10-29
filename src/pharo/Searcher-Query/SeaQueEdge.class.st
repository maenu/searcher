Class {
	#name : #SeaQueEdge,
	#superclass : #SeaQueQuery,
	#traits : 'SeaGraTEdge',
	#classTraits : 'SeaGraTEdge classTrait',
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueEdge class >> classForIdentifier: aString [
	| edgeClasses |
	edgeClasses := SeaQueEdge allSubclasses
		select: [ :e | 
			(e class includesSelector: #identifier)
				and: [ e identifier = aString ] ].
	self assert: [ edgeClasses size = 1 ].
	^ edgeClasses anyOne
]

{ #category : #compiling }
SeaQueEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext [
	self subclassResponsibility
]

{ #category : #accessing }
SeaQueEdge class >> identifier [
	self subclassResponsibility
]

{ #category : #printing }
SeaQueEdge >> printOn: aStream [
	aStream
		nextPutAll: self class identifier;
		nextPutAll: ' ';
		nextPutAll: self estimatedResultsSize asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
