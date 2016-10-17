//
//  main.m
//  runtime
//
//  Created by FanFamily on 16/10/8.
//  Copyright © 2016年 niuniu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTest.h"
#import "RTestEx.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        RTest* t = [[RTest alloc] init];
        // add instance method
        IMP imp = imp_implementationWithBlock(^(id self, ...) {
            NSLog(@"cc");
        });
        class_addMethod([t class], NSSelectorFromString(@"cc"), (IMP)imp, NULL);
        
        // 证明addMethod在自己本身上，responds是能响应的
        if ([t respondsToSelector:NSSelectorFromString(@"cc")]) {
            NSLog(@"has this selector cc");
        }
        
        RTest* tex = [[RTestEx alloc] init];
        
        if ([tex respondsToSelector:NSSelectorFromString(@"cc")]) {
            NSLog(@"has this selector cc");
        }
        
        // 在子类添加方法，用基类的指针去访问，responds仍然能够响应
        class_addMethod([RTestEx class], NSSelectorFromString(@"bb"), (IMP)imp, NULL);
        
        if ([tex respondsToSelector:NSSelectorFromString(@"bb")]) {
            NSLog(@"has this selector bb");
        }
        
        Class subclass = objc_allocateClassPair([RTestEx class], "RTestEx2", 0);
        class_addMethod(subclass, NSSelectorFromString(@"dd"), (IMP)imp, NULL);
        //objc_registerClassPair(subclass);
        
        // 动态创建的子类，在动态add的方法，responds可以响应到
        id tex2 = [[subclass alloc] init];
        if ([tex2 respondsToSelector:NSSelectorFromString(@"dd")]) {
            NSLog(@"has this selector dd");
        } else {
            NSLog(@"has no this selector");
        }
        
        // class_getInstanceMethod 可以拿到基类方法的
        Method originalMethod = class_getInstanceMethod(subclass, @selector(bb));
        if (originalMethod) {
            NSLog(@"find bb selector");
        } else {
            NSLog(@"not find cc selector");
        }
        
        // 但replace返回值则不同，不会返回基类方法实现要注意，只会返回subclass的方法，而bb不是
        IMP originalImp = class_replaceMethod(subclass, @selector(bb), imp_implementationWithBlock(^() {
            
        }), "v@:");
        
        if (originalImp) {
            NSLog(@"find bb selector");
        } else {
            NSLog(@"not find bb selector");
        }
        
        Method method = class_getInstanceMethod(subclass, @selector(class));
        IMP newIMP = imp_implementationWithBlock(^(id self) {
            return [RTest class];
        });
        class_replaceMethod(subclass, @selector(class), newIMP, method_getTypeEncoding(method));
        
        // 当替换class方法后respondsToSelector不能正确响应，可见respondsToSelector是通过调用class，来找对应class的方法，其实这里的respondsToSelector是指向RTest的, 因此可以找的到cc，可以通过拿实现
        if ([tex2 respondsToSelector:NSSelectorFromString(@"dd")]) {
            NSLog(@"has this selector dd");
        } else {
            NSLog(@"has no this selector");
        }
        if ([tex2 respondsToSelector:NSSelectorFromString(@"cc")]) {
            NSLog(@"has this selector cc");
        } else {
            NSLog(@"has no this selector");
        }
        
        
    }
    return 0;
}
