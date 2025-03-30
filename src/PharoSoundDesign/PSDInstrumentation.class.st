Class {
	#name : 'PSDInstrumentation',
	#superclass : 'OTMethodProxyInstrumentation',
	#classInstVars : [
		'silent'
	],
	#category : 'PharoSoundDesign-Instrumentation',
	#package : 'PharoSoundDesign',
	#tag : 'Instrumentation'
}

{ #category : 'testing' }
PSDInstrumentation class >> isAbstract [

	^ self == PSDInstrumentation
]

{ #category : 'accessing' }
PSDInstrumentation class >> silent [

	^ silent ifNil: [ silent := false ]
]

{ #category : 'accessing' }
PSDInstrumentation class >> silent: aBoolean [

	silent := aBoolean
]
