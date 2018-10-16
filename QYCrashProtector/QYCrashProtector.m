//
//  QYCrashProtector.m
//  QYCrashProtector <https://github.com/qiaoyoung/QYCrashProtector>
//
//  Created by Joeyoung on 2018/10/8.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "QYCrashProtector.h"
#import "NSObject+QYSafeSelector.h"
#import "NSTimer+QYSafeTimer.h"
#import "NSCache+QYSafeCache.h"
#import "NSArray+QYSafeArray.h"
#import "NSMutableArray+QYSafeMutableArray.h"
#import "NSDictionary+QYSafeDictionary.h"
#import "NSMutableDictionary+QYSafeMutableDictionary.h"
#import "NSString+QYSafeString.h"
#import "NSMutableString+QYSafeMutableString.h"
#import "NSAttributedString+QYSafeAttributedString.h"
#import "NSMutableAttributedString+QYSafeMutableAttributedString.h"
#import "UIView+QYSafeUI.h"

@implementation QYCrashProtector

+ (void)qy_openAllCrashProtector {
    [QYCrashProtector qy_openCrashProtector_unrecognized_selector];
    [QYCrashProtector qy_openCrashProtector_timer];
    [QYCrashProtector qy_openCrashProtector_container];
    [QYCrashProtector qy_openCrashProtector_string];
    [QYCrashProtector qy_openCrashProtector_UI];
}

+ (void)qy_openCrashProtector_unrecognized_selector {
    [NSObject openCrashProtector_unrecognized_selector];
}

+ (void)qy_openCrashProtector_timer {
    [NSTimer openCrashProtector_timer];
}

+ (void)qy_openCrashProtector_container {
    [NSArray openCrashProtector_array];
    [NSMutableArray openCrashProtector_mutableArray];
    [NSDictionary openCrashProtector_dictionary];
    [NSMutableDictionary openCrashProtector_mutableDictionary];
    [NSCache openCrashProtector_cache];
}

+ (void)qy_openCrashProtector_string {
    [NSString openCrashProtector_string];
    [NSMutableString openCrashProtector_mutableString];
    [NSAttributedString openCrashProtector_attributedString];
    [NSMutableAttributedString openCrashProtector_mutableAttributedString];
}

+ (void)qy_openCrashProtector_UI {
    [UIView openCrashProtector_UI];
}

@end
