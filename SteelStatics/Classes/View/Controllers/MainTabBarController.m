#import "MainTabBarController.h"
#import "AppInterface.h"

@implementation MainTabBarController
{
    UIView* customTabsView;
}

- (BOOL)shouldAutorotate NS_AVAILABLE_IOS(6_0)
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations NS_AVAILABLE_IOS(6_0)
{
    return UIInterfaceOrientationMaskAll;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation NS_AVAILABLE_IOS(6_0)
{
    return UIInterfaceOrientationPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat space = 1;
    int buttonCount = (int)self.viewControllers.count;
    CGFloat width = [RectHelper getScreenSizeByControllerOrientation].width;
    
    customTabsView = [[UIView alloc] init];
    customTabsView.backgroundColor = [UIColor whiteColor];
    [customTabsView setSizeWidth: width];
    [customTabsView setSizeHeight: CanvasH(50)];
    
    
    for (int i = 0; i < buttonCount; i++) {
        NSString* title = nil;
        if (i == 0) {
            title = @"表面未處理鋼材計算";
        }
//        if (i == 1) {
//            title = @"表面已處理鋼材計算";
//        }
        if (i == 1) {
            title = @"其它";
        }
        if (i == 2) {
            title = @"報價單";
        }
        if (i == 3) {
            title = @"油漆計算";
        }
        //rect
        CGRect rect = CanvasRect(0, 0, 150, 45);
        rect.size.width = (width - (buttonCount + 1) * space) / buttonCount;
        rect.origin.x = space + space * i + rect.size.width * i;
        //image
        NSString* image = nil;// @"orange";
        [self createButton: title frame:rect image:image selector:@selector(buttonTabAction:) tag:i superView:customTabsView];
    }
    
    [self.view addSubview: customTabsView];
}


#pragma mark - Public Methods

-(void) hideTabsViewAction
{
    [UIView animateWithDuration: 0.5 animations:^{
        [customTabsView setOriginY: CanvasH(-200)];
    } completion:nil];
}

-(void) showTabsViewAction
{
    [UIView animateWithDuration: 0.5 animations:^{
        [customTabsView setOriginY: CanvasH(0)];
    } completion:nil];
}


#pragma mark - Action Methods

-(void) buttonTabAction:(UIButton*)button
{
    [self transitionToIndex: button.tag];
}


#pragma mark - Private Methods


-(UIButton*) createButton: (NSString*)title frame:(CGRect)frame image:(NSString*)image selector:(SEL)selector tag:(int)tag superView:(UIView*)superView
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:selector forControlEvents: UIControlEventTouchUpInside];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal] ;
    button.titleLabel.lineBreakMode = YES;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.font = [UIFont boldSystemFontOfSize: CanvasFontSize(22)];
    if (image) [button setBackgroundImage:[UIImage imageNamed: image] forState:UIControlStateNormal];
    button.tag = tag;
    [superView addSubview: button];
    return button;
}

-(void) transitionToIndex:(NSInteger)index
{
    if (self.selectedIndex == index) return;
    
    [self.view endEditing:YES];
    
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType: @"pageUnCurl"];
    [self.view.layer addAnimation:transition forKey:nil];
    [self setSelectedIndex:index];
}


#pragma mark - Override Methods

-(void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    //
    [ViewHelper iterateSubView: customTabsView class:[UIButton class] handler:^BOOL(id subView) {
        UIButton* button = (UIButton*)subView;
        if (button.tag == selectedIndex) {
            [self setButtonSelected: button];
        } else {
            [self setButtonUnSelected: button];
        }
        return NO;
    }];
}

-(void) setButtonSelected: (UIButton*)button
{
    [ColorHelper setBorder: button color:[UIColor flatDarkBlackColor]];
    [ColorHelper setBackGround: button color: @[@(191),@(191),@(191)]];
    [button setTitleColor: [UIColor flatBlueColor] forState:UIControlStateNormal];
}

-(void) setButtonUnSelected: (UIButton*)button
{
    [ColorHelper setBorder: button color:[UIColor flatDarkGrayColor]];
    [ColorHelper setBackGround: button color: [UIColor whiteColor]];
    [button setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
}


@end
