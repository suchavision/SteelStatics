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
//        if (i == 1) {
//            NavigationController* navController = (NavigationController*)[tabController.viewControllers objectAtIndex: i];
//            if (navController.viewControllers.count == 0) {
//                UIViewController* controller = [storyboard instantiateViewControllerWithIdentifier: @"RolledSteelController"];
//                [navController pushViewController: controller animated:YES];
//            }
//        }
        [tabController setSelectedIndex: i];
    }
    [tabController setSelectedIndex: 0];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
