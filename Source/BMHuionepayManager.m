//
//  HuionepayManager.m
//  WeexEros
//
//  Created by Fucheng Wei on 2020/4/7.
//  Copyright © 2020 benmu. All rights reserved.
//

#import "BMHuionepayManager.h"
#import <HuionepaySDK/HuionepaySDK.h>

@interface BMHuionepayManager ()
@property (nonatomic, copy) WXModuleCallback callback;

@end
@implementation BMHuionepayManager

#pragma mark - Public Method

+ (instancetype)shareInstance
{
    static BMHuionepayManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[BMHuionepayManager alloc] init];
    });
    
    return _instance;
}

- (void)payWithOrder:(NSDictionary *)params fromScheme:(NSString *)scheme callback:(WXModuleCallback)callback
{
    self.callback = callback;
     NSMutableDictionary *orderDic = [[NSMutableDictionary alloc]initWithDictionary:params[@"odata"]];
    NSDictionary *tempDic = @{@"app_id":params[@"app_id"],
                              @"data":params[@"data"],
                              @"sign":params[@"sign"]
                            };
    [[HuionepayManager ShareService] payOrderA:orderDic signOrder:tempDic fromScheme:scheme callback:^(NSDictionary *resultDic) {
        NSLog(@"回调信息=%@",resultDic);
        if (callback) {
             if (resultDic[@"url"]) {
            callback(@{
                       @"code": @"-100",
                       @"errorMsg": @"",
                       @"data": @""
                       });
            
             }else{
                 callback(@{
                       @"code": resultDic[@"code"],
                       @"errorMsg": resultDic[@"msg"],
                       @"data": @""
                       });
             }
            
        }
   
    } errorback:^(NSDictionary *resultDic) {
      NSLog(@"错误信息=%@",resultDic);
        if (callback) {
            callback(@{
                       @"code": resultDic[@"code"],
                       @"errorMsg": resultDic[@"msg"],
                       @"data": @""
                       });
        }
    }];
}

//支付回调
+ (BOOL)handlerOpenURL:(NSURL *)url
{
    __weak typeof(BMHuionepayManager) *_weakSelf = [BMHuionepayManager shareInstance];
    
    [[HuionepayManager ShareService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
         NSLog(@"RESULT:%@",resultDic);
        if (_weakSelf.callback)
        {
            _weakSelf.callback(@{
                                 @"code": resultDic[@"code"],
                                 @"errorMsg": resultDic[@"msg"],
                                 @"data": @""
                                 });
            _weakSelf.callback = nil;
        }
        
    }];
    
    return YES;
}


@end
