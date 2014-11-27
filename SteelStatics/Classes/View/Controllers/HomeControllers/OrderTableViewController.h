#import "BaseController.h"



#define SUB_PATH_QUOTE_ORDER @"QuoteOrder"

#define SUB_PATH_PAINT_ORDER @"PaintOrder"



@class OrderTableView;


@interface OrderTableViewController : UIViewController


@property(strong, readonly) OrderTableView* tableView;



+(NSString*) saveArchiversPathWithSubPath: (NSString*)subPath;



@end
