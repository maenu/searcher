Class {
	#name : #SeaQueImaRemoteCompilationContext,
	#superclass : #SeaQueImaCompilationContext,
	#instVars : [
		'remotePeer'
	],
	#category : #'Searcher-Query-Image'
}

{ #category : #'as yet unclassified' }
SeaQueImaRemoteCompilationContext class >> nodes: aDictionary edges: anotherDictionary variables: yetAnotherDictionary remotePeer: aRemotePeer [
	^ (self
		nodes: aDictionary
		edges: anotherDictionary
		variables: yetAnotherDictionary)
		initializeRemotePeer: aRemotePeer;
		yourself
]

{ #category : #'as yet unclassified' }
SeaQueImaRemoteCompilationContext >> classDescriptionCollectionInitializer [
	^ [ IdentitySet
		withAll: (remotePeer evaluate: super classDescriptionCollectionInitializer) ]
]

{ #category : #'as yet unclassified' }
SeaQueImaRemoteCompilationContext >> compiledMethodCollectionInitializer [
	^ [ IdentitySet
		withAll: (remotePeer evaluate: super compiledMethodCollectionInitializer) ]
]

{ #category : #initialization }
SeaQueImaRemoteCompilationContext >> initializeRemotePeer: aRemotePeer [
	self assert: [ remotePeer isNil ].
	remotePeer := aRemotePeer
]

{ #category : #'as yet unclassified' }
SeaQueImaRemoteCompilationContext >> metacelloProjectSpecCollectionInitializer [
	^ [ IdentitySet
		withAll: (remotePeer evaluate: super metacelloProjectSpecCollectionInitializer) ]
]

{ #category : #'as yet unclassified' }
SeaQueImaRemoteCompilationContext >> rBProgramNodeCollectionInitializer [
	^ [ IdentitySet
		withAll: (remotePeer evaluate: super rBProgramNodeCollectionInitializer) ]
]

{ #category : #'as yet unclassified' }
SeaQueImaRemoteCompilationContext >> rPackageCollectionInitializer [
	^ [ IdentitySet
		withAll: (remotePeer evaluate: super rPackageCollectionInitializer) ]
]
