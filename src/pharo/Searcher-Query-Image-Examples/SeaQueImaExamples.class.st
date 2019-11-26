Class {
	#name : #SeaQueImaExamples,
	#superclass : #Object,
	#category : #'Searcher-Query-Image-Examples'
}

{ #category : #'as yet unclassified' }
SeaQueImaExamples >> neoCSV [
	<gtExample>
	^ (SeaQueGraphPart new
	, 'NeoCSV' @ '@project' ~ #metacelloProjectSpecIncludesRPackage ~> '@package'
	, '@package' ~ #rPackageIncludesClassDescription ~> '@classDescription'
	, '@package' ~? #rPackageIncludesCompiledMethod ~> '@extensionMethod'
	, '@classDescription' ~? #classDescriptionSubclassesClassDescription ~> '@x' <~ #rPackageIncludesClassDescription ~ '@package2'
	, '@classDescription' ~? #classDescriptionDefinesCompiledMethod ~> '@method'
	) compileForImage execute explode
]
