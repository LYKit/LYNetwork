//
//  LYResponseObject.m
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
//

#import "LYResponseObject.h"
#import <Foundation/Foundation.h>
#import "YYModel.h"

@interface LYResponseObject ()

@property (nonatomic, copy) NSString *jsonStr;
@property (nonatomic) Class responseClass;


@end

@implementation LYResponseObject


- (id)objectParserJsonMapPropertyWithClassString:(NSString *)clsStr responseName:(NSString *)responseName DataDict:(NSDictionary *)dataDict
{
   NSString * responseCls = @"";
    if (responseName.length > 0) {
        responseCls = responseName;
    } else {
       responseCls = [clsStr stringByReplacingOccurrencesOfString:@"Request" withString:@"Response"];
    }
    Class cls = NSClassFromString(responseCls);
    
    NSAssert(cls, @"1、请检查Request请求类和Response返回类，类名是否拼写正确，为保证请求实体和返回实体的成对性，除前缀外后面命名务必保证一直。2、请检查target中是否勾选此类 3、类是否有实现");
    id response = [cls yy_modelWithDictionary:dataDict];

    return response;
}




@end
