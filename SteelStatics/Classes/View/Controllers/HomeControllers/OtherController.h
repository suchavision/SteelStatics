#import "CaculateBaseController.h"



#define OTHER_TABLE_COLUMN_TAG(i) (8033 + i)


@interface OtherController : CaculateBaseController


@property (strong) UITableView* otherTableView;

@property (strong) UIView* sectionZeroView;

@property (strong) NSMutableArray* sectionZeroContents;



@end
