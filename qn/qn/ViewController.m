//
//  ViewController.m
//  qn
//
//  Created by familymrfan on 16/12/29.
//  Copyright © 2016年 niuniu. All rights reserved.
//

#import "ViewController.h"
#include "uptoken.h"
#import <QiniuSDK.h>
#import <HappyDNS.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    QNConfiguration *config =[QNConfiguration build:^(QNConfigurationBuilder *builder) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array addObject:[QNResolver systemResolver]];
        QNDnsManager *dns = [[QNDnsManager alloc] init:array networkInfo:[QNNetworkInfo normal]];
        //是否选择  https  上传
        builder.zone = [[QNAutoZone alloc] initWithHttps:YES dns:dns];
    }];
    
    char* token_s = upLoadToken("familymrfan-github", "sur8jG8s2OYBU2lp1tiekiAav-DA6cxiESdfXo6F", "5JGcvRLrTKl8Zy3xnkryQP3tbjyIJyIQIpV5d6yC");
    //重用uploadManager。一般地，只需要创建一个uploadManager对象
    NSString * token = [NSString stringWithFormat:@"%s", token_s];
    NSString * key = @"3333";
    NSString * filePath = @"/Users/familymrfan/Desktop/18005007.png";
    QNUploadManager *upManager = [[QNUploadManager alloc] initWithConfiguration:config];
    [upManager putFile:filePath key:key token:token complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
        if(info.ok){
            NSLog(@"请求成功");
        } else {
            NSLog(@"失败");
            //如果失败，这里可以把info信息上报自己的服务器，便于后面分析上传错误原因
        }
        NSLog(@"info ===== %@", info);
        NSLog(@"resp ===== %@", resp);
    } option:nil];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
