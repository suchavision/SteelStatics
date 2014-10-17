#import <UIKit/UIKit.h>

@interface MainTabBarController : UITabBarController

-(void) hideTabsViewAction;
-(void) showTabsViewAction;


-(void) transitionToIndex:(NSInteger)index;

@end
