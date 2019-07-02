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
    
    // filter of system life cycle method.
    // viewDidLoad, viewWillAppear:, viewDidAppear, viewWillDisappear:, viewDidDisappear:
    NSString *selStr = NSStringFromSelector(aSelector);
    if ([selStr hasPrefix:@"viewWill"] || [selStr hasPrefix:@"viewDid"]) return nil;
    
    // filter of system class
    NSString *classString = NSStringFromClass([self class]);
    if ([classString hasPrefix:@"_"] || [classString hasPrefix:@"UI"] || [classString hasPrefix:@"CKSMS"]) return nil;
   
    if (!target) {
        unrecognized_className = NSStringFromClass([self class]);
        if (!QY_DynamicClass) QY_DynamicClass = objc_allocateClassPair([NSObject class], "QY_DynamicClass", 0);
        class_addMethod(QY_DynamicClass, aSelector, (IMP)qy_dynamicMethodIMP, "V@:");
        target = [QY_DynamicClass new];
    }
    return target;
}

static force_inline void qy_dynamicMethodIMP(id self, SEL _cmd) {
    [QYErrorLog qy_printCrashInfo_unrecognized_selectorWithClassName:unrecognized_className selector:_cmd];
}

@end
