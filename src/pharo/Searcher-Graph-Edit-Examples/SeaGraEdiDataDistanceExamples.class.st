Class {
	#name : #SeaGraEdiDataDistanceExamples,
	#superclass : #Object,
	#category : #'Searcher-Graph-Edit-Examples'
}

{ #category : #accessing }
SeaGraEdiDataDistanceExamples >> distance [
	^ SeaGraEdiDataDistance source: self source target: self target
]

{ #category : #accessing }
SeaGraEdiDataDistanceExamples >> path [
	<gtExample>
	^ self distance compute
]

{ #category : #accessing }
SeaGraEdiDataDistanceExamples >> source [
	| a b c d |
	a := SeaGraDataNode data: $a.
	b := SeaGraDataNode data: $b.
	c := SeaGraDataNode data: $c.
	d := SeaGraDataNode data: $d.
	^ SeaGraGraph
		nodes:
			{a.
			b.
			c.
			d}
]

{ #category : #accessing }
SeaGraEdiDataDistanceExamples >> target [
	| a c d e |
	a := SeaGraDataNode data: $a.
	c := SeaGraDataNode data: $c.
	d := SeaGraDataNode data: $d.
	e := SeaGraDataNode data: $e.
	^ SeaGraGraph
		nodes:
			{a.
			c.
			d.
			e}
]
