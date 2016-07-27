// 


#import "watsonstt.h"
@implementation watsonstt

/**

*/
-(void)initialize : (CDVInvokedUrlCommand*)command
{
    NSDictionary* arguments = [command.arguments objectAtIndex:0];
    
    NSString* username = arguments[@"username"];
    NSString* password = arguments[@"password"];

    self.conf = [[STTConfiguration alloc] init]; 
    [self.conf setBasicAuthUsername:username]; 
    [self.conf setBasicAuthPassword:password];

    //create a instance of speechToText class
    self.stt = [[SpeechToText initWithConfig:self.conf] init];
}

-(void) speechToText:(CDVInvokedUrlCommand*)command
{ 
    //Listening started
    [self listening_started];
    [self.stt recognize:^(NSDictionary* res, NSError* err)
    { 
        if(err == nil) 
        {     
            NSString* result = [self.stt getTranscript:res];

            //Final transcription
            if([self.stt isFinalTranscript:res]) 
            {    
                //End of recognization
                [self.stt endRecognize];

                //Listening Stopped 
                [self listening_stopped];

                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
                pluginResult.keepCallback = @(YES);
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId]; 
            }
            
            NSLog(@"this is the final transcript - %@",result);
        } 
        else 
        {
            NSString* result = [err localizedDescription];
            NSLog(@"this is the final transcript - %@",result);
        } 
    }];

    //Get Voice level
    [self.stt getPowerLevel:^(float power)
    {
        [self voice_level:power];
    }];

};

/**
    set callback methods
    possible status
    * {status:listening_started, value : ""}
    * {status:listening_stopped, value : ""}
*/
 
- (void)listeningStatusCallback : (CDVInvokedUrlCommand*)command
{
    self.listeningStatusCallback = command;
};

/**
set callback methods
*/
- (void)voiceLevelCallback : (CDVInvokedUrlCommand*)command
{
    self.voiceLevelCallback = command;
}; 
/**
    Trigger cordova callback methods
*/
-(void)listening_started
{
    if(self.listeningStatusCallback)
    {
        NSDictionary *message = @{@"status":@"listening_started",@"value": @""};

        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:message];
        result.keepCallback = @(YES);
        [self.commandDelegate sendPluginResult:result
                                    callbackId:self.listeningStatusCallback.callbackId];
    }
}

-(void)listening_stopped
{
    if(self.listeningStatusCallback)
    {
        NSDictionary *message = @{@"status":@"listening_stopped",@"value": @""};
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:message];
        result.keepCallback = @(YES);
        [self.commandDelegate sendPluginResult:result
                                    callbackId:self.listeningStatusCallback.callbackId];
    }
}

-(void)voice_level:(float)power
{
    if(self.voiceLevelCallback)
    { 
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:power];
        result.keepCallback = @(YES);
        [self.commandDelegate sendPluginResult:result
                                    callbackId:self.voiceLevelCallback.callbackId];
    }
}

/**
    Stop listening and initiate recognization
*/
- (void)stopListening:(CDVInvokedUrlCommand*)command
{
    [self performSelector:@selector(stopReocgnize) withObject:nil afterDelay:4.0 ];
}
-(void)stopReocgnize
{
    [self.stt endRecognize];
}
@end
