#import "OrderTableView.h"
#import "AppInterface.h"


#define REUSEIDENTIFIER @"reuseIdentifier"


@implementation OrderTableView


@synthesize cellsDataContents;


@synthesize sectionZeroView;


-(void)awakeFromNib
{
    [self setDefaultVariables];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setDefaultVariables];
    }
    return self;
}

-(void) setDefaultVariables
{
    self.delegate = self;
    self.dataSource = self;

    cellsDataContents = [[NSMutableArray alloc] init];
    
    [self setSeparatorColor:[UIColor clearColor]];
    [self registerClass:[OrderTableViewCell class] forCellReuseIdentifier: REUSEIDENTIFIER];
    
    self.tableHeaderView = [self setupTableHeaderView];
    self.tableFooterView = [self setupTableFooterView];
}

-(UIView*) setupTableHeaderView
{
    UIView* headerview = [[UIView alloc] initWithFrame:CanvasRect(0, 0, 0, 175)];

    [ViewsFactoryHelper createLabel:@"信源鋼結構工程有限公司\n工程報價單" frame:CanvasRect(133.5,0,500,80) fontSize: CanvasFontSize(30) superView:headerview];
    [ViewsFactoryHelper createLabel:@"建設單位:" frame:CanvasRect(1,85,150,30) fontSize:CanvasFontSize(25) superView:headerview];
    [ViewsFactoryHelper createLabel:@"名稱:" frame:CanvasRect(21,115,50,30) fontSize:CanvasFontSize(18) superView:headerview];
    [ViewsFactoryHelper createLabel:@"坡度:" frame:CanvasRect(280,115,50,30) fontSize:CanvasFontSize(18) superView:headerview];
    [ViewsFactoryHelper createLabel:@"建築面積:" frame:CanvasRect(490,115,90,30) fontSize:CanvasFontSize(18) superView:headerview];
    [ViewsFactoryHelper createLabel:@"規格:" frame:CanvasRect(21,145,50,30) fontSize:CanvasFontSize(18) superView:headerview];
    [ViewsFactoryHelper createLabel:@"柱距:" frame:CanvasRect(280,145,50,30) fontSize:CanvasFontSize(18) superView:headerview];
    [ViewsFactoryHelper createLabel:@"滴水高度:" frame:CanvasRect(490,145,90,30) fontSize:CanvasFontSize(18) superView:headerview];
    
    [ViewsFactoryHelper createTextField:@"" frame:CanvasRect(160, 86.5,600,30) enabled:YES  fontSize:CanvasFontSize(25) borderWidth:0 textAlignment:NSTextAlignmentLeft superView:headerview];
    [ViewsFactoryHelper createTextField:@"" frame:CanvasRect(90, 116.5,175,30) enabled:YES  fontSize:CanvasFontSize(18) borderWidth:0 textAlignment:NSTextAlignmentLeft superView:headerview];
    [ViewsFactoryHelper createTextField:@"" frame:CanvasRect(349, 116.5,150,30) enabled:YES  fontSize:CanvasFontSize(18) borderWidth:0 textAlignment:NSTextAlignmentLeft superView:headerview];
    [ViewsFactoryHelper createTextField:@"" frame:CanvasRect(599, 116.5,160,30) enabled:YES  fontSize:CanvasFontSize(18) borderWidth:0 textAlignment:NSTextAlignmentLeft superView:headerview];
    [ViewsFactoryHelper createTextField:@"" frame:CanvasRect(90, 146.5,175,30) enabled:YES  fontSize:CanvasFontSize(18) borderWidth:0 textAlignment:NSTextAlignmentLeft superView:headerview];
    [ViewsFactoryHelper createTextField:@"" frame:CanvasRect(349, 146.5,150,30) enabled:YES  fontSize:CanvasFontSize(18) borderWidth:0 textAlignment:NSTextAlignmentLeft superView:headerview];
    [ViewsFactoryHelper createTextField:@"" frame:CanvasRect(599, 146.5,160,30) enabled:YES  fontSize:CanvasFontSize(18) borderWidth:0 textAlignment:NSTextAlignmentLeft superView:headerview];
    [ViewsFactoryHelper createTextField:@"" frame:CanvasRect(3, 85,761,30) enabled:NO  fontSize:CanvasFontSize(20) borderWidth:0.5 textAlignment:NSTextAlignmentLeft superView:headerview];
    [ViewsFactoryHelper createTextField:@"" frame:CanvasRect(3, 115,761,30) enabled:NO  fontSize:CanvasFontSize(20) borderWidth:0.5 textAlignment:NSTextAlignmentLeft superView:headerview];
    [ViewsFactoryHelper createTextField:@"" frame:CanvasRect(3, 145,761,30) enabled:NO  fontSize:CanvasFontSize(20) borderWidth:0.5 textAlignment:NSTextAlignmentLeft superView:headerview];
    
    return headerview;
}

