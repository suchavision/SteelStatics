#import <UIKit/UIKit.h>

@class HeaderSearchTableView;

@interface PopTableView : UIView

@property (strong) HeaderSearchTableView* tableViewObj;

-(void) setTitle: (NSString*)title;

@end
