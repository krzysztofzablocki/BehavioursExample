//
//  StickyHeaderBehaviour.h
//  BehaviourExample
//
//  Created by Michal Zygar on 14.01.2015.
//  Copyright (c) 2015 pixle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KZBehaviour.h"

@interface StretchyHeaderBehaviour : KZBehaviour<UIScrollViewDelegate>
//! Background view that will be strechted
@property (nonatomic,weak) IBOutlet UIView* backgroundView;

//! View on scrollview we want to have strechy bg i.e. table view header
@property (nonatomic,weak) IBOutlet UIView* targetView;

//! Scrollview we operate on
@property (nonatomic, weak) IBOutlet UIScrollView* scrollView;
@end