-(UIView*) setupTableFooterView
{
    UIView* footerview = [[UIView alloc] initWithFrame:CanvasRect(0, 0, 0, 180)];

    [ViewsFactoryHelper createTextField:@"聯繫人" frame:CanvasRect(404, 0, 90, 30) enabled:NO fontSize:CanvasFontSize(15) borderWidth:0.5 textAlignment:NSTextAlignmentCenter superView:footerview];
    [ViewsFactoryHelper createTextField:@"" frame:CanvasRect(494, 0, 270, 30) enabled:YES fontSize:CanvasFontSize(15) borderWidth:0.5 textAlignment:NSTextAlignmentCenter superView:footerview];
    [ViewsFactoryHelper createTextField:@"手機" frame:CanvasRect(404, 30, 90, 30) enabled:NO fontSize:CanvasFontSize(15) borderWidth:0.5 textAlignment:NSTextAlignmentCenter superView:footerview];
    [ViewsFactoryHelper createTextField:@"" frame:CanvasRect(494, 30, 270, 30) enabled:YES fontSize:CanvasFontSize(15) borderWidth:0.5 textAlignment:NSTextAlignmentCenter superView:footerview];
    [ViewsFactoryHelper createTextField:@"電話" frame:CanvasRect(404, 60, 90, 30) enabled:NO fontSize:CanvasFontSize(15) borderWidth:0.5 textAlignment:NSTextAlignmentCenter superView:footerview];
    [ViewsFactoryHelper createTextField:@"0758-36348858" frame:CanvasRect(494, 60, 270, 30) enabled:YES fontSize:CanvasFontSize(15) borderWidth:0.5 textAlignment:NSTextAlignmentCenter superView:footerview];
    [ViewsFactoryHelper createTextField:@"傳真" frame:CanvasRect(404, 90, 90, 30) enabled:NO fontSize:CanvasFontSize(15) borderWidth:0.5 textAlignment:NSTextAlignmentCenter superView:footerview];
    [ViewsFactoryHelper createTextField:@"0758-36348758" frame:CanvasRect(494, 90, 270, 30) enabled:YES fontSize:CanvasFontSize(15) borderWidth:0.5 textAlignment:NSTextAlignmentCenter superView:footerview];
    [ViewsFactoryHelper createTextField:@"地址" frame:CanvasRect(404, 120, 90, 30) enabled:NO fontSize:CanvasFontSize(15) borderWidth:0.5 textAlignment:NSTextAlignmentCenter superView:footerview];
    [ViewsFactoryHelper createTextField:@"肇慶市大旺高新區" frame:CanvasRect(494, 120, 270, 30) enabled:YES fontSize:CanvasFontSize(15) borderWidth:0.5 textAlignment:NSTextAlignmentCenter superView:footerview];
    [ViewsFactoryHelper createTextField:@"報價日期" frame:CanvasRect(404, 150, 90, 30) enabled:NO fontSize:CanvasFontSize(15) borderWidth:0.5 textAlignment:NSTextAlignmentCenter superView:footerview];
    
    NSString* dateString = [DateHelper stringFromDate: [NSDate date] pattern:@"YYYY年MM月dd日"];
    [ViewsFactoryHelper createTextField:dateString frame:CanvasRect(494, 150, 270, 30) enabled:YES fontSize:CanvasFontSize(15) borderWidth:0.5 textAlignment:NSTextAlignmentCenter superView:footerview];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CanvasRect(3 , 0, 401, 180)];
    textView.text = @"說明:\n\n1.本報價未含報建費、總包公司配合費、材料檢測費、防火塗料費、吊車樑及安裝費\n\n2.因材料波動較大，本報價有效期為三天\n\n3.落水管為±0.00以上";
    textView.font = [UIFont systemFontOfSize:CanvasFontSize(15)];
    [textView.layer setBorderWidth:0.5];
    [footerview addSubview: textView];
    
    return footerview;
}


