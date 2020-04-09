# eros-plugin-ios-huionepay
eros ios sdk huione支付
## 集成
- 在iOS项目文件夹的`Podfile`中添加以下代码，然后执行 `pod update`
```
pod 'eros-plugin-ios-huionepay', :git => 'https://github.com/weifucheng1102/eros-plugin-ios-huionepay.git'
```

- 在项目设置`TARGEI->Info->URL Types` 增加一个 `scheme`，`URL Schemes`中填写scheme值`BMHuionePay`
- 在项目设置`TARGEI->Info->Custom iOS Target Properities` 添加`LSApplicationQueriesSchemes` array类型  增加一个 `item`，Value值为`huionepaypersonal`


- 在 `AppDelegate.m`中添加引用

```
#import <eros-plugin-ios-huionepay/BMHuionepayManager.h>
```

复制以下代码 注意代码要放到 `@end` 之前

```
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
     if ([url.host isEqualToString:@"HOeasyPay"]) {
        return [BMHuionepayManager handlerOpenURL:url];
    }
    return [super application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

```
