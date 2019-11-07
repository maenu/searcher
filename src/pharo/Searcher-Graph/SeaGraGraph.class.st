Class {
	#name : #SeaGraGraph,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'edges'
	],
	#category : #'Searcher-Graph'
}

{ #category : #accessing }
SeaGraGraph class >> nodes: aCollection [
	^ self new
		initializeNodes: aCollection asSet;
		yourself
]

{ #category : #accessing }
SeaGraGraph >> edges [
	^ edges
]

{ #category : #accessing }
SeaGraGraph >> initializeNodes: aSet [
	self assert: [ nodes isNil ].
	self assert: [ edges isNil ].
	nodes := aSet.
	edges := nodes flatCollect: [ :e | e incoming , e outgoing ]
]

{ #category : #accessing }
SeaGraGraph >> nodes [
	^ nodes
]
