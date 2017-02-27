#import "UniqueiOSUDID.h"
#import "KeychainItemWrapper.h"
#import <Cordova/CDV.h>

@implementation UniqueiOSUDID

- (void)getid:(CDVInvokedUrlCommand*)command
{
  CDVPluginResult* pluginResult = nil;
  NSString* msg = nil;

  NSString *appName=[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];
          //

              KeychainItemWrapper* keychain = [[KeychainItemWrapper alloc] initWithIdentifier:
                                               appName
                                                                                  accessGroup:nil];
          //


          if ([keychain objectForKey:( id)kSecValueData]==nil || [[keychain objectForKey:( id)kSecValueData] isEqualToString:@""] )
              {
                  [keychain setObject:[[[UIDevice currentDevice] identifierForVendor] UUIDString] forKey:( id)kSecValueData];
                  [keychain setObject:[[[UIDevice currentDevice] identifierForVendor] UUIDString] forKey:( id)kSecAttrAccount];

              }

      msg = [keychain objectForKey:( id)kSecValueData];

      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
  messageAsString:msg];

  [self.commandDelegate sendPluginResult:pluginResult
callbackId:command.callbackId];
}

@end