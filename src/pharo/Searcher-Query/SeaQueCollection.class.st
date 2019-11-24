Class {
	#name : #SeaQueCollection,
	#superclass : #Object,
	#instVars : [
		'objects',
		'indexes',
		'initializer',
		'name'
	],
	#category : #'Searcher-Query'
}

{ #category : #generated }
SeaQueCollection class >> name: aSymbol initializer: aBlock [
	^ self new
		initializeName: aSymbol initializer: aBlock;
		yourself
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

{ #category : #initialization }
SeaQueCollection >> initializeName: aSymbol initializer: aBlock [
	self assert: [ name isNil ].
	self assert: [ initializer isNil ].
	name := aSymbol.
	initializer := aBlock
]

{ #category : #accessing }
SeaQueCollection >> name [
	^ name
]

{ #category : #accessing }
SeaQueCollection >> objects [
	^ (objects ifNil: [ objects := initializer value ]) copy
]

{ #category : #accessing }
SeaQueCollection >> size [
	^ self objects size
]
