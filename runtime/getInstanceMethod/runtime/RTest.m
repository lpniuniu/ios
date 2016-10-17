//
//  RTest.m
//  runtime
//
//  Created by FanFamily on 16/10/8.
//  Copyright © 2016年 niuniu. All rights reserved.
//

#import "RTest.h"
#import <objc/runtime.h>

void cc(id self, SEL _cmd) {
    NSLog(@"Thid is cc");
}

@implementation RTest

- (void)aa
{
    
}

@end
