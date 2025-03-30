"
Example scenarios to trigger the Pharo sound sesign.
Click on the button left of the class or methods to experience:
- Failing tests by running the full `PSDExample` suite.
- Passing tests by running `testPassing`.
- Errors by running `triggerError`.
- Growl/Toast notifications by running `triggerNotification`.
- Warnings by running `triggerWarning`.

### Implementation Note
There's a reason why the triggering code should not be in the `<script>` pragma directly: it messes up the context for MethodProxies, ultimately ruining the image. Instead, the scripts should run their method normally.
"
Class {
	#name : 'PSDExample',
	#superclass : 'TestCase',
	#category : 'PharoSoundDesign-Examples-Instrumentation',
	#package : 'PharoSoundDesign-Examples',
	#tag : 'Instrumentation'
}

{ #category : 'examples' }
PSDExample >> testFailing [

	self fail
]

{ #category : 'examples' }
PSDExample >> testPassing [
]

{ #category : 'examples' }
PSDExample >> triggerError [

	<script: 'Error signal'>
]

{ #category : 'examples' }
PSDExample >> triggerNotification [

	<script: 'self inform: ''Something happened.'''>
]

{ #category : 'examples' }
PSDExample >> triggerWarning [

	<script: 'Warning signal'>
]
