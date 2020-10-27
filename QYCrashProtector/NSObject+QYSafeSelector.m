//
//  NSObject+QYSafeSelector.m
//  QYCrashProtector <https://github.com/qiaoyoung/QYCrashProtector>
//
//  Created by Joeyoung on 2018/10/8.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "NSObject+QYSafeSelector.h"
#import "QYUtils.h"
 
#define force_inline __inline__ __attribute__((always_inline))

static NSString *unrecognized_className;
static Class QY_DynamicClass;

@implementation NSObject (QYSafeSelector)

+ (void)openCrashProtector_unrecognized_selector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        qy_recognize_sel_instanceMethodSwizzle([self class],
                                               @selector(forwardingTargetForSelector:),
                                               @selector(qy_forwardingTargetForSelector:));
    });
}

/**
 method swizzling

 @param aSelector SEL
 @return target
 */
- (id)qy_forwardingTargetForSelector:(SEL)aSelector {
    id target = [self qy_forwardingTargetForSelector:aSelector];
    if (target) return target;
    
    BOOL isMethodOverride = [self qy_isMethodOverrideForSelector:@selector(forwardInvocation:)];
    if (isMethodOverride) return nil;
    
    // filter of system life cycle method.
    // viewDidLoad, viewWillAppear:, viewDidAppear, viewWillDisappear:, viewDidDisappear:
    NSString *selStr = NSStringFromSelector(aSelector);
    if ([selStr hasPrefix:@"viewWill"] || [selStr hasPrefix:@"viewDid"]) return nil;
    
    NSArray *whiteList = @[@"_", @"UI", @"CKSMS", @"WK"];
    // filter of system class
    NSString *classString = NSStringFromClass(self.class);
    for (NSString *classPrefix in whiteList) {
        if ([classString hasPrefix:classPrefix]) return nil;
    }
    // iOS14 keyBoard
    if ([classString containsString:@"KeyboardInput"]) return nil;
    
    if (!target) {
        unrecognized_className = NSStringFromClass(self.class);
        if (!QY_DynamicClass) QY_DynamicClass = objc_allocateClassPair([NSObject class], "QY_DynamicClass", 0);
        class_addMethod(QY_DynamicClass, aSelector, (IMP)qy_dynamicMethodIMP, "V@:");
        target = [QY_DynamicClass new];
    }
    return target;
}
- (BOOL)qy_isMethodOverrideForSelector:(SEL)aSelector {
    IMP selfIMP = class_getMethodImplementation(self.class, aSelector);
    IMP superIMP = class_getMethodImplementation(class_getSuperclass(self.class), aSelector);
    return selfIMP != superIMP;
}

static force_inline void qy_dynamicMethodIMP(id self, SEL _cmd) {
    [QYErrorLog qy_printCrashInfo_unrecognized_selectorWithClassName:unrecognized_className selector:_cmd];
}

@end
