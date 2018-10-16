//
//  NSMutableDictionary+QYSafeMutableDictionary.h
//  QYCrashProtector <https://github.com/qiaoyoung/QYCrashProtector>
//
//  Created by Joeyoung on 2018/10/10.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (QYSafeMutableDictionary)

/**
 sample crash code:
 
 NSObject *obj = nil;
 NSMutableDictionary *dic = [@{@"key1":@"test"} mutableCopy];
 NSMutableDictionary *dic1 = [@{@"key1":obj} mutableCopy];
 [dic removeObjectForKey:nil];
 dic[obj] = @"123";
 */

/**
 open mutableDictionary protector.
 */
+ (void)openCrashProtector_mutableDictionary;

@end

NS_ASSUME_NONNULL_END
