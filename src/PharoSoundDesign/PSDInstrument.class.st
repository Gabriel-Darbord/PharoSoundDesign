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

	This sequence forms the critical error sound, which is designed as an intensified and unresolved variation of the warning jingle.
	It begins with F4 and moves to B4, creating a tritone that establishes immediate tension.
	The descent from B4 to D4, a minor sixth, reinforces a somber tone and suggests failure or collapse.
	Unlike the warning sound, this jingle lacks a tonal center or resolution, leaving the sequence open-ended and unsettling.
	Its severity is high: the goal is to convey that something has broken irreversibly.
	The emotional tone is serious and unresolved, and the sequence ends abruptly to reflect the system's inability to recover."

	[
	| sustain delay |
	sustain := Delay forMilliseconds: 100.
	delay := Delay forMilliseconds: 10.

	"F4"
	self playFrequency: 349.0 for: sustain.
	delay wait.

	"B4"
	self playFrequency: 494.0 for: sustain.
	delay wait.

	"D4"
	self playFrequency: 294.0 for: (Delay forMilliseconds: 200) ]
		forkAt: 70
]

{ #category : 'playing' }
PSDInstrument class >> playFrequency: frequency for: duration [
	"Synchronously trigger this instrument at a given frequency and for a given duration."

	Dsp setValue: frequency parameterIndex: freq.
	Dsp setValue: 1 parameterIndex: gate.
	duration wait.
	Dsp setValue: 0 parameterIndex: gate
]

{ #category : 'playing' }
PSDInstrument class >> playNotify [
	"Note: E5 (660 Hz)

	This cue consists of a single note used to inform the user of a new notification.
	As the perfect fifth above A4, E5 has a stable and pleasant character, making it ideal for non-intrusive cues.
	The cue is short and bright enough to cut through ambient noise without becoming shrill or demanding.
	The goal is to gently draw the user's attention to something that may be acknowledged but is not urgent,
	serving the same purpose as a visual badge or tooltip in auditory form."

	[ "E5" self playFrequency: 660.0 for: (Delay forMilliseconds: 10) ]
		forkAt: 70
]

{ #category : 'playing' }
PSDInstrument class >> playTestFailed [
	"Note 1: D5 (587 Hz)
	Note 2: B4 (494 Hz)

	This sound indicates a failed test with a descending minor third interval from D5 to B4.
	The drop suggests caution or concern without being overly dramatic or alarming.
	It is meant to convey that something has gone wrong with the test run, but without the emotional weight of a critical failure.
	By keeping the frequency range close to the test pass signal, the overall sound palette remains consistent.
	The primary distinguishing feature is the downward motion, which conveys failure through subtle dissonance."

	[
	| sustain delay |
	sustain := Delay forMilliseconds: 170.
	delay := Delay forMilliseconds: 10.

	"D5"
	self playFrequency: 587.0 for: sustain.
	delay wait.

	"B4"
	self playFrequency: 494.0 for: sustain ] forkAt: 70
]

{ #category : 'playing' }
PSDInstrument class >> playTestPassed [
	"Note 1: A4 (440 Hz)
	Note 2: C#5 (554 Hz)
	Note 3: E5 (659 Hz)

	This ascending sequence forms an A major triad, played as an arpeggio.
	The major third and perfect fifth intervals create a sense of forward motion and positivity without sounding exuberant.
	It is intended to communicate that tests have passed successfully, using an upward gesture to suggest progression and resolution.
	Although alternatives in other keys are possible, the emphasis is on the directional character of the phrase: a gentle, encouraging cue that remains restrained."

	[
	| sustain delay |
	sustain := Delay forMilliseconds: 100.
	delay := Delay forMilliseconds: 10.

	"A4"
	self playFrequency: 440.0 for: sustain.
	delay wait.

	"C#5"
	self playFrequency: 554.0 for: sustain.
	delay wait.

	"E5"
	self playFrequency: 659.0 for: sustain ] forkAt: 70
]

{ #category : 'playing' }
PSDInstrument class >> playWarning [
	"Note 1: F4 (349 Hz)
	Note 2: B4 (494 Hz)

	This cue signals a warning, such as when the debugger opens due to a resumable exception.
	It uses the interval of a tritone — six semitones apart — which creates tension and ambiguity.
	The emotional intent is to alert the user that something undesirable has occurred, but recovery is possible.
	The cue is designed to be noticeable and slightly tense, but not aggressive or alarming.
	It reflects moderate severity, emphasizing concern without implying irreversibility."

	[
	| delay |
	delay := Delay forMilliseconds: 10.

	"F4"
	self playFrequency: 349.0 for: (Delay forMilliseconds: 100).
	delay wait.

	"B4"
	self playFrequency: 494.0 for: (Delay forMilliseconds: 200) ]
		forkAt: 70
]
