//
//  StickyHeaderBehaviour.m
//  BehaviourExample
//
//  Created by Michal Zygar on 14.01.2015.
//  Copyright (c) 2015 pixle. All rights reserved.
//

#import "StretchyHeaderBehaviour.h"

@interface StretchyHeaderBehaviour ()
@property(nonatomic)CGPoint startContentOffset;
@property(nonatomic)CGFloat bgImageHeight;
@end

@implementation StretchyHeaderBehaviour
{
    BOOL _isInitialHeightSet;
}


-(void)awakeFromNib
{
    self.startContentOffset=CGPointZero;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(!_isInitialHeightSet)
    {
        self.bgImageHeight=CGRectGetHeight(self.backgroundView.frame);
        _isInitialHeightSet=YES;
    }
    
    CGFloat absoluteY = ABS(scrollView.contentOffset.y);
    if (scrollView.contentOffset.y <= _startContentOffset.y)
    {
        CGFloat diff = _startContentOffset.y - scrollView.contentOffset.y;
        
        [self.backgroundView setFrame:CGRectMake(0.0f - diff / 2.0f, CGRectGetMinY(scrollView.frame), CGRectGetWidth(self.targetView.frame)+ absoluteY, self.bgImageHeight + absoluteY)];
        [self.targetView setFrame:CGRectMake(0.0, CGRectGetMinY(scrollView.frame), CGRectGetWidth(self.targetView.frame), CGRectGetHeight(self.targetView.frame))];
    }
}
@end
