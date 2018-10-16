//
//  NSAttributedString+QYSafeAttributedString.m
//  QYCrashProtector <https://github.com/qiaoyoung/QYCrashProtector>
//
//  Created by Joeyoung on 2018/10/10.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "NSAttributedString+QYSafeAttributedString.h"
#import "QYUtils.h"

@implementation NSAttributedString (QYSafeAttributedString)

+ (void)openCrashProtector_attributedString {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class NSConcreteAttributedString = NSClassFromString(@"NSConcreteAttributedString");
        qy_recognize_sel_instanceMethodSwizzle([NSConcreteAttributedString class],
                                               @selector(initWithString:),
                                               @selector(qy_initWithString:));
    });
}

- (instancetype)qy_initWithString:(NSString *)str {
    id attributedString = nil;
    @try {
        attributedString = [self qy_initWithString:str];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        return attributedString;
    }
}

@end
