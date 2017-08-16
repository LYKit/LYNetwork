//
//  LYResponseObject.h
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYResponseObject : NSObject


- (id)objectParserJsonMapPropertyWithClassString:(NSString *)clsStr responseName:(NSString *)responseName DataDict:(NSDictionary *)dataDict;

@end
