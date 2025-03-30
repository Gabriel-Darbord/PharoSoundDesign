Class {
	#name : 'PSDGrowlMorphInstrumentation',
	#superclass : 'PSDInstrumentation',
	#category : 'PharoSoundDesign-Instrumentation',
	#package : 'PharoSoundDesign',
	#tag : 'Instrumentation'
}

{ #category : 'evaluating' }
PSDGrowlMorphInstrumentation class >> beforeExecutionWithReceiver: receiver arguments: arguments [

	self silent ifFalse: [ PSDInstrument playNotify ]
]

{ #category : 'matching' }
PSDGrowlMorphInstrumentation class >> classMatcher [

	^ OTMatcher identicalTo: GrowlMorph
]

{ #category : 'matching' }
PSDGrowlMorphInstrumentation class >> methodMatcher [

	^ OTMatcher name: #openWithLabel:contents:backgroundColor:labelColor:
]

{ #category : 'matching' }
PSDGrowlMorphInstrumentation class >> packageMatcher [

	^ OTMatcher identicalTo: GrowlMorph package
]
