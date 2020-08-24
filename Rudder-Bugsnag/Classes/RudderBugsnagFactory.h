//
//  RudderBugsnagFactory.h
//  Rudder-Bugsnag
//
//  Created by Ruchira Moitra on 02/04/20.
//

#import <Foundation/Foundation.h>
#import <Rudder/Rudder.h>

NS_ASSUME_NONNULL_BEGIN

@interface RudderBugsnagFactory : NSObject<RSIntegrationFactory>

+ (instancetype) instance;

@end

NS_ASSUME_NONNULL_END
