Class {
	#name : #SeaQueImaExamples,
	#superclass : #Object,
	#category : #'Searcher-Query-Image-Examples'
}

{ #category : #accessing }
SeaQueImaExamples >> neoJSON [
	<gtExample>
	^ ((SeaQueGraph context: SeaQueImaCompilationContext new)
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
	^ ((SeaQueGraph context: SeaQueImaCompilationContext new)
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
	^ ((SeaQueGraph context: SeaQueImaCompilationContext new)
		match: [ :project :package :classDescription | 
			(project | #NeoJSON) ~ #metacelloProjectSpecIncludesRPackage
				~> package.
			package ~ #rPackageDefinesClassDescription ~> classDescription ])
		execute
]
