#import <Foundation/Foundation.h>

#define VIEW [ViewManager shareInstance]

@class MainTabBarController;
@class OrderTableViewController;

@interface ViewManager : NSObject


@property (strong) MainTabBarController* mainTabController;

@property (strong) OrderTableViewController* tableController;



+(ViewManager*) shareInstance;



#pragma mark - Public Methods

-(void) showHint: (NSString*)string;

@end
