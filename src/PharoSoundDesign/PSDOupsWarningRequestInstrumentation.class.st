Class {
	#name : 'PSDOupsWarningRequestInstrumentation',
	#superclass : 'PSDOupsDebugRequestInstrumentation',
	#category : 'PharoSoundDesign-Instrumentation',
	#package : 'PharoSoundDesign',
	#tag : 'Instrumentation'
}

{ #category : 'evaluating' }
PSDOupsWarningRequestInstrumentation class >> beforeExecutionWithReceiver: receiver arguments: arguments [
	"On natural exceptions, not when debugging using OupsNullException."

	(self silent or: [ receiver exception class == OupsNullException ])
		ifFalse: [ PSDInstrument playWarning ]
]

{ #category : 'matching' }
PSDOupsWarningRequestInstrumentation class >> classMatcher [

	^ OTMatcher identicalTo: OupsWarningRequest
]
