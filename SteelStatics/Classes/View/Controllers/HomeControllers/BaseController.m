#import "BaseController.h"
#import "AppInterface.h"

@implementation BaseController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden: NO animated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // Fit Device
    [FrameHelper translateSubViewsFramesRecursive:self.view handler:^BOOL(UIView *subview) {
        
        // for the situation label is the text filed placeholder
        if ([ViewHelper getSuperView: subview clazz:[UITextField class]]) {
            return YES;
        }
        
        // for more fit
        if ([subview isKindOfClass:[UILabel class]]) {
            UILabel* label = (UILabel*)subview;
            UIFont* font = label.font;
            label.font = [font fontWithSize: font.pointSize - 3];
        }
        return NO;
    }];
    
}


@end
