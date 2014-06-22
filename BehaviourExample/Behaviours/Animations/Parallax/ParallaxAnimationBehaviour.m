//
//  Created by merowing on 22/04/2014.
//
//
//


#import "ParallaxAnimationBehaviour.h"
#import "NSObject+BKBlockObservation.h"


@interface ParallaxAnimationBehaviour ()
@property(nonatomic, strong) UIMotionEffectGroup *parallaxMotionEffect;
@end

@implementation ParallaxAnimationBehaviour

- (void)adjustParallaxPosition
{
  BOOL initialized = NO;
  if(!initialized) {
    initialized = YES;
    if (CGPointEqualToPoint(self.parallaxOffset, CGPointZero)) {
      self.parallaxOffset = self.targetView.center;
    }
  }
  
  CGPoint center = self.leadingScrollView.contentOffset;
  center.x = self.parallaxOffset.x + center.x * self.parallaxSpeed.x;
  center.y = self.parallaxOffset.y + center.y * self.parallaxSpeed.y;
  self.targetView.center = center;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  [self adjustParallaxPosition];
}
@end