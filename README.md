

#cordova-plugin-watsonstt


This plugin is a wrapper of a [IBM Watson Speech-To-Text IOS SDK](https://github.com/watson-developer-cloud/speech-ios-sdk#speech-to-text)

----------

* [Installation](#installation) 
* [API](#api) 
* [Supported Languages](#supported-languages) 

#Installation

```shell
cordova plugin add https://github.com/slicebread/watson-speech-to-text-cordova
```

#Api
```
WatsonSTT.init 
```
Init method example :

```javascript
/**
 * Init method
 * @param (Object) {username : '', password : ''}
 * @param (Function) Success Callback
 * @param (Function) Error Callback
 */
 WatsonSTT.init({username : '', password: ''}, success, error);
```
----------
```
WatsonSTT.speechToText
```
SpeechToText method example : 

```javascript
/**
 * SpeechToText method
 * @param (Function)- callback for success `function (context) {}` 
 * @param (Function)- callback for error `function (error) {}` 
 */
 WatsonSTT.speechToText(function(context){
	 //context
 }, error);
```
----------
```
WatsonSTT.setListeningStatusCallback
```
SetListeningStatusCallback method example :

```javascript
/**
 * SetListeningStatusCallback method
 * events : listening_started, listening_ended
 * @param (Function)- callback on success`
 */
 WatsonSTT.setListeningStatusCallback(function(param){

 //{status : 'listening_started', value : '',
 //status : 'listening_stopped', value : '',} 

 });
```
----------
```
WatsonSTT.setVoiceLevelCallback
```
```javascript
/**
 * setVoiceLevelCallback method 
 * @param (Function)- callback to get voice level`
 */
 WatsonSTT.setVoiceLevelCallback(function(voiceLevel){

 });
```
#Supported Platforms

- iOS 

   