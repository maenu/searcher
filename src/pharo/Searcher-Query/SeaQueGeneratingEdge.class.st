Class {
	#name : #SeaQueGeneratingEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query'
}

{ #category : #testing }
SeaQueGeneratingEdge >> canExecute [
	^ source shouldExecute not
]

{ #category : #accessing }
SeaQueGeneratingEdge >> canExecuteSource: anObject [
	^ true
]

{ #category : #'as yet unclassified' }
SeaQueGeneratingEdge >> estimatedResultsSize [
	^ source estimatedResultsSize
]

{ #category : #accessing }
SeaQueGeneratingEdge >> execute [
	| sources targets targetDirty old |
	self assert: [ self shouldExecute and: [ self canExecute ] ].
	sources := source results.
	targets := target results.
	targetDirty := target shouldExecute.
	results := sources
		inject: IdentitySet new
		into: [ :r :e | 
			(self canExecuteSource: e)
				ifTrue: [ (self executeSource: e)
						do: [ :f | 
							(targetDirty or: [ targets includes: f ])
								ifTrue: [ r add: e -> f ] ] ].
			r ].
	"assume sources and targets do not change until here"
	old := sources size.
	sources removeAll: (sources copyWithoutAll: (results collect: #key)).
	sources size = old
		ifFalse: [ source outgoing do: [ :e | e shouldExecute: true ] ].
	old := targets size.
	targetDirty
		ifTrue: [ targets
				removeAll;
				addAll: (results collect: #value).
			target shouldExecute: false ]
		ifFalse: [ targets
				removeAll: (targets copyWithoutAll: (results collect: #value)) ].
	targets size = old
		ifFalse: [ target outgoing do: [ :e | e shouldExecute: true ] ].
	shouldExecute := false
]

{ #category : #accessing }
SeaQueGeneratingEdge >> executeSource: anObject [
	self subclassResponsibility
]
