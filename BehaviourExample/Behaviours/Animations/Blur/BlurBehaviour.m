//
//  BlurBehaviour.m
//  BehaviourExample
//
//  Created by Michal Zygar on 20.11.2014.
//  Copyright (c) 2014 pixle. All rights reserved.
//

#import "BlurBehaviour.h"

@interface BlurBehaviour ()
@property (nonatomic, strong) UIView* blurredView;
@end


@implementation BlurBehaviour
-(IBAction)refresh
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.blurredView removeFromSuperview];

        UIGraphicsBeginImageContext(self.targetView.bounds.size);
        [self.targetView drawViewHierarchyInRect:self.targetView.bounds afterScreenUpdates:NO];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        CIImage *beginImage = [CIImage imageWithCGImage:image.CGImage];
        CIContext* context = [CIContext contextWithOptions:nil];
        
        CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur" keysAndValues:kCIInputImageKey, beginImage, @"inputRadius", @(self.blurRadius), nil];
        CIImage *outputImage = [filter outputImage];
        
        
        CGImageRef cgimg = [context createCGImage:outputImage fromRect:[beginImage extent]];
        UIGraphicsEndImageContext();
        UIImage *newImage = [UIImage imageWithCGImage:cgimg];
        self.blurredView=[[UIImageView alloc] initWithImage:newImage];
        [self updateBlurredViewFrame];
        [self.targetView addSubview:self.blurredView];
        [self adjustBlur];

    });
}

- (void)adjustBlur{
    
    CGPoint center = self.leadingScrollView.contentOffset;
    float xProgress=center.x/(self.fullBlurOffset.x!=0?self.fullBlurOffset.x:1.f);
    float yProgress=center.y/(self.fullBlurOffset.y!=0?self.fullBlurOffset.y:1.f);
    float alpha=xProgress+yProgress;
    [self.blurredView setAlpha:alpha];
    [self updateBlurredViewFrame];
    
}

-(void)updateBlurredViewFrame
{
    self.blurredView.frame=self.targetView.bounds;
    //hide borders out of frame as they are not blurred
    self.blurredView.frame=CGRectInset(self.blurredView.frame, -2*self.blurRadius, -2*self.blurRadius);

}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(!self.blurredView)
    {
        [self refresh];
    }
    [self adjustBlur];
}


@end
