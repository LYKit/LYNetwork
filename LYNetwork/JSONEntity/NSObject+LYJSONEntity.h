//
//  NSObject+LYJSONEntity.h
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.

#import <Foundation/Foundation.h>

@protocol MFSJSONEntityElementProtocol <NSObject>

@optional
/*  帮助你快速设置JSON和对象属性的映射表(解决接口返回相同对象的问题)
 key:   JSON字段命名
 value: 客户端对象命名
 */
+ (NSDictionary *)replacedElementDictionary;

@end



@protocol MFSJSONEntityPropertyProtocol <NSObject>

@optional
/** 获取到指定父类的属性列表 */
- (Class)ownPropertysUntilClass;

@end





@interface NSObject (LYJSONEntity) <MFSJSONEntityElementProtocol, MFSJSONEntityPropertyProtocol>

/** 获取当前对象的属性集合 */
- (NSDictionary *)propertyDictionary;

/** 根据数据集合生成对象 */
+ (id)objectWithDictionary:(NSDictionary *)dictionary;
+ (id)objectWithArray:(NSArray *)array;

/** 获取类属性列表，不包含父类 */
+ (NSArray *)propertyNames;

@end
