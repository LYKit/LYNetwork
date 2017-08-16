//
//  LYErrorConfig.h
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString * const LYErrorNetworkUnKnown;          // 未知
extern NSString * const LYErrorNetworkCancel;           // 已取消
extern NSString * const LYErrorNetworkUnReachable;      // 无网络
extern NSString * const LYErrorNetworkServerAbnormal;   // 服务器异常
extern NSString * const LYErrorNetworkServerNotFound;   // 服务器未找到
extern NSString * const LYErrorNetworkParamsError;      // 请求参数错误


@interface LYNetworkError : NSError

/**
 接口错误码
 */
@property (nonatomic,assign) NSInteger rspCode;


@end


@interface LYErrorConfig : NSObject


+ (LYNetworkError *)networkError:(NSError *)error rspCode:(NSInteger)rspCode;

@end
