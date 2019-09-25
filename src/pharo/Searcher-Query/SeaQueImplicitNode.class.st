Class {
	#name : #SeaQueImplicitNode,
	#superclass : #SeaQueNode,
	#category : #'Searcher-Query'
}

{ #category : #testing }
SeaQueImplicitNode >> canExecute [
	^ false
]

{ #category : #accessing }
SeaQueImplicitNode >> execute [
	self shouldNotImplement
]
