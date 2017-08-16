//
//  ResponseSaleList.m
//  DongYuan
//
//  Created by demo on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
//

#import "ResponseSaleList.h"

@implementation SaleList

@end

@implementation SaleListData
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"saleList" : [SaleList class],
       
             };
}
@end

@implementation ResponseSaleList

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [SaleListData class]};
}
@end
