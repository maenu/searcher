Class {
	#name : #BaselineOfSearcher,
	#superclass : #BaselineOf,
	#category : #BaselineOfSearcher
}

{ #category : #baselines }
BaselineOfSearcher >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Searcher-Graph';
				package: 'Searcher-Graph-Edit';
				package: 'Searcher-Graph-Edit-Examples';
				package: 'Searcher-Query';
				package: 'Searcher-Query-Image';
				package: 'Searcher-Query-Image-Examples';
				package: 'Searcher-Query-Moose';
				package: 'Searcher-Query-Moose-Examples' ]
]
