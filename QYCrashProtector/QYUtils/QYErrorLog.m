//
//  QYCrashLog.m
//   
//
//  Created by Joeyoung on 2018/10/9.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "QYErrorLog.h"

@implementation QYErrorLog

+ (void)qy_printCrashInfoWithException:(NSException *)exception {
    NSLog(@"--------------------------- QYCrashProtector Log ---------------------------");
    NSLog(@"*** QYERROR_TYPE: %@  ***",exception.name);
    NSLog(@"*** QYCRASH_REASON: %@  ***",exception.reason);
    NSArray *callStackSymbolsArr = [NSThread callStackSymbols];
    if (callStackSymbolsArr.count >= 3) {
        NSString *mainCallStackSymbolMsg = [self qy_getMainCallStackSymbolMessageWithStackInfo:callStackSymbolsArr[2]];
        if (mainCallStackSymbolMsg == nil) mainCallStackSymbolMsg = @"Cannot find call stack information.";
        NSLog(@"*** QYERROR_ADDRESS: %@  ***",mainCallStackSymbolMsg);
    }
}

+ (void)qy_printCrashInfo_unrecognized_selectorWithClassName:(NSString *)className selector:(SEL)aSEL {
    NSLog(@"*** QYCRASHPROTECTORLOG: [%@ %@]:unrecognized selector ***", className,NSStringFromSelector(aSEL));
    NSLog(@"*** QYERROR_TYPE: unrecognized selector ***");
}

+ (void)qy_printCrashInfo_KVOWithClassName:(NSString *)className reason:(NSString *)reason {
    NSLog(@"*** QYCRASHPROTECTORLOG: CLASSNAME:'%@' REASON:%@ ***", className,reason);
    NSLog(@"*** QYERROR_TYPE: KVO ***");
}

+ (NSString *)qy_getMainCallStackSymbolMessageWithStackInfo:(NSString *)StackInfo {
    NSString *regularExpStr = @"[-\\+]\\[.+\\]";
    NSRegularExpression *regularExp = [[NSRegularExpression alloc] initWithPattern:regularExpStr options:NSRegularExpressionCaseInsensitive error:nil];
    __block NSString *mainCallStackSymbolMsg = nil;
    [regularExp enumerateMatchesInString:StackInfo options:NSMatchingReportProgress range:NSMakeRange(0, StackInfo.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        if (result) {
            mainCallStackSymbolMsg = [StackInfo substringWithRange:result.range];
            *stop = YES;
        }
    }];
    return mainCallStackSymbolMsg;
}

@end
