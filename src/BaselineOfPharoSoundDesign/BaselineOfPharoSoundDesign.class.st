Class {
	#name : 'BaselineOfPharoSoundDesign',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfPharoSoundDesign',
	#package : 'BaselineOfPharoSoundDesign'
}

{ #category : 'baselines' }
BaselineOfPharoSoundDesign >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'MethodProxies'
			with: [
				spec repository: 'github://Gabriel-Darbord/MethodProxies/src' ];
			baseline: 'Musical'
			with: [
				spec repository: 'github://Gabriel-Darbord/MusicalInstrument/src' ].

		spec
			package: 'PharoSoundDesign' with: 'MusicalInstrument';
			package: 'PharoSoundDesign-Examples' with: 'PharoSoundDesign' ]
]
