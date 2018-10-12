//
//  NSTimer+QYSafeTimer.m
//   
//
//  Created by Joeyoung on 2018/10/8.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "NSTimer+QYSafeTimer.h"
#import "QYUtils.h"


@implementation NSTimer (QYSafeTimer)

+ (void)openCrashProtector_timer {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        qy_recognize_sel_classMethodSwizzle([self class],
                                            @selector(scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:),
                                            @selector(qy_scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:));
        qy_recognize_sel_classMethodSwizzle([self class],
                                            @selector(timerWithTimeInterval:target:selector:userInfo:repeats:),
                                            @selector(qy_timerWithTimeInterval:target:selector:userInfo:repeats:));
    });
}

+ (NSTimer *)qy_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    YYWeakProxy *proxy = [YYWeakProxy proxyWithTarget:aTarget];
    return [NSTimer qy_scheduledTimerWithTimeInterval:ti target:proxy selector:aSelector userInfo:userInfo repeats:yesOrNo];
}

+ (NSTimer *)qy_timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    YYWeakProxy *proxy = [YYWeakProxy proxyWithTarget:aTarget];
    return [NSTimer qy_timerWithTimeInterval:ti target:proxy selector:aSelector userInfo:userInfo repeats:yesOrNo];
}

@end
