//
//  BlurBehaviour.h
//  BehaviourExample
//
//  Created by Michal Zygar on 20.11.2014.
//  Copyright (c) 2014 pixle. All rights reserved.
//

#import "KZBehaviour.h"

@interface BlurBehaviour : KZBehaviour
//! view we are about to blur
@property IBOutlet UIView* targetView;
//! scroll view to follow
@property(nonatomic, weak) IBOutlet UIScrollView *leadingScrollView;
//! the point where the view is fully blurred
@property IBInspectable CGPoint fullBlurOffset;
//! blur radius
@property IBInspectable CGFloat blurRadius;

//! make blurred snapshot
-(IBAction)refresh;
@end
