#import <Cordova/CDV.h> 
#import <watsonsdk/SpeechToText.h>
#import <watsonsdk/STTConfiguration.h>
#import <watsonsdk/TextToSpeech.h>
#import <watsonsdk/TTSConfiguration.h>

@interface watsonstt : CDVPlugin

@property(nonatomic, strong) CDVInvokedUrlCommand *listeningStatusCallback;
@property(nonatomic, strong) CDVInvokedUrlCommand *voiceLevelCallback;
@property (nonatomic, strong) SpeechToText *stt;
@property (nonatomic, strong) STTConfiguration *conf;
- (void)initialize:(CDVInvokedUrlCommand*)command;
- (void)speechToText:(CDVInvokedUrlCommand*)command;
- (void)listeningStatusCallback:(CDVInvokedUrlCommand*)command;
- (void)voiceLevelCallback:(CDVInvokedUrlCommand*)command; 
- (void)listening_started;
- (void)listening_stopped;
- (void)voice_level:(float)power;
- (void)stopListening:(CDVInvokedUrlCommand*)command;
- (void)stopReocgnize;
@end