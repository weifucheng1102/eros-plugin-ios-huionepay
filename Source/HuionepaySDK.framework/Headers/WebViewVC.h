//
//  WebViewVC.h
//  HuionepaySDKDemo
//
//  Created by xuyao guo on 2018/11/26.
//  Copyright © 2018年 huionepay. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AliPayBlock)(BOOL succ);
@interface WebViewVC : UIViewController
@property (nonatomic,assign) BOOL succ;
@property (nonatomic,strong) NSDictionary *dataInfoDIc;
@property (nonatomic,strong) NSDictionary *parDic;
@property (nonatomic,copy) NSString *hostURL;
@property (nonatomic, copy) AliPayBlock aliPayBlock;
@end
