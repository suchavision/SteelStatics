#import "OrderTableViewController.h"
#import "AppInterface.h"

@implementation OrderTableViewController
{
    NSMutableArray* afterFrames;
    NSMutableArray* originFrames;
}


@synthesize tableView = tableView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weak OrderTableViewController* weakInstance = self;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [GestureHelper addGestureToView: self.view];
    
    //
    tableView = [[OrderTableView alloc] initWithFrame: CanvasRect(4, 100, 760, 900)];
    [ColorHelper setBorder: tableView color:[UIColor blackColor]];
    [self.view addSubview: tableView];
    
    //
    UIView* toolsView = [[UIView alloc] initWithFrame:CanvasRect(0, 48, 768, 50)];
    [ColorHelper setBorder: toolsView color:[UIColor grayColor]];
    [self.view addSubview: toolsView];
    
    NormalButton* expandButton = [[NormalButton alloc] init];
    expandButton.frame = CanvasRect(0, 0, 150, 45);
    [expandButton setTitle: @"顯示公式" forState:UIControlStateNormal];
    [expandButton setTitle: @"隱藏公式" forState:UIControlStateSelected];
    [expandButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [expandButton setTitleColor: [UIColor blackColor] forState:UIControlStateHighlighted];
    expandButton.didClikcButtonAction = ^void(UIButton* button) {
        button.selected = !button.selected;
        [weakInstance expandFormulaAction:button];
    };
    
    
    NormalButton* editButton = [[NormalButton alloc] init];
    editButton.frame = CanvasRect(200, 0, 150, 45);
    [editButton setTitle: @"編輯排序" forState:UIControlStateNormal];
    [editButton setTitle: @"完成編輯" forState:UIControlStateSelected];
    [editButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [editButton setTitleColor: [UIColor blackColor] forState:UIControlStateHighlighted];
    editButton.didClikcButtonAction = ^void(UIButton* button) {
        button.selected = !button.selected;
        
        BOOL isSelected = button.selected;
        [weakInstance.tableView setEditing: isSelected animated:YES];
        if (isSelected) {
            [weakInstance.tableView.moveSequencesRows removeAllObjects];
        } else {
            NSArray* array = weakInstance.tableView.moveSequencesRows;
            for (int i = 0; i < array.count; i++) {
                NSArray* fromTo = array[i];
                int from = [[fromTo firstObject] intValue];
                int to = [[fromTo lastObject] intValue];
                [weakInstance.tableView.cellsDataContents exchangeObjectAtIndex: from withObjectAtIndex:to];
            }
            [weakInstance.tableView reloadData];
        }
        
    };
    
    
    [toolsView addSubview: expandButton];
    [toolsView addSubview: editButton];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
    [tableView reloadData];
}

- (void) expandFormulaAction:(id)sender
{
    if (!originFrames) {
        NSMutableArray* array = [NSMutableArray array];
        [tableView iterateTableColumnHeaderViews:^BOOL(int tag, UIView *columnHeaderView) {
            CGRect rect = columnHeaderView.frame;
            [array addObject: [NSValue valueWithCGRect:rect]];
            return NO;
        }];
        originFrames = array;
    }
    
    if (!afterFrames) {
        
        int multipleForward = 3;
        int multipleBackward = 2;
        __block CGFloat increment = CanvasW(90);
        int standardTag = Table_Column_Tag(3);
        [tableView iterateTableColumnHeaderViews:^BOOL(int tag, UIView *columnHeaderView) {
            if (tag == standardTag) {
                [columnHeaderView setSizeWidth: increment * (multipleForward + multipleBackward)];
            }
            return NO;
        }];
        
        

        
        NSMutableArray* array = [NSMutableArray array];
        [tableView iterateTableColumnHeaderViews:^BOOL(int tag, UIView *columnHeaderView) {
            if (tag <= standardTag) {
                [columnHeaderView addOriginX: (-increment * multipleForward)];
            } else {
                [columnHeaderView addOriginX: (+increment * multipleBackward)];
            }
            
            CGRect rect = columnHeaderView.frame;
            [array addObject: [NSValue valueWithCGRect:rect]];
            return NO;
        }];
        
        afterFrames = array;
    }
    
    
    tableView.isExpandFormulaView = !tableView.isExpandFormulaView;
    BOOL isExpandFormulaView = tableView.isExpandFormulaView;
    
    [UIView animateWithDuration: 0.5 animations:^{
        
        
        NSArray* frames = isExpandFormulaView ? afterFrames : originFrames;
        
        __block int index = 0;
        [tableView iterateTableColumnHeaderViews:^BOOL(int tag, UIView *columnHeaderView) {
            CGRect rect = [[frames objectAtIndex: index] CGRectValue];
            columnHeaderView.frame = rect;
            index++;
            return NO;
        }];
        
        [tableView updateVisibleColumnViewsFrames];
        
    } completion:nil];
}

@end
