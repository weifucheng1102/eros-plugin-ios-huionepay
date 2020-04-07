//
//  HuionepayManager.h
//  HuionepaySDK
//
//  Created by xuyao guo on 2018/11/10.
//  Copyright © 2018年 huionepay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^CompletionBlock)(NSDictionary *resultDic);
typedef void(^ErrorCompletionBlock)(NSDictionary *resultDic);


@interface HuionepayManager : NSObject


/**
 支付单利

 @return 单利对象
 */
+ (HuionepayManager *)ShareService;
    

/**
 SDK支付接口

 @param orderDic 支付订单信息
 @param signOrder 签名订单信息
 @param schemeStr 调用支付的app注册在info.plist中的scheme
 @param completionBlock 支付结果回调
 @param errorCompletionBlock  支付异常回调
 */
- (void)payOrderA:(NSDictionary *)orderDic
 signOrder:(NSDictionary *)signOrder
fromScheme:(NSString *)schemeStr
  callback:(CompletionBlock)completionBlock
 errorback:(ErrorCompletionBlock)errorCompletionBlock;

    
    
/**
 支付结束后回掉

 @param resultUrl 返回结果URL
 @param completionBlock 支付结果回掉
 */
- (void)processOrderWithPaymentResult:(NSURL *)resultUrl
                          standbyCallback:(CompletionBlock)completionBlock;
    
    

/**
 获取SDK版本号

 @return 版本号字符串
 */
- (NSString *)currentVersion;

@end
