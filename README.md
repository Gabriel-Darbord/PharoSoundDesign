# PharoSoundDesign

Sound design for the Pharo IDE.  
Based on the [Musical-Instrument](https://github.com/Gabriel-Darbord/Musical-Instrument) API, which uses [Phausto](https://github.com/lucretiomsp/Phausto) to play sounds live in Pharo, and [OpenTelemetry-Pharo](https://github.com/Gabriel-Darbord/opentelemetry-pharo) to instrument methods without making changes to the original source code.
This project is a prototype for exploring sound design in a live programming environment.

## Installing

As a standalone:
```st
Metacello new
  githubUser: 'Gabriel-Darbord' project: 'PharoSoundDesign' commitish: 'main' path: 'src';
  baseline: 'PharoSoundDesign';
  onWarning: #resume;
  onConflictUseLoaded;
  load
```
As a dependency:
```st
spec baseline: 'PharoSoundDesign' with: [ spec repository: 'github://Gabriel-Darbord/PharoSoundDesign/src' ]
```
Installing Phausto requires additional steps, see on its [wiki](https://github.com/lucretiomsp/phausto/wiki).

## Usage

Enable and disable the sonification by sending the `enable` and `disable` messages to the `PSDInstrumentationModule` class.
When enabled, a specific jingle is played for each of the following events:
- Passing tests
- Failing tests
- Resumable exceptions that open a debugger
- Non-resumable exceptions that open a debugger
- Growl notifications (aka toasts, the text messages that appear discreetly and fade away after some time)

All of these events can be easily triggered using the `PSDExample` class.
