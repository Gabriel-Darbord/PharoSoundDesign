Class {
	#name : 'PSDOupsDebugRequestInstrumentation',
	#superclass : 'PSDInstrumentation',
	#category : 'PharoSoundDesign-Instrumentation',
	#package : 'PharoSoundDesign',
	#tag : 'Instrumentation'
}

{ #category : 'evaluating' }
PSDOupsDebugRequestInstrumentation class >> beforeExecutionWithReceiver: receiver arguments: arguments [
	"On natural exceptions, not when debugging using OupsNullException."

	(self silent or: [ receiver exception class == OupsNullException ])
		ifTrue: [ ^ self ].
	receiver exception isResumable
		ifTrue: [
			'DebugResumable' traceCr.
			PSDInstrument playWarning ]
		ifFalse: [
			'DebugError' traceCr.
			PSDInstrument playError ]
]

{ #category : 'matching' }
PSDOupsDebugRequestInstrumentation class >> classMatcher [

	^ OTMatcher identicalTo: OupsDebugRequest
]

{ #category : 'matching' }
PSDOupsDebugRequestInstrumentation class >> methodMatcher [

	^ OTMatcher name: #submit
]

{ #category : 'matching' }
PSDOupsDebugRequestInstrumentation class >> packageMatcher [

	^ OTMatcher identicalTo: OupsDebugRequest package
]
