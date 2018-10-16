//
//  NSMutableAttributedString+QYSafeMutableAttributedString.h
//  QYCrashProtector <https://github.com/qiaoyoung/QYCrashProtector>
//
//  Created by Joeyoung on 2018/10/10.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (QYSafeMutableAttributedString)

/**
 sample crash code:
 
 id obj = nil;
 NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:obj];
 NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:obj attributes:@{}];
 */

/**
 open mutableAttributedString protector.
 */
+ (void)openCrashProtector_mutableAttributedString;

@end

NS_ASSUME_NONNULL_END
