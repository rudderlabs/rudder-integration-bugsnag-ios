//
//  RudderBugsnagFactory.h
//  Rudder-Bugsnag
//
//  Created by Ruchira Moitra on 02/04/20.
//

#import <Foundation/Foundation.h>
#import <Rudder/RudderIntegrationFactory.h>

NS_ASSUME_NONNULL_BEGIN

@interface RudderBugsnagFactory : NSObject<RudderIntegrationFactory>

+ (instancetype) instance;

@end

NS_ASSUME_NONNULL_END
