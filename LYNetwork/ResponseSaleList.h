//
//  ResponseSaleList.h
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaleList : NSObject
@property (nonatomic, copy) NSString *saleId;
@property (nonatomic, copy) NSString *saleType;
@property (nonatomic, copy) NSString *saleAmount;
@property (nonatomic, copy) NSString *amountType;
@property (nonatomic, copy) NSString *saleArea;
@property (nonatomic, copy) NSString *saleRooms;
@property (nonatomic, copy) NSString *saleHalls;
@property (nonatomic, copy) NSString *salePicture;
@property (nonatomic, copy) NSString *commName;
@property (nonatomic, copy) NSString *cityId;
@property (nonatomic, copy) NSString *decorate;
@property (nonatomic, copy) NSString *homePage;
@property (nonatomic, copy) NSString *houseStatus;
@property (nonatomic, copy) NSString *title;

@end

@interface SaleListData : NSObject
@property (nonatomic, copy) NSString *total;
@property (nonatomic, strong) NSMutableArray <SaleList *>  *saleList;

@end

@interface ResponseSaleList : NSObject
@property (nonatomic, copy) NSString *respCode;
@property (nonatomic, copy) NSString *respMsg;
@property (nonatomic, strong) SaleListData  *data;
@end
