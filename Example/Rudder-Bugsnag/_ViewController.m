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

    [[RSClient sharedInstance] track:@"account: created"];
    [[RSClient sharedInstance] track:@"account: authenticated"];
    [[RSClient sharedInstance] track:@"account: signed in"];
    [[RSClient sharedInstance] identify:@"ruchiramoitra" traits:@{@"foo": @"bar", @"foo1": @"bar1", @"email": @"ruchira@gmail.com"} ];
    [[RSClient sharedInstance] screen:@"Screen opened"];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
