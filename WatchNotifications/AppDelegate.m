//
//  AppDelegate.m
//  WatchNotifications
//
//  Created by Pablo Yaniero on 25/10/15.
//  Copyright © 2015 Pablo Yaniero. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self registerNotificationTypesAndActions];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)registerNotificationTypesAndActions
{
    UIMutableUserNotificationAction *agreeAction = [[UIMutableUserNotificationAction alloc] init];
    
    // Define an ID string to be passed back to your app when you handle the action
    agreeAction.identifier = @"AGREE";
    
    // Localized string displayed in the action button
    agreeAction.title = @"Agree";
    
    // If you need to show UI, choose foreground
    agreeAction.activationMode = UIUserNotificationActivationModeForeground;
    
    // Destructive actions display in red
    agreeAction.destructive = NO;
    
    // Set whether the action requires the user to authenticate
    agreeAction.authenticationRequired = NO;
    
    
    UIMutableUserNotificationAction *disagreeAction = [[UIMutableUserNotificationAction alloc] init];
    disagreeAction.identifier = @"DISAGREE";
    disagreeAction.title = @"Disagree";
    disagreeAction.activationMode = UIUserNotificationActivationModeForeground;
    disagreeAction.destructive = YES;
    disagreeAction.authenticationRequired = NO;
    
    
    // First create the category
    UIMutableUserNotificationCategory *agreeCategory = [[UIMutableUserNotificationCategory alloc] init];
    
    // Identifier to include in your push payload and local notification
    agreeCategory.identifier = @"AGREE_CATEGORY";
    
    // Add the actions to the category and set the action context
    [agreeCategory setActions:@[agreeAction, disagreeAction] forContext: UIUserNotificationActionContextDefault];
    
    
    
    UIMutableUserNotificationAction *yesAction = [[UIMutableUserNotificationAction alloc] init];
    yesAction.identifier = @"YES";
    yesAction.title = @"Yes";
    yesAction.activationMode = UIUserNotificationActivationModeForeground;
    yesAction.destructive = NO;
    yesAction.authenticationRequired = NO;
    
    UIMutableUserNotificationAction *noAction = [[UIMutableUserNotificationAction alloc] init];
    noAction.identifier = @"NO";
    noAction.title = @"No";
    noAction.activationMode = UIUserNotificationActivationModeForeground;
    noAction.destructive = YES;
    noAction.authenticationRequired = NO;
    
    // First create the category
    UIMutableUserNotificationCategory *yesCategory = [[UIMutableUserNotificationCategory alloc] init];
    
    // Identifier to include in your push payload and local notification
    yesCategory.identifier = @"YES_CATEGORY";
    
    // Add the actions to the category and set the action context
    [yesCategory setActions:@[yesAction, noAction] forContext: UIUserNotificationActionContextDefault];
    
    
    NSSet *categories = [NSSet setWithObjects:agreeCategory, yesCategory, nil];
                         
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound |UIUserNotificationTypeAlert;
    
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
}

@end
