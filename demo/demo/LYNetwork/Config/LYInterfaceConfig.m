//
//  LYInterfaceConfig.m
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
//

#import "LYInterfaceConfig.h"

NSString * const HostUrl = @"http://183.230.176.79:8103";
NSString * const ImgHostUrl = @"http://183.230.176.79:8103";


NSString *InterfaceURL (NSString *path)
{
    if (!path.length)
        return HostUrl;
    return [[HostUrl stringByAppendingString:path] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
};

NSString *ImgeInterfaceURL (NSString *path)
{
    if (!path.length)
        return ImgHostUrl;
    return [[ImgHostUrl stringByAppendingString:path] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
};

@implementation LYInterfaceConfig

+ (NSMutableDictionary *)addValuesWithParamters:(NSDictionary *)dict
{
    NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
    [paramDict addEntriesFromDictionary:dict];
    
 /* 默认参数及签名规则

 */
    
    return paramDict;
}



@end
