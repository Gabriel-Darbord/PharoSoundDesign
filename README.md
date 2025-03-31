# PharoSoundDesign

Sound design for the Pharo IDE.  
Based on the [Musical-Instrument](https://github.com/Gabriel-Darbord/Musical-Instrument) API, which uses [Phausto](https://github.com/lucretiomsp/Phausto) to play sounds live in Pharo, and [OpenTelemetry-Pharo](https://github.com/Gabriel-Darbord/opentelemetry-pharo) to instrument methods without making changes to the original source code.
This project is a prototype for exploring sound design in a live programming environment.

## Installing

If this is your first time using Pharo, you can install the [Pharo Launcher](https://pharo.org/download) and [follow the instructions](https://pharo-project.github.io/pharo-launcher/create-images/) to create a Pharo 12 image.

As a standalone, execute in a Playground:
```st
Metacello new
  githubUser: 'Gabriel-Darbord' project: 'PharoSoundDesign' commitish: 'main' path: 'src';
  baseline: 'PharoSoundDesign';
  onWarning: #resume;
  onConflictUseLoaded;
  load
```
As a dependency, add to your baseline:
```st
spec baseline: 'PharoSoundDesign' with: [ spec repository: 'github://Gabriel-Darbord/PharoSoundDesign/src' ]
```
> [!IMPORTANT]
> Installing Phausto requires additional steps, see on its [wiki](https://github.com/lucretiomsp/phausto/wiki).

## Usage

Enable and disable the sonification by sending the `enable` and `disable` messages to the `PSDInstrumentationModule` class.
When enabled, a specific cue is played for each of the following events:
- Tests pass
- Tests fail
- A resumable exception opens a debugger, such as a warning
- A non-resumable exception opens a debugger, such as an error
- A notification is displayed (a message that appears briefly to provide information, also known as a growl or toast)

> [!TIP]
> All of these events can be easily triggered using the `PSDExample` class.
