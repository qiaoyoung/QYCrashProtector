//
//  NSMutableString+QYSafeMutableString.m
//
//
//  Created by Joeyoung on 2018/10/10.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "NSMutableString+QYSafeMutableString.h"
#import "QYUtils.h"

@implementation NSMutableString (QYSafeMutableString)

+ (void)openCrashProtector_mutableString {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSCFString = NSClassFromString(@"__NSCFString");
        qy_recognize_sel_instanceMethodSwizzle([__NSCFString class],
                                               @selector(replaceCharactersInRange:withString:),
                                               @selector(qy_replaceCharactersInRange:withString:));
        qy_recognize_sel_instanceMethodSwizzle([__NSCFString class],
                                               @selector(insertString:atIndex:),
                                               @selector(qy_insertString:atIndex:));
        qy_recognize_sel_instanceMethodSwizzle([__NSCFString class],
                                               @selector(deleteCharactersInRange:),
                                               @selector(qy_deleteCharactersInRange:));
    });
}

- (void)qy_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    @try {
        [self qy_replaceCharactersInRange:range withString:aString];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        
    }
}
- (void)qy_insertString:(NSString *)aString atIndex:(NSUInteger)loc {
    @try {
        [self qy_insertString:aString atIndex:loc];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        
    }
}
- (void)qy_deleteCharactersInRange:(NSRange)range {
    @try {
        [self qy_deleteCharactersInRange:range];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        
    }
}

@end
