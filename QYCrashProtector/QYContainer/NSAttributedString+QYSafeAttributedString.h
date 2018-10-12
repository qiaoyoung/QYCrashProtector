//
//  NSAttributedString+QYSafeAttributedString.h
//   
//
//  Created by Joeyoung on 2018/10/10.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (QYSafeAttributedString)

/**
 sample crash code:
 
 NSAttributedString *attributedStr = [[NSAttributedString alloc] initWithString:obj];
 NSAttributedString *attributedStr1 = [[NSAttributedString alloc] initWithString:obj attributes:@{}];
 NSAttributedString *attributedStr2 = [[NSAttributedString alloc] initWithAttributedString:attributedStr];
 */

/**
 open attributedString protector.
 */
+ (void)openCrashProtector_attributedString;

@end

NS_ASSUME_NONNULL_END
