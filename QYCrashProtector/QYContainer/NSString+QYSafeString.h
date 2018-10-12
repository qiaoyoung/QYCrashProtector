//
//  NSString+QYSafeString.h
//
//
//  Created by Joeyoung on 2018/10/10.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (QYSafeString)

/**
 ⚠️⚠️⚠️ warning:
 In iOS8 earlier, If method swizzling the "characterAtIndex:" in "NSString", it will cause all method swizzling in "NSMutableString" to fail.
 So method swizzling "characterAtIndex:" in "NSString" >= iOS9.
 
 
 sample crash code:
 NSString *str = @"123";
 if (@available(iOS 9.0, *)) {
    [str characterAtIndex:100];
 }
 [str substringFromIndex:4];
 [str substringToIndex:4];
 [str substringWithRange:NSMakeRange(0, 12)];
 [str stringByReplacingOccurrencesOfString:@"8" withString:@"12" options:0 range:NSMakeRange(0, 10)];
 [str stringByReplacingOccurrencesOfString:@"456" withString:nil];
 // *** QYCRASH_REASON: *** -[__NSCFConstantString qy_stringByReplacingOccurrencesOfString:withString:options:range:]: nil argument  ***
 [str stringByReplacingOccurrencesOfString:nil withString:@"789"];
 // *** QYCRASH_REASON: -[__NSCFString replaceOccurrencesOfString:withString:options:range:]: nil argument  ***
 [str stringByReplacingCharactersInRange:NSMakeRange(0, 2) withString:nil];
 */

/**
 open string protector.
 */
+ (void)openCrashProtector_string;

@end

NS_ASSUME_NONNULL_END
