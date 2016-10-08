//
//  JoyLocationManager.h
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/22.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LocationBlock)(NSString *lat, NSString *lon);

@interface JoyLocationManager : NSObject

+ (instancetype) sharedManager;

- (void)getGPS:(LocationBlock)block;

@property (nonatomic, copy) NSString *lat;
@property (nonatomic, copy) NSString *lon;

@end
