//
//  LYRequestManager.h
//  demo
//
//  Created by liang on 2017/6/6.
//  Copyright © 2017年 LYKit. All rights reserved.
//

#import "AFHTTPSessionManager.h"

// 前提条件基于AFN
@interface LYRequestManager : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
