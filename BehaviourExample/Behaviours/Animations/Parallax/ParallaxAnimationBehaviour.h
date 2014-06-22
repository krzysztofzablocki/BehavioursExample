//
//  Created by merowing on 22/04/2014.
//
//
//


@import Foundation;

#import "KZBehaviour.h"


@interface ParallaxAnimationBehaviour : KZBehaviour <UIScrollViewDelegate>
//! view position to adjust
@property(nonatomic, weak) IBOutlet UIView *targetView;

//! scroll view to follow
@property(nonatomic, weak) IBOutlet UIScrollView *leadingScrollView;

//! offset for parallax, if set to zero it will grab initial position from targetView
@property(nonatomic, assign) IBInspectable CGPoint parallaxOffset;

//! parallax speed multiplier in regards to leading scrollView contentOffset
@property(nonatomic, assign) IBInspectable CGPoint parallaxSpeed;
@end