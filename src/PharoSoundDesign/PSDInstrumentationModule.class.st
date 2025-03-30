Class {
	#name : 'PSDInstrumentationModule',
	#superclass : 'OTMusicalInstrumentationModule',
	#category : 'PharoSoundDesign-Instrumentation',
	#package : 'PharoSoundDesign',
	#tag : 'Instrumentation'
}

{ #category : 'accessing' }
PSDInstrumentationModule class >> instrumentations [
	"My subclasses must return the list of Instrumentations contained in the module."

	^ PSDInstrumentation allSubclasses
]

{ #category : 'accessing' }
PSDInstrumentationModule class >> musicalInstruments [

	^ { PSDInstrument }
]
