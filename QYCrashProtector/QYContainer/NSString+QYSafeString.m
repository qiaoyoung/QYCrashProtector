//
//  NSString+QYSafeString.m
//  QYCrashProtector <https://github.com/qiaoyoung/QYCrashProtector>
//
//  Created by Joeyoung on 2018/10/10.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "NSString+QYSafeString.h"
#import "QYUtils.h"

@implementation NSString (QYSafeString)

+ (void)openCrashProtector_string {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_swizzling__NSCFConstantString();
        method_swizzling__NSString();
    });
}

#pragma mark - Method Swizzling
void method_swizzling__NSCFConstantString() {
    Class __NSCFConstantString = NSClassFromString(@"__NSCFConstantString");
    // ⚠️⚠️⚠️ look .h issue.
    if (@available(iOS 9.0, *)) {
        qy_recognize_sel_instanceMethodSwizzle([__NSCFConstantString class],
                                               @selector(characterAtIndex:),
                                               @selector(qy_characterAtIndex:));
    }
    qy_recognize_sel_instanceMethodSwizzle([__NSCFConstantString class],
                                           @selector(substringFromIndex:),
                                           @selector(qy_substringFromIndex:));
    qy_recognize_sel_instanceMethodSwizzle([__NSCFConstantString class],
                                           @selector(substringToIndex:),
                                           @selector(qy_substringToIndex:));
    qy_recognize_sel_instanceMethodSwizzle([__NSCFConstantString class],
                                           @selector(substringWithRange:),
                                           @selector(qy_substringWithRange:));
}
void method_swizzling__NSString() {
    qy_recognize_sel_instanceMethodSwizzle([NSString class],
                                           @selector(stringByReplacingOccurrencesOfString:withString:options:range:),
                                           @selector(qy_stringByReplacingOccurrencesOfString:withString:options:range:));
    qy_recognize_sel_instanceMethodSwizzle([NSString class],
                                           @selector(stringByReplacingCharactersInRange:withString:),
                                           @selector(qy_stringByReplacingCharactersInRange:withString:));
}

#pragma mark - Instance Method
- (unichar)qy_characterAtIndex:(NSUInteger)index {
    unichar character;
    @try {
        [self qy_characterAtIndex:index];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        return character;
    }
}
- (NSString *)qy_substringFromIndex:(NSUInteger)from {
    NSString *str = nil;
    @try {
        str = [self qy_substringFromIndex:from];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        return str;
    }
}
- (NSString *)qy_substringToIndex:(NSUInteger)to {
    NSString *str = nil;
    @try {
        str = [self qy_substringToIndex:to];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        return str;
    }
}
- (NSString *)qy_substringWithRange:(NSRange)range {
    NSString *str = nil;
    @try {
        str = [self qy_substringWithRange:range];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        return str;
    }
}

- (NSString *)qy_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange {
    NSString *str = nil;
    @try {
        str = [self qy_stringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        return str;
    }
}
- (void)qy_stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement {
    @try {
        [self qy_stringByReplacingCharactersInRange:range withString:replacement];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
    }
}

@end
