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

{ #category : #testing }
SeaQueVariableNode >> includes: anObject [
	^ wasExecuted not or: [ results includes: anObject ]
]

{ #category : #initialization }
SeaQueVariableNode >> initialize [
	super initialize.
	shouldExecute := false
]

{ #category : #printing }
SeaQueVariableNode >> printOn: aStream [
	aStream
		nextPutAll: 'variable ';
		nextPutAll: self cost asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]
