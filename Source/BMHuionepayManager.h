//
//  HuionepayManager.h
//  WeexEros
//
//  Created by Fucheng Wei on 2020/4/7.
//  Copyright © 2020 benmu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeexSDK/WeexSDK.h>


@interface BMHuionepayManager : NSObject

+ (instancetype)shareInstance;

- (void)payWithOrder:(NSDictionary *)params fromScheme:(NSString *)scheme callback:(WXModuleCallback)callback;

+ (BOOL)handlerOpenURL:(NSURL *)url;
@end

