//
//  RudderBugsnagIntegration.m
//  Bugsnag
//
//  Created by Ruchira Moitra on 02/04/20.
//

#import "RudderBugsnagIntegration.h"
#import "RudderLogger.h"
#import <Bugsnag/Bugsnag.h>

@implementation RudderBugsnagIntegration

#pragma mark - Initialization

- (instancetype) initWithConfig:(NSDictionary *)config withAnalytics:(nonnull RudderClient *)client  withRudderConfig:(nonnull RudderConfig *)rudderConfig {
    self = [super init];
    if(self){
        NSString *apiKey = [config objectForKey:@"apiKey"];
        self.sendEvents = [[config objectForKey:@"useNativeSDK"] boolValue];
        [Bugsnag startBugsnagWithApiKey:apiKey];
        [RudderLogger logDebug:@"Initializing Bugsnag SDK"];
      
    }
    
    return self;
    
}

- (void) dump:(RudderMessage *)message {
    @try {
         [RudderLogger logDebug:@"sendEvents"];
        
         
           if (self.sendEvents && message != nil) {
               [RudderLogger logDebug:@"Entered dump"];
                dispatch_async(dispatch_get_main_queue(), ^{
                  [self processRudderEvent:message];
                });
            }
         [RudderLogger logDebug:@"outside dump"];
        } @catch (NSException *ex) {
           [RudderLogger logError:[[NSString alloc] initWithFormat:@"%@", ex]];
        }
  
}




- (void) processRudderEvent: (nonnull RudderMessage *) message {
    [RudderLogger logDebug:@"Message type is: "];
    
     NSString *type = message.type;
    [RudderLogger logDebug:type];
     
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
      //  [Bugsnag notifyError:[NSError errorWithDomain:@"com.example" code:408 userInfo:nil]];
        
    }
    else if([type isEqualToString:@"track"]){
        
        [Bugsnag leaveBreadcrumbWithMessage:message.event];
        //[Bugsnag notifyError:[NSError errorWithDomain:@"com.example" code:408 userInfo:nil]];
        
    }
}


- (NSDictionary*) filterProperties: (NSDictionary*) properties {
    if (properties != nil) {
        NSMutableDictionary *filteredProperties = [[NSMutableDictionary alloc] init];
        for (NSString *key in properties.allKeys) {
            id val = properties[key];
            if ([val isKindOfClass:[NSString class]] || [val isKindOfClass:[NSNumber class]]) {
                filteredProperties[key] = val;
            }
        }
        return filteredProperties;
    } else {
        return nil;
    }
}

- (void)reset {
    [Bugsnag clearBreadcrumbs];
}

@end