-(UIView*) setupSectionView: (NSInteger)section
{
    if (! sectionZeroView) {
        UIView* sectionView = [[UIView alloc] init];
        for (int i = 0; i < Table_Column_Count; i++) {
            NSString* title = nil;
            CGRect rect = CGRectZero;
            if (i == 0) {
                title = @"序號";
                rect = CanvasRect(3, 0, 51, 30);
            } else if (i == 1) {
                title = @"項目名稱";
                rect = CanvasRect(54, 0, 175, 30);
            } else if (i == 2) {
                title = @"材料規格";
                rect = CanvasRect(229, 0, 175, 30);
            } else if (i == 3) {
                title = @"計算公式";
                rect = CanvasRect(404, 0, 0, 30);
            } else if (i == 4) {
                title = @"單位";
                rect = CanvasRect(404, 0, 60, 30);
            } else if (i == 5) {
                title = @"數量";
                rect = CanvasRect(464, 0, 90, 30);
            } else if (i == 6) {
                title = @"單價";
                rect = CanvasRect(554, 0, 90, 30);
            } else if (i == 7) {
                title = @"總價";
                rect = CanvasRect(644, 0, 120, 30);
            }
            
            UITextField* textField = [ViewsFactoryHelper createTextField:title frame:rect enabled:NO  fontSize:CanvasFontSize(18) borderWidth:0.5 textAlignment:NSTextAlignmentCenter superView:sectionView];
            textField.tag = Table_Column_Tag(i);
        }
        sectionZeroView = sectionView;
    }
    return sectionZeroView;
}

#pragma mark - Public Methods

-(void) iterateTableColumnHeaderViews: (BOOL(^)(int tag, UIView* columnHeaderView))handler
{
    for (int i = 0; i < Table_Column_Count; i++) {
        int tag = Table_Column_Tag(i);
        UIView* headerView = [sectionZeroView viewWithTag: tag];
        if(handler(tag, headerView)) return;
    }
}

-(void) iterateTableColumnCellViews: (UITableViewCell*)cell handler:(BOOL(^)(int tag, UIView* columnHeaderView, UIView* columnCellView))handler
{
    [self iterateTableColumnHeaderViews:^BOOL(int tag, UIView *columnHeaderView) {
        UIView* columnCellView = [cell.contentView viewWithTag:tag];
        return handler(tag, columnHeaderView, columnCellView) ;
    }];
}

-(void) updateVisibleColumnViewsFrames
{
    NSArray* indexPathsForVisibleRows = self.indexPathsForVisibleRows;
    for (int i = 0; i < indexPathsForVisibleRows.count; i++) {
        NSIndexPath* indexPath = indexPathsForVisibleRows[i];
        UITableViewCell* cell = [self cellForRowAtIndexPath: indexPath];
        [self updateColumnViewsFramesInCell: cell indexPath:indexPath];
    }
}

-(void) updateColumnViewsFramesInCell: (UITableViewCell*)cell indexPath:(NSIndexPath*)indexPath
{
    [self iterateTableColumnCellViews:cell handler:^BOOL(int tag, UIView *columnHeaderView, UIView *columnCellView) {
        CGRect rect = columnCellView.frame;
        rect.size.width = [columnHeaderView sizeWidth];
        rect.origin.x = [columnHeaderView originX];
        columnCellView.frame = rect;
        return NO;
    }];
}



-(void) updateCellValuesAtRow: (NSUInteger)row cell:(OrderTableViewCell*)cell
{
    NSDictionary* rowContents = [cellsDataContents objectAtIndex: row];
    [cell setValues: rowContents];
    [cell setIndex: row];
}




#pragma mark - Table view data source & delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CanvasH(50);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CanvasH(30);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self setupSectionView: section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cellsDataContents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSEIDENTIFIER forIndexPath:indexPath];
    [self updateCellValuesAtRow: indexPath.row cell:cell];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self updateColumnViewsFramesInCell: cell indexPath:indexPath];
}

// ----------------------- Delete Begin -----------------------
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self endEditing:YES];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [cellsDataContents removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationBottom];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view

    }
    [tableView reloadData];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"刪除";
}
// ----------------------- Delete Begin -----------------------

@end