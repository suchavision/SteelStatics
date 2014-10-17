#import "AppScrollView.h"

@implementation AppScrollView



-(void)awakeFromNib
{
    self.delegate = self;
    self.minimumZoomScale = 1.0f;
    self.maximumZoomScale = 2.0f;
    self.delaysContentTouches = NO;
}


#pragma mark - Delegage Methods

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [scrollView.subviews firstObject];
}


@end
