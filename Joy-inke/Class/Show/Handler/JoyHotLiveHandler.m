//
//  JoyHotLiveHandler.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/2.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyHotLiveHandler.h"
#import "HttpTool.h"
#import "JoyLive.h"
#import "JoyAdvertise.h"

@implementation JoyHotLiveHandler

+ (void)executeGetAdvertiseWithSuccess:(SuccessBlock)success
                                failed:(FailedBlock)failed {
    
    [HttpTool getWithPath:API_Advertise params:nil success:^(id json) {
        
        NSDictionary * resources = json[@"resources"][0];
        JoyAdvertise * ad = [JoyAdvertise mj_objectWithKeyValues:resources];
        success(ad);
        
    } failure:^(NSError *error) {
        
    }];
}

+ (void)executeGetHotLiveTaskWithPage:(NSInteger)pageNum
                              success:(SuccessBlock)success
                               failed:(FailedBlock)failed {
    
    [HttpTool getWithPath:API_LiveGetTop params:nil success:^(id json) {
        
        NSInteger error = [json[@"dm_error"] integerValue];
        if (!error) {
            
            NSArray * lives = [JoyLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(lives);
            
        } else {
            
            failed(json);
            
        }
    } failure:^(NSError *error) {
        
        failed(error);
    }];
    
}

+ (void)executeNearLiveTaskWithSuccess:(SuccessBlock)success
                                failed:(FailedBlock)failed {
    
    NSDictionary * params = @{@"uid":@"85149891",
                              @"latitude":@"40.090562",
                              @"longitude":@"116.413353"
                              };
    
    [HttpTool getWithPath:API_NearLocation params:params success:^(id json) {
        
        NSInteger error = [json[@"dm_error"] integerValue];
        
        if (!error) {
            
            NSArray * lives = [JoyLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            
            success(lives);
            
        } else {
            
            failed(json);
            
        }
    } failure:^(NSError *error) {
        
        failed(error);
    }];
}

@end
