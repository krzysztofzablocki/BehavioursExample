//
//  MultiplexerProxyBehaviour.m
//  BehaviourExample
//
//  Copyright (c) 2014 pixle. All rights reserved.
//

#import "MultiplexerProxyBehaviour.h"

@implementation MultiplexerProxyBehaviour
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSMethodSignature *sig = [super methodSignatureForSelector:sel];
    if (!sig) {
        for (id obj in self.targets) {
            if ((sig = [obj methodSignatureForSelector:sel])) {
                break;
            }
        }
    }
    return sig;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    BOOL base = [super respondsToSelector:aSelector];
    if (base) {
        return base;
    }
    
    return [self.targets.firstObject respondsToSelector:aSelector];
}


- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    for (id obj in self.targets) {
        if ([obj respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:obj];
        }
    }
}
@end
