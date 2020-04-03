//
//  RudderBugsnagFactory.m
//  Rudder-Bugsnag
//
//  Created by Ruchira Moitra on 02/04/20.
//

#import "RudderBugsnagFactory.h"
#import "RudderBugsnagIntegration.h"
#import "RudderLogger.h"

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

- (nonnull id<RudderIntegration>)initiate:(nonnull NSDictionary *)config client:(nonnull RudderClient *)client rudderConfig:(nonnull RudderConfig *)rudderConfig {
    [RudderLogger logDebug:@"Creating RudderIntegrationFactory"];
    return [[RudderBugsnagIntegration alloc] initWithConfig:config withAnalytics:client withRudderConfig:rudderConfig];
}

@end




