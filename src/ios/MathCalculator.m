/********* MathCalculator.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface MathCalculator : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
- (void)add:(CDVInvokedUrlCommand*)command;

@end

@implementation MathCalculator


- (void)add:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSNumber* a = 4; 
    NSNumber* b = 5;
    NSString* total = @(a + b);
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:total];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
