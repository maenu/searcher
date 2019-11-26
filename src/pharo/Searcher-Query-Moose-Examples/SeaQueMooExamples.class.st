"
I am a copy of class SeaQueImaExamples. This comment is copied from there, and might not be entirely accurate

Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #SeaQueMooExamples,
	#superclass : #Object,
	#category : #'Searcher-Query-Moose-Examples'
}

{ #category : #'as yet unclassified' }
SeaQueMooExamples >> bigModel [
	<gtExample>
	| model |
	model := MooseModel root first.
	^ ((SeaQueGraphPart new
	, '@method' <~ #methods ?~ '@class' ~ #superclass ~> '@superclass'
	, '@class' ~ #parentPackage ~> '@classPackage'
	, '@superclass' ~ #parentPackage ~> '@superclassPackage'
	) compileForModel: model) execute explode
]

{ #category : #'as yet unclassified' }
SeaQueMooExamples >> smallModel [
	<gtExample>
	| model |
	model := MooseModel root first.
	^ ((SeaQueGraphPart new
	, '@method' <~ #methods ?~ '@class' ~ #superclass ~> '@superclass'
	, '@class' ~ #parentPackage ~> 'Collections-Unordered' @ '@classPackage'
	, '@superclass' ~ #parentPackage ~> '@superclassPackage'
	) compileForModel: model) execute explode
]
