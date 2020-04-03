//
//  _ViewController.m
//  Rudder-Bugsnag
//
//  Created by arnabp92 on 04/02/2020.
//  Copyright (c) 2020 arnabp92. All rights reserved.
//

#import "_ViewController.h"
#import <Rudder/Rudder.h>

@interface _ViewController ()

@end

@implementation _ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [[RudderClient sharedInstance] track:@"account: created"];
    [[RudderClient sharedInstance] track:@"account: authenticated"];
    [[RudderClient sharedInstance] track:@"account: signed in"];
    [[RudderClient sharedInstance] identify:@"ruchiramoitra" traits:@{@"foo": @"bar", @"foo1": @"bar1", @"email": @"ruchira@gmail.com"} ];
    [[RudderClient sharedInstance] screen:@"Screen opened"];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
