//
//  _ViewController.m
//  Rudder-Bugsnag
//
//  Created by arnabp92 on 04/02/2020.
//  Copyright (c) 2020 arnabp92. All rights reserved.
//

#import "_ViewController.h"
#import <Rudder/Rudder.h>
#import <Bugsnag/Bugsnag.h>

@interface _ViewController ()

@end

@implementation _ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButtonTap:(UIButton *)sender {
    switch (sender.tag) {
        case 0: {
            [[RSClient sharedInstance] identify:@"test_userid_ios"];
            break;
        case 1: {
            NSDate *birthday = [[NSDate alloc] init];
            [[RSClient sharedInstance] identify:@"test_userid_ios" traits: @{
                @"birthday": birthday,
                @"address": @{
                    @"city": @"Kolkata",
                    @"country": @"India"
                },
                @"firstname": @"First Name",
                @"lastname": @"Last Name",
                @"name": @"Rudder-Bugsnag iOS",
                @"gender": @"Male",
                @"phone": @"0123456789",
                @"email": @"test@gmail.com",
                @"key-1": @"value-1",
                @"key-2": @1234
            }];
        }
            break;
        case 2:
            [[RSClient sharedInstance] track:@"New Track event" properties:@{
                @"key_1" : @"value_1",
                @"key_2" : @"value_2"
            }];
            break;
        case 3:
            [[RSClient sharedInstance] screen:@"Home" properties:@{
                @"key_1" : @"value_1",
                @"key_2" : @"value_2"
            }];
            break;
        case 4:
            [Bugsnag notifyError:[NSError errorWithDomain:@"com.example" code:408 userInfo:nil]];
            break;
        }
    }
}

@end
