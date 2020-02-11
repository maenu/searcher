"
I am a copy of class SeaQueImaCompilationContext. This comment is copied from there, and might not be entirely accurate

Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #SeaQueMooCompilationContext,
	#superclass : #SeaQueCompilationContext,
	#instVars : [
		'model'
	],
	#category : #'Searcher-Query-Moose'
}

{ #category : #'as yet unclassified' }
SeaQueMooCompilationContext class >> model: aModel [
	^ self new
		initializeModel: aModel;
		yourself
]

{ #category : #initialization }
SeaQueMooCompilationContext >> initializeCollections [
	collections
		at: #entity
		put:
			(SeaQueCollection
				name: #entity
				initializer: [ (model allModelEntities reject: #isAssociation) asIdentitySet ])
]

{ #category : #initialization }
SeaQueMooCompilationContext >> initializeEdgeFactories [
	edgeFactories := ((((model allModelEntities groupedBy: #class)
		collect: #first) values
		flatCollect: [ :e | e mooseDescription allComplexProperties ]) asSet
		groupedBy: #name)
		collect: [ :e | SeaQueMooEdgeFactory properties: e ]
]

{ #category : #initialization }
SeaQueMooCompilationContext >> initializeModel: aModel [
	self assert: [ model isNil ].
	model := aModel
]
