Class {
	#name : #SeaQueCollection,
	#superclass : #Object,
	#instVars : [
		'objects',
		'indexes'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Searcher-Query'
}

{ #category : #accessing }
SeaQueCollection class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #initialization }
SeaQueCollection class >> reset [
	instance := nil
]

{ #category : #initialization }
SeaQueCollection class >> resetAll [
	<script>
	self subclassesDo: #reset
]

{ #category : #accessing }
SeaQueCollection >> indexedBy: aSymbol [
	^ indexes
		at: aSymbol
		ifAbsentPut: [ self objects groupedBy: aSymbol ]
]

{ #category : #initialization }
SeaQueCollection >> initialize [
	super initialize.
	indexes := Dictionary new
]

{ #category : #accessing }
SeaQueCollection >> objects [
	^ (objects ifNil: [ objects := self objects_ ]) copy
]

{ #category : #accessing }
SeaQueCollection >> objects_ [
	self subclassResponsibility
]

{ #category : #accessing }
SeaQueCollection >> size [
	^ self objects size
]
