//
//  YesNotificationController.m
//  WatchNotifications
//
//  Created by Pablo Yaniero on 25/10/15.
//  Copyright © 2015 Pablo Yaniero. All rights reserved.
//

#import "YesNotificationController.h"

@interface YesNotificationController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *titleLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *messageLabel;

@end

@implementation YesNotificationController

- (instancetype)init {
    self = [super init];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

/*
- (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a local notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification interface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}
*/


- (void)didReceiveRemoteNotification:(NSDictionary *)remoteNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    
    NSString* apsKeyString = @"aps";
    NSString* alertKeyString = @"alert";
    NSString* bodyKeyString = @"body";
    NSString* titleKeyString = @"title";

    
    // Get the aps dictionary from the payload.
    NSDictionary* apsDict = [remoteNotification objectForKey:apsKeyString];
    
    // Get the alert dictionary from the payload.
    NSDictionary* alertDict = [apsDict objectForKey:alertKeyString];
    
    // Retrieve the title of the notification.
    NSString* titleString = [alertDict objectForKey:titleKeyString];
    [self.titleLabel setText:titleString];

    // Retrieve the body of the notification.
    NSString* bodyString = [alertDict objectForKey:bodyKeyString];
    [self.messageLabel setText:bodyString];
    
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}


@end



