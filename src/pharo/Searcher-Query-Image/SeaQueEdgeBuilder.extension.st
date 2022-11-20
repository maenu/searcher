Extension { #name : #SeaQueEdgeBuilder }

{ #category : #'*Searcher-Query-Image' }
SeaQueEdgeBuilder >> buildClassDescriptionDefinesCompiledMethod [
	self ensureCollection: #classDescription in: source.
	self ensureCollection: #compiledMethod in: target.
	strategies
		add: [ :t | {t methodClass} ] seaQueAsEdgeTargetCollectStrategy;
		add: [ :s | s methods ] seaQueAsEdgeSourceCollectStrategy;
		add: [ :s :t | s includesMethod: t ] seaQueAsEdgeSourceTargetSelectStrategy
]

{ #category : #'*Searcher-Query-Image' }
SeaQueEdgeBuilder >> buildClassDescriptionImplementsCompiledMethod [
	self ensureCollection: #classDescription in: source.
	self ensureCollection: #compiledMethod in: target.
	strategies
		add: [ :t | t methodClass withAllSubclasses ] seaQueAsEdgeTargetCollectStrategy;
		add: [ :s | s allMethods ] seaQueAsEdgeSourceCollectStrategy;
		add: [ :s :t | (s lookupSelector: t selector) == t ] seaQueAsEdgeSourceTargetSelectStrategy
]

{ #category : #'*Searcher-Query-Image' }
SeaQueEdgeBuilder >> buildClassDescriptionSubclassesClassDescription [
	self ensureCollection: #classDescription in: source.
	self ensureCollection: #classDescription in: target.
	strategies
		add: [ :t | t subclasses ] seaQueAsEdgeTargetCollectStrategy;
		add:
			[ :s | s superclass ifNil: [ {} ] ifNotNil: [ {s superclass} ] ]
				seaQueAsEdgeSourceCollectStrategy;
		add: [ :s :t | s superclass == t ] seaQueAsEdgeSourceTargetSelectStrategy
]

{ #category : #'*Searcher-Query-Image' }
SeaQueEdgeBuilder >> buildMetacelloProjectSpecIncludesRPackage [
	self ensureCollection: #metacelloProjectSpec in: source.
	self ensureCollection: #rPackage in: target.
	strategies
		add:
			[ :s | s version spec seaQueImaCurrentlyLoadedPackages ]
				seaQueAsEdgeSourceCollectStrategy
]

{ #category : #'*Searcher-Query-Image' }
SeaQueEdgeBuilder >> buildRPackageDefinesClassDescription [
	self ensureCollection: #rPackage in: source.
	self ensureCollection: #classDescription in: target.
	strategies
		add: [ :t | {t package} ] seaQueAsEdgeTargetCollectStrategy;
		add: [ :s | s definedClasses ] seaQueAsEdgeSourceCollectStrategy;
		add: [ :s :t | s definesClass: t ] seaQueAsEdgeSourceTargetSelectStrategy
]

{ #category : #'*Searcher-Query-Image' }
SeaQueEdgeBuilder >> buildRPackageDefinesCompiledMethod [
	self ensureCollection: #rPackage in: source.
	self ensureCollection: #compiledMethod in: target.
	strategies
		add: [ :t | {t package} ] seaQueAsEdgeTargetCollectStrategy;
		add: [ :s | s methods ] seaQueAsEdgeSourceCollectStrategy;
		add:
			[ :s :t | s includesSelector: t selector ofClass: t methodClass ]
				seaQueAsEdgeSourceTargetSelectStrategy
]
