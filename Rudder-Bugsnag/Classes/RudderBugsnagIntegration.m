//
//  RudderBugsnagIntegration.m
//  Bugsnag
//
//  Created by Ruchira Moitra on 02/04/20.
//

#import "RudderBugsnagIntegration.h"
#import <Bugsnag/Bugsnag.h>

@implementation RudderBugsnagIntegration

#pragma mark - Initialization

- (instancetype)initWithConfig:(NSDictionary *)config withAnalytics:(RSClient *)client withRudderConfig:(RSConfig *)rudderConfig {
    self = [super init];
    if (self) {
        NSString *apiKey = [config objectForKey:@"apiKey"];
        [Bugsnag startWithApiKey:apiKey];
        [RSLogger logDebug:@"Initializing Bugsnag SDK"];
    }
    return self;
}

- (void)dump:(RSMessage *)message {
    @try {
        if (message != nil) {
            [self processRudderEvent:message];
        }
    } @catch (NSException *ex) {
        [RSLogger logError:[[NSString alloc] initWithFormat:@"%@", ex]];
    }
}

- (void)processRudderEvent:(nonnull RSMessage *)message {
    NSString *type = message.type;
    
    if ([type isEqualToString:@"identify"]) {
        NSDictionary *traits = message.context.traits;
        traits = [self filterTraits:traits];
        if (traits != nil) {
            id name = [traits objectForKey:@"name"];
            id email = [traits objectForKey:@"email"];
            [Bugsnag setUser:message.userId withEmail:email andName:name];
            
            for (NSString *key in traits) {
                NSString *value = [traits objectForKey:key];
                [Bugsnag addMetadata:value withKey:key toSection:@"user"];
            }
        }
    } else if ([type isEqualToString:@"screen"]) {
        if (message.event != nil)
            [Bugsnag leaveBreadcrumbWithMessage:[NSString stringWithFormat:@"Viewed %@ Screen", message.event]];
    } else if([type isEqualToString:@"track"]) {
        if (message.event != nil)
            [Bugsnag leaveBreadcrumbWithMessage:message.event];
    } else {
        [RSLogger logDebug:@"Bugsnag Integration: Message Type not supported"];
    }
}

- (NSDictionary*)filterTraits:(NSDictionary*)traits {
    NSMutableDictionary *filteredProperties = nil;
    if (traits != nil) {
        filteredProperties = [[NSMutableDictionary alloc] init];
        for (NSString *key in traits.allKeys) {
            id val = traits[key];
            if ([val isKindOfClass:[NSString class]] || [val isKindOfClass:[NSNumber class]]) {
                filteredProperties[key] = val;
            }
        }
    }
    return filteredProperties;
}

- (void)reset {
    [Bugsnag clearMetadataFromSection:@"user"];
    [Bugsnag clearFeatureFlags];
}

@end




