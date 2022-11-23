Class {
	#name : #SeaQueEdgeBuilder,
	#superclass : #Object,
	#instVars : [
		'argument',
		'source',
		'target',
		'sourceOptional',
		'targetOptional',
		'context'
	],
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueEdgeBuilder >> build [
	^ argument
		seaQueEdgeContext: context
		source: source
		optional: sourceOptional
		target: target
		optional: targetOptional
]
