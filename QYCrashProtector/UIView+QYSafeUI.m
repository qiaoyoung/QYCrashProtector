//
//  UIView+QYSafeUI.m
//  QYCrashProtector <https://github.com/qiaoyoung/QYCrashProtector>
//
//  Created by Joeyoung on 2018/10/11.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "UIView+QYSafeUI.h"
#import "QYUtils.h"

@implementation UIView (QYSafeUI)

+ (void)openCrashProtector_UI {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       qy_recognize_sel_instanceMethodSwizzle([UIView class],
                                              @selector(setNeedsLayout),
                                              @selector(qy_setNeedsLayout));
        qy_recognize_sel_instanceMethodSwizzle([UIView class],
                                               @selector(setNeedsDisplay),
                                               @selector(qy_setNeedsDisplay));
        qy_recognize_sel_instanceMethodSwizzle([UIView class],
                                               @selector(setNeedsDisplayInRect:),
                                               @selector(qy_setNeedsDisplayInRect:));
    });
}

- (void)qy_setNeedsLayout {
    dispatch_async(dispatch_get_main_queue(), ^{
         [self qy_setNeedsLayout];
    });
}
- (void)qy_setNeedsDisplay {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self qy_setNeedsDisplay];
    });
}
- (void)qy_setNeedsDisplayInRect:(CGRect)rect {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self qy_setNeedsDisplayInRect:rect];
    });
}

@end
