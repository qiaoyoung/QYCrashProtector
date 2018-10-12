//
//  NSMutableArray+QYSafeMutableArray.h
//   
//
//  Created by Joeyoung on 2018/10/9.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (QYSafeMutableArray)

/**
 sample crash code:
 
 NSMutableArray *mutableArr = [NSMutableArray arrayWithObjects:@1,@2,@3,@4, nil];
 NSObject *obj = nil;
 NSMutableArray *mutableArr1 = [@[@1,@2,@3,@4,obj] mutableCopy];
 [mutableArr objectAtIndex:10];
 NSLog(@"%@",mutableArr[10]);
 [mutableArr addObject:nil];
 [mutableArr insertObject:nil atIndex:10];
 [mutableArr setObject:nil atIndexedSubscript:10];
 [mutableArr removeObject:@10];
 [mutableArr removeObjectAtIndex:10];
 */

/**
 open mutableArray protector.
 */
+ (void)openCrashProtector_mutableArray;

@end

NS_ASSUME_NONNULL_END
