//
//  NSMutableDictionary+QYSafeMutableDictionary.m
//  QYCrashProtector <https://github.com/qiaoyoung/QYCrashProtector>
//
//  Created by Joeyoung on 2018/10/10.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "NSMutableDictionary+QYSafeMutableDictionary.h"
#import "QYUtils.h"

@implementation NSMutableDictionary (QYSafeMutableDictionary)

+ (void)openCrashProtector_mutableDictionary {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSDictionaryM = NSClassFromString(@"__NSDictionaryM");
        qy_recognize_sel_instanceMethodSwizzle([__NSDictionaryM class],
                                               @selector(setObject:forKey:),
                                               @selector(qy_setObject:forKey:));
        qy_recognize_sel_instanceMethodSwizzle([__NSDictionaryM class],
                                               @selector(setObject:forKeyedSubscript:),
                                               @selector(qy_setObject:forKeyedSubscript:));
        qy_recognize_sel_instanceMethodSwizzle([__NSDictionaryM class],
                                               @selector(removeObjectForKey:),
                                               @selector(qy_removeObjectForKey:));
    });
}

- (void)qy_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    @try {
        [self qy_setObject:anObject forKey:aKey];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        
    }
}

- (void)qy_setObject:(nullable id)obj forKeyedSubscript:(id<NSCopying>)key {
    @try {
        [self qy_setObject:obj forKeyedSubscript:key];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        
    }
}

- (void)qy_removeObjectForKey:(id)aKey {
    @try {
        [self qy_removeObjectForKey:aKey];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        
    }
}

@end
