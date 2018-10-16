//
//  QYCrashLog.h
//  QYCrashProtector <https://github.com/qiaoyoung/QYCrashProtector>
//
//  Created by Joeyoung on 2018/10/9.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QYErrorLog : NSObject

/**
 print exception info.

 @param exception NSException
 */
+ (void)qy_printCrashInfoWithException:(NSException *)exception;

/**
 print unrecognized_selector crash info.

 @param className Class name
 
 @param aSEL Crash reason
 */
+ (void)qy_printCrashInfo_unrecognized_selectorWithClassName:(NSString *)className selector:(SEL)aSEL;

/**
 print KVO crash Info.

 @param className Class name
 
 @param reason Crash reason
 */
+ (void)qy_printCrashInfo_KVOWithClassName:(NSString *)className reason:(NSString *)reason;

@end

NS_ASSUME_NONNULL_END

