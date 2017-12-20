#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVPluginResult.h>
#import "CDVClipboard.h"

@implementation CDVClipboard

- (void)copy:(CDVInvokedUrlCommand*)command {
	[self.commandDelegate runInBackground:^{

    NSString     *text       = [command.arguments objectAtIndex:0];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = text;
	}];
}

- (void)paste:(CDVInvokedUrlCommand*)command {
	[self.commandDelegate runInBackground:^{
		UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
		NSString     *text       = [pasteboard valueForPasteboardType:@"public.text"];

	    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:text];
	    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}];
}

@end
