//
//  HuionepayModule.m
//  WeexEros
//
//  Created by Fucheng Wei on 2020/4/7.
//  Copyright © 2020 benmu. All rights reserved.
//

#import "HuionepayModule.h"
#import <WeexPluginLoader/WeexPluginLoader/WeexPluginLoader.h>
#import "BMHuionepayManager.h"
#define HuionePayScheme @"BMHuionePay"
WX_PlUGIN_EXPORT_MODULE(bmHuiOne, HuionepayModule)

@implementation HuionepayModule

WX_EXPORT_METHOD(@selector(pay:callback:))

/**
 huione支付

 @param params 参数 {}
 @param callback 回调
 */
- (void)pay:(NSDictionary *)params callback:(WXModuleCallback)callback {
    [[BMHuionepayManager shareInstance] payWithOrder:params fromScheme:HuionePayScheme callback:callback];
}

@end

