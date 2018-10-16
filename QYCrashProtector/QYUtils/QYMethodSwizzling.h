//
//  QYMethodSwizzling.h
//  QYCrashProtector <https://github.com/qiaoyoung/QYCrashProtector>
//
//  Created by Joeyoung on 2018/10/8.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface QYMethodSwizzling : NSObject

/**
 Instance method swizzling.

 @param aClass Class
 
 @param originalSelector original SEL
 
 @param swizzleSelector swizzle Selector
 
 @return result
 */
BOOL qy_recognize_sel_instanceMethodSwizzle(Class aClass, SEL originalSelector, SEL swizzleSelector);

/**
 Class method swizzling.

 @param aClass Class
 
 @param originalSelector original SEL
 
 @param swizzleSelector swizzle Selector
 
 @return result
 */
BOOL qy_recognize_sel_classMethodSwizzle(Class aClass, SEL originalSelector, SEL swizzleSelector);

@end

NS_ASSUME_NONNULL_END

