Class {
	#name : #SeaQueVariableNode,
	#superclass : #SeaQueNode,
	#category : #'Searcher-Query'
}

{ #category : #testing }
SeaQueVariableNode >> canExecute [
	^ false
]

{ #category : #accessing }
SeaQueVariableNode >> execute_ [
	self shouldNotImplement
]

{ #category : #initialization }
SeaQueVariableNode >> initialize [
	super initialize.
	shouldExecute := false
]
