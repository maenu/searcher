Class {
	#name : #SeaQueImaRemoteCompilationContext,
	#superclass : #SeaQueImaCompilationContext,
	#instVars : [
		'remotePeer'
	],
	#category : #'Searcher-Query-Image'
}

{ #category : #'as yet unclassified' }
SeaQueImaRemoteCompilationContext class >> remotePeer: aRemotePeer [
	^ self new
		initializeRemotePeer: aRemotePeer;
		yourself
]

{ #category : #initialization }
SeaQueImaRemoteCompilationContext >> initializeCollections [
	collections
		at: #classDescription
			put:
			(SeaQueCollection
				name: #classDescription
				initializer:
					(remotePeer
						evaluate: [ (Smalltalk globals allClassesAndTraits
								flatCollect: [ :e | 
									{e.
									e classSide} ]) asIdentitySet ]));
		at: #compiledMethod
			put:
			(SeaQueCollection
				name: #compiledMethod
				initializer:
					(remotePeer
						evaluate: [ ((Smalltalk globals allClassesAndTraits
								flatCollect: [ :e | 
									{e instanceSide.
									e classSide} ]) flatCollect: #methods) asIdentitySet ]));
		at: #metacelloProjectSpec
			put:
			(SeaQueCollection
				name: #metacelloProjectSpec
				initializer:
					(remotePeer
						evaluate: [ (Metacello image
								baseline: [ :spec | true ];
								list) asIdentitySet ]));
		at: #rBProgramNode
			put:
			(SeaQueCollection
				name: #rBProgramNode
				initializer:
					(remotePeer
						evaluate: [ (((Smalltalk globals allClassesAndTraits
								flatCollect: [ :e | 
									{e instanceSide.
									e classSide} ]) flatCollect: #methods)
								flatCollect: [ :e | {e ast} , e ast allChildren ])
								asIdentitySet ]));
		at: #rPackage
			put:
			(SeaQueCollection
				name: #rPackage
				initializer: (remotePeer evaluate: [ RPackage organizer packages asIdentitySet ]))
]

{ #category : #initialization }
SeaQueImaRemoteCompilationContext >> initializeRemotePeer: aRemotePeer [
	self assert: [ remotePeer isNil ].
	remotePeer := aRemotePeer
]
