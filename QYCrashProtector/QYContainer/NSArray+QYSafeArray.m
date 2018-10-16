//
//  NSArray+QYSafeArray.m
//  QYCrashProtector <https://github.com/qiaoyoung/QYCrashProtector>
//
//  Created by Joeyoung on 2018/10/8.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "NSArray+QYSafeArray.h"
#import "QYUtils.h"

@implementation NSArray (QYSafeArray)

+ (void)openCrashProtector_array {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_swizzling__NSArrayI();
        method_swizzling_NSArray();
        method_swizzling__NSArray0();
        method_swizzling__NSSingleObjectArrayI();
    });
}

#pragma mark - Method Swizzling
void method_swizzling__NSArrayI() {
    Class __NSArrayI = objc_getClass("__NSArrayI"); // array.count > 1
    qy_recognize_sel_instanceMethodSwizzle([__NSArrayI class],
                                           @selector(objectAtIndex:),
                                           @selector(qy_objectAtIndex:));
    qy_recognize_sel_instanceMethodSwizzle([__NSArrayI class],
                                           @selector(objectAtIndexedSubscript:),
                                           @selector(qy_objectAtIndexedSubscript:));
    qy_recognize_sel_instanceMethodSwizzle([__NSArrayI class],
                                           @selector(getObjects:range:),
                                           @selector(qy_getObjects:range:));
}
void method_swizzling_NSArray() {
    qy_recognize_sel_instanceMethodSwizzle([NSArray class], // 'objectsAtIndexes:' method.
                                           @selector(objectsAtIndexes:),
                                           @selector(qy_objectsAtIndexes:));
    qy_recognize_sel_classMethodSwizzle([NSArray class], // literal syntax: @[obj, obj ...];
                                        @selector(arrayWithObjects:count:),
                                        @selector(qy_arrayWithObjects:count:));
}
void method_swizzling__NSArray0() {
    Class __NSArray0 = objc_getClass("__NSArray0"); // array.count = 0
    qy_recognize_sel_instanceMethodSwizzle([__NSArray0 class],
                                           @selector(objectAtIndex:),
                                           @selector(qy_emptyArray_objectAtIndex:));
}
void method_swizzling__NSSingleObjectArrayI() {
    Class __NSSingleObjectArrayI = objc_getClass("__NSSingleObjectArrayI"); // array.count = 1
    qy_recognize_sel_instanceMethodSwizzle([__NSSingleObjectArrayI class],
                                           @selector(objectAtIndex:),
                                           @selector(qy_singleArray_objectAtIndex:));
    qy_recognize_sel_instanceMethodSwizzle([__NSSingleObjectArrayI class],
                                           @selector(getObjects:range:),
                                           @selector(qy_singleArray_getObjects:range:));
}

#pragma mark - Instance Method
// "__NSArrayI" : array.count > 1
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
- (void)qy_getObjects:(id _Nonnull __unsafe_unretained [_Nonnull])objects range:(NSRange)range {
    @try {
        [self qy_getObjects:objects range:range];
    } @catch (NSException *exception) {
         [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        
    }
}

// "__NSArray"
- (NSArray *)qy_objectsAtIndexes:(NSIndexSet *)indexes {
    NSArray *array = nil;
    @try {
        array = [self qy_objectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        return array;
    }
}
// literal syntax: @[obj, obj ...];
+ (instancetype)qy_arrayWithObjects:(const id _Nonnull [_Nonnull])objects count:(NSUInteger)cnt {
    id obj = nil;
    @try {
        obj = [self qy_arrayWithObjects:objects count:cnt];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        return obj;
    }
}

// "__NSArray0" : array.count = 0
- (instancetype)qy_emptyArray_objectAtIndex:(NSUInteger)index {
    id obj = nil;
    @try {
        obj = [self qy_emptyArray_objectAtIndex:index];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        return obj;
    }
}

// "__NSSingleObjectArrayI" : array.count = 1
- (instancetype)qy_singleArray_objectAtIndex:(NSUInteger)index {
    id obj = nil;
    @try {
        obj = [self qy_singleArray_objectAtIndex:index];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        return obj;
    }
}
- (void)qy_singleArray_getObjects:(id _Nonnull __unsafe_unretained [_Nonnull])objects range:(NSRange)range {
    @try {
        [self qy_singleArray_getObjects:objects range:range];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        
    }
}

@end
