//
//  NSMutableAttributedString+QYSafeMutableAttributedString.m
//
//
//  Created by Joeyoung on 2018/10/10.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "NSMutableAttributedString+QYSafeMutableAttributedString.h"
#import "QYUtils.h"

@implementation NSMutableAttributedString (QYSafeMutableAttributedString)

+ (void)openCrashProtector_mutableAttributedString {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class NSConcreteMutableAttributedString = NSClassFromString(@"NSConcreteMutableAttributedString");
        qy_recognize_sel_instanceMethodSwizzle([NSConcreteMutableAttributedString class],
                                               @selector(initWithString:),
                                               @selector(qy_initWithString:));
        qy_recognize_sel_instanceMethodSwizzle([NSConcreteMutableAttributedString class],
                                               @selector(initWithString:attributes:),
                                               @selector(qy_initWithString:attributes:));
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
- (instancetype)qy_initWithString:(NSString *)str attributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attrs {
    id attributedString = nil;
    @try {
        attributedString = [self qy_initWithString:str attributes:attrs];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        return attributedString;
    }
}

@end
