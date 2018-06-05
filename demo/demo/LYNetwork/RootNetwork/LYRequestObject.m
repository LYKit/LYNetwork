//
//  LYRequestObject.m
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
//

#import "LYRequestObject.h"
#import "AFNetworking.h"
#import "LYRequestManager.h"
#import "LYResponseObject.h"



@interface LYRequestObject ()

@property (nonatomic, strong) NSURLSessionDataTask *requestTask;
@property (nonatomic, strong) LYRequestManager *requestManager;

@end


@implementation LYRequestObject


- (void)startWithSuccessBlock:(LYRequestSuccessBlock)success
                    failBlock:(LYRequestFailBlock)fail
{
    [self startWithSuccessBlock:success progress:nil failBlock:fail];
}

- (void)startWithSuccessBlock:(LYRequestSuccessBlock)success
                     progress:(LYRequestProgressBlock)progress
                    failBlock:(LYRequestFailBlock)fail
{
    NSAssert(self.interfaceURL, @"请在 RequestXXX 内中设置接口地址");
    
    NSDictionary *paramters = [self propertyDictionary];
    NSDictionary *parameterdic = [LYInterfaceConfig addValuesWithParamters:paramters];
    
    //__weak typeof(self) weakSelf = self;
    self.requestManager = [LYRequestManager sharedClient];
    
    self.requestTask = [_requestManager POST:_interfaceURL parameters:parameterdic progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

#ifdef DEBUG
        NSLog(@"new 接口地址： %@",self.interfaceURL);
        NSLog(@"new 请求实体类： %@",[self class]);
        NSLog(@"new 请求参数 : %@",parameterdic);
        NSLog(@"new 成功，返回数据：%@",content);
#endif
        NSString *responseName = @"";
        if ([self respondsToSelector:@selector(responseName)]) {
            responseName = [self responseName];
        }

        LYResponseObject *response = [[LYResponseObject alloc] init];
        id object = [response objectParserJsonMapPropertyWithClassString:NSStringFromClass([self class]) responseName:responseName  DataDict:content];
        if (success) {
            success(object,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
#ifdef DEBUG
        NSLog(@"new 接口地址： %@",self.interfaceURL);
        NSLog(@"new 请求实体类： %@",[self class]);
        NSLog(@"new 请求参数 : %@",parameterdic);
        NSLog(@"new 失败，错误信息：%@",error.description);
#endif
        
        LYNetworkError *networkError = [LYErrorConfig networkError:error rspCode:-1];
        if (fail) {
            fail(networkError,nil);
        }
    }];
    
    if (self.isCache) {
        [self.requestManager.requestSerializer setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    }
}



- (NSString *)responseName
{
    return @"";
}




- (void)cancel
{
    [self.requestTask cancel];
}

- (void)cancelAllOperation
{
    for (NSURLSessionDataTask *task in self.requestManager.tasks) {
        [task cancel];
    }
    [self.requestManager.operationQueue cancelAllOperations];
}


@end
