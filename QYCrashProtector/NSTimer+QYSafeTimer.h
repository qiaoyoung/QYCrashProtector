//
//  NSTimer+QYSafeTimer.h
//   
//
//  Created by Joeyoung on 2018/10/8.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (QYSafeTimer)

/**
 open timer protector.
 */
+ (void)openCrashProtector_timer;

@end
 
