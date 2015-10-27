//
//  InterfaceController.m
//  WatchNotifications WatchKit Extension
//
//  Created by Pablo Yaniero on 25/10/15.
//  Copyright © 2015 Pablo Yaniero. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *saluteLabel;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    [self.saluteLabel setText:@"Hola"];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)setAgree
{
    [self.saluteLabel setText:@"Gracias"];
}

- (void)setDisagree
{
    [self.saluteLabel setText:@"No me simpatisas"];
}

@end



