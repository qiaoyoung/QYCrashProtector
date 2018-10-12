# QYCrashProtector

App 因服务端数据返回异常、未实现方法等问题造成的crash比比皆是， 虽然有经验的猿可以通过一些 if 判断加层保护，但是总觉得不够优雅；而且如果面对前猿留下的代码呢...  显然一个个加判断有点力不从心...       

在此问题的基础上有幸看到了此作者的文章---[链接戳这里](http://www.yopai.com/show-3-150721-1.html) ，很全面的分析了造成crash的种种原因，在此不再啰嗦...  但是遗憾的是， 作者并未开源代码...      

基于以上情形，本人的QYCrashProtector（崩溃保护工具）就诞生了！！！ 开源，但有不完善的地方，希望各位小伙伴看到后积极提出宝贵意见，让我们共同努力，对crash say goodbye ~

在此感谢@ibireme！！！ 工具中的timer保护类，引用了 [YYWeakProxy](https://github.com/ibireme/YYKit/tree/master/YYKit/Utility) 类打破retainCycle.

## 使用方法:
###  可以在程序一启动就在 `- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions` 方法中开启crash保护； 
### 当然也可以在想要开启的任意地方开启， 早开早用;

### 开启方法：     
*  Step 1：导入头文件： `#import <QYCrashProtector.h>`；
*  Step 2：`[QYCrashProtector qy_openAllCrashProtector];` 开启所有类型保护。

### 注意事项：
* 该工具的开放入口为 `#import <QYCrashProtector.h>`， 只需导入该头文件就可使用所有功能；
*  类 `QYCrashProtector.h` 中有对应的开启保护类型的方法，可自行搭配；
* 本工具主要采用了 `method swizzling` 的方式， 原工程不需要任何修改；
* 目前支持 timer/ unrecognized selector/ NSArray／NSMutableArray／NSDictionary／NSMutableDictionary／NSCache / String系列/等保护；
* 因KVO、NSNotification、BAD_ACCESS的保护方法存在一些问题，暂未提供；
* 当捕捉到异常时，会通过 `QYErrorLog` 类中的相关方法打印出来；
* 每种类型的保护放在对应的分类中，便于拓展维护。
详情请查看源码。

## Example
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // open all crash protector.
    [QYCrashProtector qy_openAllCrashProtector];
    
    // or:
    // open unrecognized selector protector.
    [QYCrashProtector qy_openCrashProtector_unrecognized_selector];
    
    // open timer protector.
    [QYCrashProtector qy_openCrashProtector_timer];
    
    // open container protector.
    [QYCrashProtector qy_openCrashProtector_container];
    
    // open string protector.
    [QYCrashProtector qy_openCrashProtector_string];
    
    //  open UI protector.
    [QYCrashProtector qy_openCrashProtector_UI];
    
    ... 
```
## Requirements

## Installation

QYCrashProtector is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'QYCrashProtector'
```

## Author

joeyoung, 393098486@qq.com

## License

QYCrashProtector is available under the MIT license. See the LICENSE file for more info.
