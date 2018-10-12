//
//  NSDictionary+QYSafeDictionary.h
//
//
//  Created by Joeyoung on 2018/10/10.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (QYSafeDictionary)

/**
 sample crash code:
 
 NSObject *obj = nil;
 NSDictionary *dic = @{@"key":obj};
 NSDictionary *dic1 = [[NSDictionary alloc] initWithObjectsAndKeys:obj,@"key", nil];
 */

/**
 open dictionary protector.
 */
+ (void)openCrashProtector_dictionary;

@end

NS_ASSUME_NONNULL_END
