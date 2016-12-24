//
//  ViewController.m
//  JADemo
//
//  Created by familymrfan on 16/12/21.
//  Copyright © 2016年 niuniu. All rights reserved.
//

#import "ViewController.h"
#import <Aspects.h>

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self aspect_hookSelector:@selector(viewDidAppear:) withOptions:AspectPositionInstead usingBlock:^(id<AspectInfo> info, BOOL animated) {
        [super viewDidAppear:animated];
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"alert" message:@"content" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertController animated:true completion:nil];
    } error:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
