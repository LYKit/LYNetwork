//
//  LYRequestManager.m
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
///

#import "LYRequestManager.h"

@implementation LYRequestManager

static LYRequestManager *_sharedClient;

+ (instancetype)sharedClient
{
    if (!_sharedClient) {
        _sharedClient = [LYRequestManager manager];
        _sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        _sharedClient.securityPolicy.allowInvalidCertificates=YES;
        _sharedClient.securityPolicy.validatesDomainName = NO;
        _sharedClient.requestSerializer.HTTPShouldHandleCookies=YES;
        _sharedClient.requestSerializer.timeoutInterval = 20;
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                                        @"application/xml",
                                                                                        @"text/json",
                                                                                        @"text/javascript",
                                                                                        @"text/html",
                                                                                        @"text/plain"]];
    }
    return _sharedClient;
}
@end
