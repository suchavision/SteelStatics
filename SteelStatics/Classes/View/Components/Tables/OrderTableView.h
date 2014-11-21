#import <UIKit/UIKit.h>


#define Table_Column_Count 8
#define Table_Column_Tag(i) (1011 + i)



@class OrderTableViewCell;


@interface OrderTableView : UITableView <UITableViewDelegate, UITableViewDataSource>


@property (readonly, strong) NSMutableArray* cellsDataContents;


@property (readonly, strong) UIView* sectionZeroView;



@property (assign) BOOL isExpandFormulaView;








#pragma mark - Public Methods

-(void) updateCellValuesAtRow: (NSUInteger)row cell:(OrderTableViewCell*)cell;

-(void) iterateTableColumnHeaderViews: (BOOL(^)(int tag, UIView* columnHeaderView))handler;

-(void) iterateTableColumnCellViews: (UITableViewCell*)cell handler:(BOOL(^)(int tag, UIView* columnHeaderView, UIView* columnCellView))handler;

-(void) updateVisibleColumnViewsFrames;

-(void) updateColumnViewsFramesInCell: (UITableViewCell*)cell indexPath:(NSIndexPath*)indexPath;

@end
