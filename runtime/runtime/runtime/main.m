//
//  main.m
//  runtime
//
//  Created by FanFamily on 16/10/8.
//  Copyright © 2016年 niuniu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        RTest* t = [[RTest alloc] init];
        [t aa];
        [t cc];
        NSLog(@"%ld", [t length]);
        [t bb];
    }
    return 0;
}
