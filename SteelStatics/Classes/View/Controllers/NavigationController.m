#import "NavigationController.h"
#import "AppInterface.h"

@implementation NavigationController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    self.delegate = self;
}


#pragma mark - UINavigationControllerDelegate Methods

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSArray* controllers = navigationController.viewControllers;
    
    MainTabBarController* tabController = (MainTabBarController*)self.view.window.rootViewController;
    if (viewController == [controllers firstObject]) {
        
        [self.navigationController setNavigationBarHidden: YES animated:YES];
        
        [tabController showTabsViewAction];
        
    } else {
        
        [self.navigationController setNavigationBarHidden: NO animated:YES];
        
        [tabController hideTabsViewAction];
    }
}

@end