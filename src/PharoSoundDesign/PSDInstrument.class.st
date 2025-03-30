Class {
	#name : 'PSDInstrument',
	#superclass : 'MusicalInstrument',
	#classInstVars : [
		'freq',
		'gate'
	],
	#category : 'PharoSoundDesign-Instrument',
	#package : 'PharoSoundDesign',
	#tag : 'Instrument'
}

{ #category : 'configuring' }
PSDInstrument class >> configure [

	| parameters |
	parameters := Dsp parameters.
	freq := parameters at: 'ChordyNote'.
	gate := parameters at: 'ChordyGate'.

	Dsp setValue: 0.0 parameterIndex: (parameters at: 'ChordyAttack').
	Dsp setValue: 0.1 parameterIndex: (parameters at: 'ChordyDecay').
	Dsp setValue: 0.1 parameterIndex: (parameters at: 'ChordyRelease')
]

{ #category : 'instance creation' }
PSDInstrument class >> instrument [
	"| lfo synth |
	lfo := LFOSawPos new
		       offset: 200;
		       amount: 700;
		       freq: 8.
	synth := (SineOsc new freq: lfo) => (ADSREnv new trigger: #gate).
	^ synth"

	^ Chordy new
]

{ #category : 'accessing' }
PSDInstrument class >> instrumentName [

	^ 'Chordy'
]

{ #category : 'playing' }
PSDInstrument class >> play [

	Dsp trig: 'ChordyGate' for: 0.5
]

{ #category : 'playing' }
PSDInstrument class >> playError [
	"Note 1: F4 (349 Hz) | Start (tense root)
	Note 2: B4 (494 Hz)  | Tritone tension
	Note 3: D4 (294 Hz)  | Drop to instability

	The error sound is an amplified, unresolved variation of the warning sound.
	The descent from B4 to D4 is a minor sixth, which adds to the somber tone and gives the impression of something falling or failing.
	The lack of a tonal center (no perfect fifth or resolution) leaves the sequence open-ended and unresolved.
	
	# Semantic Goal
	Severity: High, something broke
	Emotion: Serious, unresolved
	Tension: Needs to feel more dissonant and unsettling
	Resolution: No resolution, the sound should end abruptly or trail off unnaturally"

	[
	| sustain delay |
	sustain := Delay forMilliseconds: 100.
	delay := Delay forMilliseconds: 10.

	"F4"
	Dsp setValue: 349.0 parameterIndex: freq.
	Dsp setValue: 1 parameterIndex: gate.
	sustain wait.
	Dsp setValue: 0 parameterIndex: gate.
	delay wait.

	"B4"
	Dsp setValue: 494.0 parameterIndex: freq.
	Dsp setValue: 1 parameterIndex: gate.
	sustain wait.
	Dsp setValue: 0 parameterIndex: gate.
	delay wait.

	"D4"
	Dsp setValue: 294.0 parameterIndex: freq.
	Dsp setValue: 1 parameterIndex: gate.
	(Delay forMilliseconds: 200) wait.
	Dsp setValue: 0 parameterIndex: gate ] forkAt: 70
]

{ #category : 'playing' }
PSDInstrument class >> playNotify [
	"Note: E5 (660 Hz)

	A quick middle-high note to inform the user that there is something to acknowledge.
	For a toast/growl-style notification, the sound should be subtle, brief, and easily distinguishable from error or success signals.
	Its purpose is not to demand immediate action, but to gently draw the user’s attention to new information.
	Something akin to a visual badge or tooltip, but in auditory form.
	As the perfect fifth above A4, E5 has a naturally stable and pleasant character, making it ideal for informative notifications that don’t carry emotional weight.

	# Semantic Goal
	Purpose: Indicate the presence of a message or event that may be acknowledged but is not urgent.
	Emotional Tone: Neutral-to-positive.
	Auditory Characteristics:
	- Short and non-intrusive.
	- High enough in pitch to cut through ambient sounds, but not shrill."

	[
	Dsp setValue: 660 parameterIndex: freq.
	Dsp setValue: 1 parameterIndex: gate.
	(Delay forMilliseconds: 10) wait.
	Dsp setValue: 0 parameterIndex: gate ] forkAt: 70
]

{ #category : 'playing' }
PSDInstrument class >> playTestFailed [
	"Note 1: D5 (587 Hz)
	Note 2: B4 (494 Hz)
	This descending pair creates a minor third drop, which can evoke a subtle sense of dissonance or caution.
	The interval isn’t overly dramatic but is distinct enough to communicate that something has gone awry.
	By keeping the frequency range near that of the passing signal, the overall sound remains consistent, and the change in direction (ascending versus descending) is what primarily cues the user."

	[
	| sustain delay |
	sustain := Delay forMilliseconds: 170.
	delay := Delay forMilliseconds: 10.

	"D5"
	Dsp setValue: 587.0 parameterIndex: freq.
	Dsp setValue: 1 parameterIndex: gate.
	sustain wait.
	Dsp setValue: 0 parameterIndex: gate.
	delay wait.

	"B4"
	Dsp setValue: 494.0 parameterIndex: freq.
	Dsp setValue: 1 parameterIndex: gate.
	sustain wait.
	Dsp setValue: 0 parameterIndex: gate ] forkAt: 70
]

{ #category : 'playing' }
PSDInstrument class >> playTestPassed [
	"Note 1: A4 (440 Hz)
	Note 2: C#5 (554 Hz)
	Note 3: E5 (659 Hz)
	This sequence produces an arpeggiated A major chord.
	The intervals (a major third and a perfect fifth from the base note) provide a gentle uplift without sounding overly exuberant.
	Alternatively, you could choose a similar pattern in a different key if you prefer a slightly different character; the important part is the upward motion that suggests progression or success."

	[
	| sustain delay |
	sustain := Delay forMilliseconds: 100.
	delay := Delay forMilliseconds: 10.

	"A4"
	Dsp setValue: 440.0 parameterIndex: freq.
	Dsp setValue: 1 parameterIndex: gate.
	sustain wait.
	Dsp setValue: 0 parameterIndex: gate.
	delay wait.

	"C#5"
	Dsp setValue: 554.0 parameterIndex: freq.
	Dsp setValue: 1 parameterIndex: gate.
	sustain wait.
	Dsp setValue: 0 parameterIndex: gate.
	delay wait.

	"E5"
	Dsp setValue: 659.0 parameterIndex: freq.
	Dsp setValue: 1 parameterIndex: gate.
	sustain wait.
	Dsp setValue: 0 parameterIndex: gate ] forkAt: 70
]

{ #category : 'playing' }
PSDInstrument class >> playWarning [
	"Note 1: F4 (349 Hz)
	Note 2: B4 (494 Hz)
	For a resumable exception, we aim to signal a warning: something undesirable has happened, but the user can likely recover from it.
	The tritone spans six semitones and sounds unresolved—perfect for a situation where something went wrong, but not fatally so.
	
	# Semantic Goal
	Severity: Moderate, needs attention but not panic
	Emotion: Concern, not catastrophe
	Actionability: The user can resume, so signal that recovery is possible
	Sound quality: Noticeable, slightly tense, not aggressive"

	[ "F4"
	Dsp setValue: 349.0 parameterIndex: freq.
	Dsp setValue: 1 parameterIndex: gate.
	(Delay forMilliseconds: 100) wait.
	Dsp setValue: 0 parameterIndex: gate.
	(Delay forMilliseconds: 10) wait.

	"B4"
	Dsp setValue: 494.0 parameterIndex: freq.
	Dsp setValue: 1 parameterIndex: gate.
	(Delay forMilliseconds: 200) wait.
	Dsp setValue: 0 parameterIndex: gate ] forkAt: 70
]
