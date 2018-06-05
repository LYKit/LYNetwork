//
//  RequestSaleList.m
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
//

#import "RequestSaleList.h"

@implementation RequestSaleList
- (instancetype)init {
    if (self = [super init]) {
        self.interfaceURL = InterfaceURL(@"/cqdydc/sale/saleList");
    }
    return self;
}

//+ (NSDictionary *)replacedParamsDictionary {
//    return @{@"pricceNew" : @"price"};
//}


@end
