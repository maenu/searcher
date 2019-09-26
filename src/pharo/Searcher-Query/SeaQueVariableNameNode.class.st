Class {
	#name : #SeaQueVariableNameNode,
	#superclass : #SeaQueNode,
	#category : #'Searcher-Query'
}

{ #category : #testing }
SeaQueVariableNameNode >> canExecute [
	^ false
]

{ #category : #accessing }
SeaQueVariableNameNode >> execute [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
SeaQueVariableNameNode >> seaQueAsVariableNameNodeIn: aGraph [
	^ self
		graph: aGraph;
		yourself
]
