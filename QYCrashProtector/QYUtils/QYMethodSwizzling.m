//
//  QYMethodSwizzling.m
//  QYCrashProtector <https://github.com/qiaoyoung/QYCrashProtector>
//
//  Created by Joeyoung on 2018/10/8.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "QYMethodSwizzling.h"

@implementation QYMethodSwizzling

BOOL qy_recognize_sel_instanceMethodSwizzle(Class aClass, SEL originalSelector, SEL swizzleSelector) {
    Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
    Method swizzleMethod = class_getInstanceMethod(aClass, swizzleSelector);
    BOOL didAddMethod = class_addMethod(aClass,
                                        originalSelector,
                                        method_getImplementation(swizzleMethod),
                                        method_getTypeEncoding(swizzleMethod));
    if (didAddMethod) {
        class_replaceMethod(aClass,
                            swizzleSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
    return YES;
}

BOOL qy_recognize_sel_classMethodSwizzle(Class aClass, SEL originalSelector, SEL swizzleSelector) {
    Method originalMethod = class_getClassMethod(aClass, originalSelector);
    Method swizzleMethod = class_getClassMethod(aClass, swizzleSelector);
    Class metaClass = objc_getMetaClass(NSStringFromClass(aClass).UTF8String);
    BOOL didAddMethod = class_addMethod(metaClass,
                                        originalSelector,
                                        method_getImplementation(swizzleMethod),
                                        method_getTypeEncoding(swizzleMethod));
    if (didAddMethod) {
        class_replaceMethod(metaClass,
                            swizzleSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
    return YES;
}

@end
