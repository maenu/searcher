Class {
	#name : #SeaQueIndex,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueIndex class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #initialization }
SeaQueIndex class >> reset [
	instance := nil
]

{ #category : #initialization }
SeaQueIndex class >> resetAll [
	self subclassesDo: #reset
]

{ #category : #accessing }
SeaQueIndex >> at: anObject [
	^ (self index at: anObject) copy
]

{ #category : #accessing }
SeaQueIndex >> at: anObject ifAbsent: aBlock [
	^ (self index at: anObject ifAbsent: aBlock) copy
]

{ #category : #accessing }
SeaQueIndex >> at: anObject ifPresent: aBlock ifAbsent: anotherBlock [
	^ (self index at: anObject ifPresent: aBlock ifAbsent: anotherBlock) copy
]

{ #category : #accessing }
SeaQueIndex >> index [
	self subclassResponsibility
]

{ #category : #enumerating }
SeaQueIndex >> select: aBlock [
	^ self index select: aBlock
]

{ #category : #accessing }
SeaQueIndex >> size [
	^ self index size
]
