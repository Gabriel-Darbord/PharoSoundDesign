Class {
	#name : 'PSDClyTestCommandInstrumentation',
	#superclass : 'PSDInstrumentation',
	#category : 'PharoSoundDesign-Instrumentation',
	#package : 'PharoSoundDesign',
	#tag : 'Instrumentation'
}

{ #category : 'evaluating' }
PSDClyTestCommandInstrumentation class >> afterExecutionWithReceiver: receiver arguments: arguments returnValue: returnValue [

	self silent ifFalse: [ PSDGrowlMorphInstrumentation silent: false ].
	^ returnValue
]

{ #category : 'evaluating' }
PSDClyTestCommandInstrumentation class >> beforeExecutionWithReceiver: receiver arguments: arguments [

	| result |
	self silent ifTrue: [ ^ self ].
	PSDGrowlMorphInstrumentation silent: true. "avoid overlap"

	result := arguments first.
	result hasPassed
		ifTrue: [ PSDInstrument playTestPassed ]
		ifFalse: [ PSDInstrument playTestFailed ]
]

{ #category : 'matching' }
PSDClyTestCommandInstrumentation class >> classMatcher [

	^ OTMatcher identicalTo: ClyTestCommand
]

{ #category : 'matching' }
PSDClyTestCommandInstrumentation class >> methodMatcher [

	^ OTMatcher name: #notifyUserAboutResults:with:
]

{ #category : 'matching' }
PSDClyTestCommandInstrumentation class >> packageMatcher [

	^ OTMatcher identicalTo: ClyTestCommand package
]
