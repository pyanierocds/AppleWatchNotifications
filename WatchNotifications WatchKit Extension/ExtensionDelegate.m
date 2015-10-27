//
//  ExtensionDelegate.m
//  WatchNotifications WatchKit Extension
//
//  Created by Pablo Yaniero on 25/10/15.
//  Copyright © 2015 Pablo Yaniero. All rights reserved.
//

#import "ExtensionDelegate.h"
#import "InterfaceController.h"

@implementation ExtensionDelegate

- (void)applicationDidFinishLaunching {
    // Perform any final initialization of your application.
}

- (void)applicationDidBecomeActive {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillResignActive {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, etc.
}

- (void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)remoteNotification
{
    NSString* apsKeyString = @"aps";
    NSString* categoryKeyString = @"category";
    
    
    // Get the aps dictionary from the payload.
    NSDictionary* apsDict = [remoteNotification objectForKey:apsKeyString];
    
    // Get the alert dictionary from the payload.
    NSString* category = [apsDict objectForKey:categoryKeyString];
    
    
    InterfaceController *root =  (InterfaceController *)[[WKExtension sharedExtension] rootInterfaceController];
    
    if ([category isEqualToString:@"AGREE_CATEGORY"]) {
        if ([identifier isEqualToString:@"AGREE"]) {
            [root setAgree];
        } else if ([identifier isEqualToString:@"DISAGREE"]) {
            [root setDisagree];
        }
    } else if ([category isEqualToString:@"YES_CATEGORY"]) {
        if ([identifier isEqualToString:@"YES"]) {
            [root setAgree];
        } else if ([identifier isEqualToString:@"NO"]) {
            [root setDisagree];
        }
    }
    
    

}

@end
