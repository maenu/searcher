Class {
	#name : #SeaQueRPackageIncludesClassDescriptionEdge,
	#superclass : #SeaQueEdge,
	#category : #'Searcher-Query'
}

{ #category : #'as yet unclassified' }
SeaQueRPackageIncludesClassDescriptionEdge class >> compileSourcePart: aNodePart targetPart: anotherNodePart in: aContext [
	^ self
		source: (aContext at: aNodePart ifAbsentPut: #asRPackageNameNode)
		target: (aContext at: anotherNodePart ifAbsentPut: #asClassDescriptionNameNode)
]

{ #category : #accessing }
SeaQueRPackageIncludesClassDescriptionEdge class >> identifier [
	^ #rPackageIncludesClassDescription
]

{ #category : #initialization }
SeaQueRPackageIncludesClassDescriptionEdge >> initialize [
	super initialize.
	strategies
		add:
			(SeaQueEdgeTargetCollectStrategy
				edge: self
				block: [ :t | {t package} ]);
		add:
			(SeaQueEdgeSourceCollectStrategy
				edge: self
				block: [ :s | s definedClasses ]);
		add:
			(SeaQueEdgeSourceTargetSelectStrategy
				edge: self
				block: [ :s :t | s includesClass: t ])
]
