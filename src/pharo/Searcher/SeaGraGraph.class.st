Class {
	#name : #SeaGraGraph,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'edges'
	],
	#category : #'Searcher-Graph'
}

{ #category : #'as yet unclassified' }
SeaGraGraph class >> nodes: aSet edges: anotherSet [
	^ self new
		nodes: aSet edges: anotherSet;
		yourself
]

{ #category : #accessing }
SeaGraGraph >> edges [
	^ edges
]

{ #category : #accessing }
SeaGraGraph >> nodes [
	^ nodes
]

{ #category : #'as yet unclassified' }
SeaGraGraph >> nodes: aSet edges: anotherSet [
	self
		assert: [ nodes isNil
				and: [ edges isNil
						and: [ aSet
								=
									(anotherSet
										flatCollect: [ :e | 
											{e source.
											e target} ]) ] ] ].
	nodes := aSet.
	edges := anotherSet
]
