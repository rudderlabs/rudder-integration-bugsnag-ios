//
//  RudderBugsnagFactory.m
//  Rudder-Bugsnag
//
//  Created by Ruchira Moitra on 02/04/20.
//

#import "RudderBugsnagFactory.h"
#import "RudderBugsnagIntegration.h"

@implementation RudderBugsnagFactory

static RudderBugsnagFactory *sharedInstance;

+ (instancetype)instance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (nonnull NSString *)key {
    return @"Bugsnag";
}

- (nonnull id<RSIntegration>)initiate:(nonnull NSDictionary *)config client:(nonnull RSClient *)client rudderConfig:(nonnull RSConfig *)rudderConfig {
    [RSLogger logDebug:@"Creating RudderIntegrationFactory"];
    return [[RudderBugsnagIntegration alloc] initWithConfig:config withAnalytics:client withRudderConfig:rudderConfig];
}

@end




