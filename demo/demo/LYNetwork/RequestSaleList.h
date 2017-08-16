//
//  RequestSaleList.h
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
//

#import "LYRequestObject.h"

@interface RequestSaleList : LYRequestObject
@property (nonatomic, copy) NSString *cityId;
@property (nonatomic, copy) NSString *otherType;
@property (nonatomic, copy) NSString *otherDop;
@property (nonatomic, copy) NSString *saleType;
@property (nonatomic, copy) NSString *page;
@property (nonatomic, copy) NSString *rows;
@property (nonatomic, copy) NSString *price;

@end
