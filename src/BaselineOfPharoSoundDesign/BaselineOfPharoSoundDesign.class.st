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
			baseline: 'MethodProxies' with: [
				spec repository:
						'github://Gabriel-Darbord/MethodProxies:Pharo12/src' ];
			baseline: 'Musical' with: [
				spec repository:
						'github://Gabriel-Darbord/Musical-Instrument:main/src' ].

		spec
			package: 'PharoSoundDesign' with: 'Musical';
			package: 'PharoSoundDesign-Examples' with: 'PharoSoundDesign' ]
]
