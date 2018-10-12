//
//  NSArray+QYSafeArray.h
//   
//
//  Created by Joeyoung on 2018/10/8.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (QYSafeArray)

/**
 sample crash code:
 
 NSObject *obj = nil;
 NSArray *array1 = @[obj];
 NSLog(@"%@",array1[1]);
 NSArray *array = [[NSArray alloc] initWithObjects:@1, nil];
 [array objectAtIndex:10];
 NSLog(@"%@",array[10]);
 [array objectsAtIndexes:@[[NSIndexSet indexSetWithIndex:10],[NSIndexSet indexSetWithIndex:11]]];
 id  _Nonnull __unsafe_unretained newObjects[0];
 newObjects[0] = @1;
 [array getObjects:newObjects range:NSMakeRange(0, 10)];
 */

/**
 open array protector.
 */
+ (void)openCrashProtector_array;

@end

NS_ASSUME_NONNULL_END
