Class {
	#name : #SeaQueImaExamples,
	#superclass : #Object,
	#category : #'Searcher-Query-Image-Examples'
}

{ #category : #accessing }
SeaQueImaExamples >> neoJSON [
	<gtExample>
	^ (SeaQueGraphPart new
	, 'NeoJSON' @ '@project' ~ #metacelloProjectSpecIncludesRPackage ~> '@package'
	, '@package' ~ #rPackageDefinesClassDescription ~> '@classDescription'
	", '@package' ~? #rPackageDefinesCompiledMethod ~> '@extensionMethod'
	, '@classDescription' ~? #classDescriptionSubclassesClassDescription ~> '@x' <~ #rPackageDefinesClassDescription ~ '@package2'
	, '@classDescription' ~? #classDescriptionDefinesCompiledMethod ~> '@method'"
	) compileForImage execute explode
]
