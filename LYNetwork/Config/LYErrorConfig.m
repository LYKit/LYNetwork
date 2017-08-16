//
//  LYErrorConfig.m
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
//

#import "LYErrorConfig.h"

NSString * const LYErrorNetworkUnKnown = @"未知错误";
NSString * const LYErrorNetworkCancel = @"请求已取消";
NSString * const LYErrorNetworkUnReachable = @"网络开小差了";
NSString * const LYErrorNetworkServerAbnormal = @"服务器开小差了";
NSString * const LYErrorNetworkServerNotFound = @"服务器链接失败";
NSString * const LYErrorNetworkParamsError = @"请求参数错误";



@interface LYNetworkError ()

@property (nonatomic, copy) NSString *strDescription;

@end

@implementation LYNetworkError

- (NSString *)description
{
    return self.strDescription;
}

@end


@implementation LYErrorConfig


+ (LYNetworkError *)networkError:(NSError *)error rspCode:(NSInteger)rspCode
{
    LYNetworkError *networkError = [[LYNetworkError alloc] init];
    
    NSString *strDescription = @"";
    
    /* 以下为自己定义的错误码描述,根据需求自己改变 */
    // 网络错误码
    switch (error.code) {
        case -1009:
            strDescription = LYErrorNetworkUnReachable;
            break;
        case -999:
            strDescription = LYErrorNetworkCancel;
            break;
        case 404:
            strDescription = LYErrorNetworkServerNotFound;
            break;
        case 500:
            strDescription = LYErrorNetworkServerAbnormal;
            break;
        default:
            strDescription = error.userInfo[NSLocalizedDescriptionKey];
            break;
    }
    // 接口错误码
    switch (rspCode) {
        case 007:
            strDescription = LYErrorNetworkParamsError;
            break;
            
        default:
            break;
    }
    
    networkError.strDescription = strDescription;
    
    return networkError;
}


@end
