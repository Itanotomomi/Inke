//
//  JoyBaseHandler.h
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/2.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JoyBaseHandler : NSObject

/**
 *  Handler处理完成后调用的Block
 */
typedef void (^CompleteBlock)();

/**
 *  Handler处理成功时调用的Block
 */
typedef void (^SuccessBlock)(id obj);

/**
 *  Handler处理失败时调用的Block
 */
typedef void (^FailedBlock)(id obj);

@end
