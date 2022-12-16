Class {
	#name : #SeaQueImaExamples,
	#superclass : #Object,
	#category : #'Searcher-Query-Image-Examples'
}

{ #category : #accessing }
SeaQueImaExamples >> fixBrokenMetacello [
	<gtExample>
	BaselineOfTaskIt
		compile: ((BaselineOfTaskIt >> #baselineForCommon:) sourceCode
				copyReplaceAll: 'minimal'
				with: 'default').
	MetacelloProjectRegistration primeRegistryFromImage.
	^ (SeaQueImaContext new collectionAt: #metacelloProjectSpec) objects
]

{ #category : #accessing }
SeaQueImaExamples >> neoJSON [
	<gtExample>
	^ ((SeaQueGraph context: SeaQueImaContext new)
	, 'NeoJSON' @ '@project' ~ #metacelloProjectSpecIncludesRPackage ~> '@package'
	, '@package' ~ #rPackageDefinesClassDescription ~> '@classDescription'
	", '@package' ~? #rPackageDefinesCompiledMethod ~> '@extensionMethod'
	, '@classDescription' ~? #classDescriptionSubclassesClassDescription ~> '@x' <~ #rPackageDefinesClassDescription ~ '@package2'
	, '@classDescription' ~? #classDescriptionDefinesCompiledMethod ~> '@method'"
	) compile execute explode
]

{ #category : #'as yet unclassified' }
SeaQueImaExamples >> neoJSONv2 [
	<gtExample>
	^ ((SeaQueGraph context: SeaQueImaContext new)
		match:
			[ :project :package :classDescription :extensionMethod :superClassDescription :superClassDescriptionPackage :method | 
			project | #NeoJSON ~ #metacelloProjectSpecIncludesRPackage ~> package.
			package ~ #rPackageDefinesClassDescription ~> classDescription.
			package ~? #rPackageDefinesCompiledMethod ~> extensionMethod.
			classDescription ~? #classDescriptionSubclassesClassDescription ~> superClassDescription <~ #rPackageDefinesClassDescription ~ superClassDescriptionPackage.
			classDescription ~? #classDescriptionDefinesCompiledMethod ~> method
		]) compile execute explode
]

{ #category : #'as yet unclassified' }
SeaQueImaExamples >> neoJSONv2Small [
	<gtExample>
	^ [ :project :package :classDescription | 
	(project | #NeoJSON) ~ #metacelloProjectSpecIncludesRPackage ~> package.
	package ~ #rPackageDefinesClassDescription ~> classDescription ]
		seaQueImaMatch
]

{ #category : #accessing }
SeaQueImaExamples >> remoteGtSmall [
	<gtExample>
	^ [ :project :package :classDescription | 
	project ~ #metacelloProjectSpecIncludesRPackage
		~> (package | 'GToolkit-Gleam').
	package ~ #rPackageDefinesClassDescription ~> classDescription ] seaQueImaMatch
]
