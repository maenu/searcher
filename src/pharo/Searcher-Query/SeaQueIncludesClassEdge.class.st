Class {
	#name : #SeaQueIncludesClassEdge,
	#superclass : #SeaQueReducingEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueIncludesClassEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext [
	^ self
		source: (aContext at: aNodePart ifAbsentPut: #asPackageNameNode)
		target: (aContext at: anotherNodePart ifAbsentPut: #asClassDescriptionNameNode)
]

{ #category : #accessing }
SeaQueIncludesClassEdge class >> identifier [
	^ #includesClass
]

{ #category : #accessing }
SeaQueIncludesClassEdge >> canExecuteSource: anObject target: anotherObject [
	^ anObject includesClass: anotherObject
]
