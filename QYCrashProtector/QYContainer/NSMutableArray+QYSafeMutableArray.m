//
//  NSMutableArray+QYSafeMutableArray.m
//   
//
//  Created by Joeyoung on 2018/10/9.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "NSMutableArray+QYSafeMutableArray.h"
#import "QYUtils.h"

@implementation NSMutableArray (QYSafeMutableArray)

+ (void)openCrashProtector_mutableArray {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSArrayM = objc_getClass("__NSArrayM"); // mutableArray
        qy_recognize_sel_instanceMethodSwizzle([__NSArrayM class],
                                               @selector(objectAtIndex:),
                                               @selector(qy_objectAtIndex:));
        qy_recognize_sel_instanceMethodSwizzle([__NSArrayM class],
                                               @selector(objectAtIndexedSubscript:),
                                               @selector(qy_objectAtIndexedSubscript:));
        qy_recognize_sel_instanceMethodSwizzle([__NSArrayM class],
                                               @selector(insertObject:atIndex:),
                                               @selector(qy_insertObject:atIndex:));
        qy_recognize_sel_instanceMethodSwizzle([__NSArrayM class],
                                               @selector(setObject:atIndexedSubscript:),
                                               @selector(qy_setObject:atIndexedSubscript:));
        qy_recognize_sel_instanceMethodSwizzle([__NSArrayM class],
                                               @selector(getObjects:range:),
                                               @selector(qy_getObjects:range:));
        qy_recognize_sel_instanceMethodSwizzle([__NSArrayM class],
                                               @selector(removeObject:),
                                               @selector(qy_removeObject:));
        qy_recognize_sel_instanceMethodSwizzle([__NSArrayM class],
                                               @selector(removeObjectAtIndex:),
                                               @selector(qy_removeObjectAtIndex:));
    });
}

// [array objectAtIndex:index];
- (instancetype)qy_objectAtIndex:(NSUInteger)index {
    id obj = nil;
    @try {
        obj = [self qy_objectAtIndex:index];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        return obj;
    }
}
// arr[index]
- (instancetype)qy_objectAtIndexedSubscript:(NSUInteger)index {
    id obj = nil;
    @try {
        obj = [self qy_objectAtIndexedSubscript:index];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        return obj;
    }
}
// insert
- (void)qy_insertObject:(id)object atIndex:(NSUInteger)idx {
    @try {
        [self qy_insertObject:object atIndex:idx];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        
    }
}
// change
- (void)qy_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    @try {
        [self qy_setObject:obj atIndexedSubscript:idx];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        
    }
}
- (void)qy_getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self qy_getObjects:objects range:range];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        
    }
}
// remove
- (void)qy_removeObject:(id)anObject {
    @try {
        [self qy_removeObject:anObject];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
    
    }
}
- (void)qy_removeObjectAtIndex:(NSUInteger)idx {
    @try {
        [self qy_removeObjectAtIndex:idx];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        
    }
}

@end
