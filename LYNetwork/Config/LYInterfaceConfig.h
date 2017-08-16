//
//  LYInterfaceConfig.h
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
//

#import <Foundation/Foundation.h>


// IP地址
extern NSString * const HostUrl;

/**
 
 InterfaceURL =  HostUrl
 @param path 服务器地址
 @return 完整的的接口地址
 */
extern NSString *InterfaceURL (NSString *path);


/**
 
 imgeInterfaceURL =  图片host地址
 @param path 服务器地址
 @return 完整的的接口地址
 */
extern NSString *ImgeInterfaceURL (NSString *path);


@interface LYInterfaceConfig : NSObject



/**
 添加请求参数，可以包括签名处理

 @param dict 原本已有的参数字典
 @return 新参数字典
 */
+ (NSMutableDictionary *)addValuesWithParamters:(NSDictionary *)dict;

@end
