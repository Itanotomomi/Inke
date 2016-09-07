//
//  JoyHotLiveHandler.h
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/2.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyBaseHandler.h"

@interface JoyHotLiveHandler : JoyBaseHandler

//下载广告
+ (void)executeGetAdvertiseWithSuccess:(SuccessBlock)success
                                failed:(FailedBlock)failed;

//热门
+ (void)executeGetHotLiveTaskWithPage:(NSInteger)pageNum
                              success:(SuccessBlock)success
                               failed:(FailedBlock)failed;

//附近
+ (void)executeNearLiveTaskWithSuccess:(SuccessBlock)success
                                failed:(FailedBlock)failed;

@end
