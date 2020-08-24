//
//  RudderBugsnagIntegration.h
//  Bugsnag
//
//  Created by Ruchira Moitra on 02/04/20.
//

#import <Foundation/Foundation.h>
#import <Rudder/Rudder.h>

NS_ASSUME_NONNULL_BEGIN

@interface RudderBugsnagIntegration : NSObject<RSIntegration>

@property (nonatomic) BOOL sendEvents;

- (instancetype)initWithConfig:(NSDictionary *)config withAnalytics:(RSClient *)client withRudderConfig:(RSConfig*) rudderConfig;

@end

NS_ASSUME_NONNULL_END
