//
//  QYCrashProtector.h
//  QYCrashProtector <https://github.com/qiaoyoung/QYCrashProtector>
//
//  Created by Joeyoung on 2018/10/8.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QYCrashProtector : NSObject

/**
 open all crash protector.
 */
+ (void)qy_openAllCrashProtector;

/**
 open unrecognized selector protector.
 */
+ (void)qy_openCrashProtector_unrecognized_selector;

/**
 open timer protector.
 */
+ (void)qy_openCrashProtector_timer;

/**
 open container protector.
 */
+ (void)qy_openCrashProtector_container;

/**
 open string protector.
 */
+ (void)qy_openCrashProtector_string;

/**
 open UI protector.
 */
+ (void)qy_openCrashProtector_UI;

@end

NS_ASSUME_NONNULL_END
