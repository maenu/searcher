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

{ #category : #printing }
SeaQueVariableNode >> printOn: aStream [
	aStream
		nextPutAll: 'variable ';
		nextPutAll: self estimatedResultsSize asString;
		nextPutAll: ' ';
		nextPutAll: results size asString
]

{ #category : #testing }
SeaQueVariableNode >> shouldExecute: aBoolean [
	super shouldExecute: aBoolean.
	shouldExecute := false
]
