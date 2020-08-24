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

- (instancetype) initWithConfig:(NSDictionary *)config withAnalytics:(nonnull RSClient *)client  withRudderConfig:(nonnull RSConfig *)rudderConfig {
    self = [super init];
    if(self){
        NSString *apiKey = [config objectForKey:@"apiKey"];
        [Bugsnag startBugsnagWithApiKey:apiKey];
        [RSLogger logDebug:@"Initializing Bugsnag SDK"];
    }
    return self;
}

- (void) dump:(RSMessage *)message {
    @try {
        if (message != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self processRudderEvent:message];
            });
        }
    } @catch (NSException *ex) {
        [RSLogger logError:[[NSString alloc] initWithFormat:@"%@", ex]];
    }
}

- (void) processRudderEvent: (nonnull RSMessage *) message {
    NSString *type = message.type;
    
    if ([type isEqualToString:@"identify"]) {
        NSDictionary *properties = message.context.traits;
        properties = [self filterProperties:properties];
        if(properties!=nil){
            id name = [properties objectForKey:@"name"];
            id email = [properties objectForKey:@"email"];
            [[Bugsnag configuration] setUser:message.userId withName:name andEmail:email];
            
            for (NSString *key in properties) {
                NSString *value = [properties objectForKey:key];
                [Bugsnag addAttribute:key withValue:value toTabWithName:@"user"];
            }
        }
    }
    else if ([type isEqualToString:@"screen"]){
        [[Bugsnag configuration] setContext:message.event];
    }
    else if([type isEqualToString:@"track"]){
        [Bugsnag leaveBreadcrumbWithMessage:message.event];
    }
    else {
        [RSLogger logDebug:@"Bugsnag Integration: Message Type not supported"];
    }
}

- (NSDictionary*) filterProperties: (NSDictionary*) properties {
    NSMutableDictionary *filteredProperties = nil;
    if (properties != nil) {
        filteredProperties = [[NSMutableDictionary alloc] init];
        for (NSString *key in properties.allKeys) {
            id val = properties[key];
            if ([val isKindOfClass:[NSString class]] || [val isKindOfClass:[NSNumber class]]) {
                filteredProperties[key] = val;
            }
        }
    }
    return filteredProperties;
}

- (void)reset {
    [Bugsnag clearBreadcrumbs];
}

@end




