//
//  LYRequestObject.h
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYInterfaceConfig.h"
#import "LYErrorConfig.h"

typedef void(^LYRequestSuccessBlock)(id responseObject, NSDictionary *options);
typedef void(^LYRequestFailBlock)(LYNetworkError *error, NSDictionary *options);
typedef void(^LYRequestProgressBlock)(NSProgress *uploadProgress);


@interface LYRequestObject : NSObject

/**
 接口地址
 */
@property (copy, nonatomic) NSString *interfaceURL;

/**
 是否缓存
 */
@property (assign, nonatomic) BOOL isCache;



/**
 自定义Response类
 当请求类和返回类，命名不一致时，重写此方法指定需要返回的类
 @return 返回自定义Response类名
 */
- (NSString *)responseName;

/**
 发起请求

 @param success 成功回调
 @param fail 失败回调
 */
- (void)startWithSuccessBlock:(LYRequestSuccessBlock)success
                    failBlock:(LYRequestFailBlock)fail;

/**
 发起请求

 @param success 成功回调
 @param progress 进度回调
 @param fail 失败回调
 */
- (void)startWithSuccessBlock:(LYRequestSuccessBlock)success
                     progress:(LYRequestProgressBlock)progress
                    failBlock:(LYRequestFailBlock)fail;


/**
 取消当前请求
 */
- (void)cancel;

/**
 取消所有请求
 保护正在请求的请求和正在排队的请求
 */
- (void)cancelAllOperation;

@end
