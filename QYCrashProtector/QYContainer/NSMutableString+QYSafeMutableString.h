//
//  NSMutableString+QYSafeMutableString.h
//
//
//  Created by Joeyoung on 2018/10/10.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableString (QYSafeMutableString)

/**
 sample crash code:
 
 NSMutableString *str = [NSMutableString stringWithFormat:@"hello world!"];
 [str replaceCharactersInRange:NSMakeRange(20, 100) withString:@"test"];
 [str insertString:@"123" atIndex:100];
 [str deleteCharactersInRange:NSMakeRange(20, 100)];
 */

/**
 open mutableString protector.
 */
+ (void)openCrashProtector_mutableString;

@end

NS_ASSUME_NONNULL_END
