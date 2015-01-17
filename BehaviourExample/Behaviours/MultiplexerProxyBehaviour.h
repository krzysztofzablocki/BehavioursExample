//
//  MultiplexerProxyBehaviour.h
//  BehaviourExample
//
//  Copyright (c) 2014 pixle. All rights reserved.
//

#import "KZBehaviour.h"

@interface MultiplexerProxyBehaviour : KZBehaviour

//! targets to propagate messages to
@property(nonatomic, strong) IBOutletCollection(id) NSArray *targets;

@end
