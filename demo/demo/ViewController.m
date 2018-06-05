//
//  ViewController.m
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
//

#import "ViewController.h"
#import "RequestSaleList.h"
#import "ResponseSaleList.h"

@interface ViewController ()

@property (nonatomic, strong) RequestSaleList *requestSaleList;
@property (nonatomic, strong) ResponseSaleList *responseSaleList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RequestSaleList *request = [RequestSaleList new];
    request.rows = @"10";
    request.page = @"1";
    request.pricceNew = @"100";
    [request startWithSuccessBlock:^(ResponseSaleList *responseObject, NSDictionary *options) {
        NSLog(@"%@", responseObject.data.total);
    } failBlock:^(LYNetworkError *error, NSDictionary *options) {
        
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
