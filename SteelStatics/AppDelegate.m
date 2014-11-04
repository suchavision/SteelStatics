#import "AppDelegate.h"
#import "AppInterface.h"


#import "IQKeyboardManager.h"



@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    [FrameTranslater setCanvasSize: CGSizeMake(768, 1024)];

    [IQKeyboardManager enableKeyboardManagerWithDistance: CanvasH(0)];
    
//    [[KeyBoardHelper sharedInstance] setKeyboardDistanceFromTextField: CanvasH(0)];
    
    // initialize the window
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    MainTabBarController* tabController = [storyboard instantiateInitialViewController];
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    self.window.rootViewController = tabController;
    [self.window makeKeyAndVisible];
    
    
    // initialize the views and controllers
    VIEW.mainTabController = tabController;
    OrderTableViewController* tableViewController = nil;
    for (int i = 0; i < tabController.viewControllers.count; i++) {
        UIViewController* controller = tabController.viewControllers[i];
        if ([controller isKindOfClass:[OrderTableViewController class]]) {
            tableViewController = (OrderTableViewController*)controller;
            break;
        }
    }
    VIEW.tableController = tableViewController;
    
    // load all the view
    for (int i = 0; i < tabController.viewControllers.count; i++) {
        [tabController setSelectedIndex: i];
    }
    [tabController setSelectedIndex: 0];
    
    
    
    return YES;
}

@end
