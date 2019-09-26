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
SeaQueVariableNameNode >> execute_ [
	self shouldNotImplement
]

{ #category : #initialization }
SeaQueVariableNameNode >> initialize [
	super initialize.
	shouldExecute := false
]

{ #category : #'as yet unclassified' }
SeaQueVariableNameNode >> seaQueAsVariableNameNodeIn: aGraph [
	^ self
		graph: aGraph;
		yourself
]

{ #category : #testing }
SeaQueVariableNameNode >> shouldExecute: aBoolean [
	super shouldExecute: aBoolean.
	shouldExecute := false
]
