Class {
	#name : #SeaQueRemotePeerCompilationContext,
	#superclass : #SeaQueCompilationContext,
	#instVars : [
		'remotePeer'
	],
	#category : #'Searcher-Query-Parts'
}

{ #category : #'as yet unclassified' }
SeaQueRemotePeerCompilationContext class >> nodes: aDictionary edges: anotherDictionary variables: yetAnotherDictionary remotePeer: aRemotePeer [
	^ (self
		nodes: aDictionary
		edges: anotherDictionary
		variables: yetAnotherDictionary)
		initializeRemotePeer: aRemotePeer;
		yourself
]

{ #category : #'as yet unclassified' }
SeaQueRemotePeerCompilationContext >> classDescriptionCollectionInitializer [
	^ [ IdentitySet
		withAll: (remotePeer evaluate: super classDescriptionCollectionInitializer) ]
]

{ #category : #'as yet unclassified' }
SeaQueRemotePeerCompilationContext >> compiledMethodCollectionInitializer [
	^ [ IdentitySet
		withAll: (remotePeer evaluate: super compiledMethodCollectionInitializer) ]
]

{ #category : #initialization }
SeaQueRemotePeerCompilationContext >> initializeRemotePeer: aRemotePeer [
	self assert: [ remotePeer isNil ].
	remotePeer := aRemotePeer
]

{ #category : #'as yet unclassified' }
SeaQueRemotePeerCompilationContext >> metacelloProjectSpecCollectionInitializer [
	^ [ IdentitySet
		withAll: (remotePeer evaluate: super metacelloProjectSpecCollectionInitializer) ]
]

{ #category : #'as yet unclassified' }
SeaQueRemotePeerCompilationContext >> rBProgramNodeCollectionInitializer [
	^ [ IdentitySet
		withAll: (remotePeer evaluate: super rBProgramNodeCollectionInitializer) ]
]

{ #category : #'as yet unclassified' }
SeaQueRemotePeerCompilationContext >> rPackageCollectionInitializer [
	^ [ IdentitySet
		withAll: (remotePeer evaluate: super rPackageCollectionInitializer) ]
]
