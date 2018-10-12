//
//  NSObject+QYSafeSelector.h
//
//
//  Created by Joeyoung on 2018/10/8.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (QYSafeSelector)

/**
 sample crash code:
 
 [[NSNull null] performSelector:@selector(test:)];
 */

/**
 open unrecognized selector protector.
 */
+ (void)openCrashProtector_unrecognized_selector;

@end
