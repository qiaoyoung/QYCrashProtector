//
//  NSCache+QYSafeCache.m
//   
//
//  Created by Joeyoung on 2018/10/11.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "NSCache+QYSafeCache.h"
#import "QYUtils.h"

@implementation NSCache (QYSafeCache)

+ (void)openCrashProtector_cache {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        qy_recognize_sel_instanceMethodSwizzle([NSCache class],
                                               @selector(setObject:forKey:cost:),
                                               @selector(qy_setObject:forKey:cost:));
    });
}

- (void)qy_setObject:(id)obj forKey:(id)key cost:(NSUInteger)g {
    @try {
        [self qy_setObject:obj forKey:key cost:g];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        
    }
}


@end
