//
//  NSDictionary+QYSafeDictionary.m
//   
//
//  Created by Joeyoung on 2018/10/10.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "NSDictionary+QYSafeDictionary.h"
#import "QYUtils.h"

@implementation NSDictionary (QYSafeDictionary)

+ (void)openCrashProtector_dictionary {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        qy_recognize_sel_classMethodSwizzle([self class], // literal syntax: @{ key:value, ...};
                                            @selector(dictionaryWithObjects:forKeys:count:),
                                            @selector(qy_dictionaryWithObjects:forKeys:count:));
    });
}

// "__NSPlaceholderDictionary" : literal syntax: @{ key:value, ...};
+ (instancetype)qy_dictionaryWithObjects:(const id _Nonnull [_Nullable])objects forKeys:(const id<NSCopying> _Nonnull [_Nullable])keys count:(NSUInteger)cnt {
    id obj = nil;
    @try {
        obj = [self qy_dictionaryWithObjects:objects forKeys:keys count:cnt];
    } @catch (NSException *exception) {
        [QYErrorLog qy_printCrashInfoWithException:exception];
    } @finally {
        return obj;
    }
}

@end
