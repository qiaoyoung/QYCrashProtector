//
//  NSCache+QYSafeCache.h
//   
//
//  Created by Joeyoung on 2018/10/11.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSCache (QYSafeCache)

/**
 sample crash code:
 
 NSCache *cache = [[NSCache alloc] init];
 [cache setObject:nil forKey:@"testKey" cost:100];
 */

/**
 open cache protector.
 */
+ (void)openCrashProtector_cache;

@end

NS_ASSUME_NONNULL_END
