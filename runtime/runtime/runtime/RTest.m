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

// resolve 第一层挽救的机会
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    // add instance method
    NSString* selString = NSStringFromSelector(sel);
    if ([selString isEqualToString:@"cc"]) {
        class_addMethod([self class], sel, (IMP)cc, NULL);
        return YES;
    }

    return [super resolveInstanceMethod:sel];
}

+ (BOOL)resolveClassMethod:(SEL)sel
{
    // add class method
    
    return YES;
}

- (void)aa
{
    NSLog(@"Thid is aa");
}

// 第二层防护，自己解决不了，交给他人
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSString* selString = NSStringFromSelector(aSelector);
    if ([selString isEqualToString:@"length"]) {
        return @"111";
    }
    return [super forwardingTargetForSelector:aSelector];
}

// 第三层防护
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    [anInvocation setTarget:self];
    [anInvocation setSelector:@selector(aa)];
    [anInvocation invoke];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSString *sel = NSStringFromSelector(aSelector);
    if ([sel isEqualToString:@"bb"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

@end
