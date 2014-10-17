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
    [GestureHelper addGestureToView: self.view];
    
    //
    tableView = [[OrderTableView alloc] initWithFrame: CanvasRect(4, 50, 760, 900)];
    [ColorHelper setBorder: tableView color:[UIColor blackColor]];
    [self.view addSubview: tableView];
    
    //
    UIButton* expandButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    expandButton.frame = CanvasRect(680, 65, 100, 70);
    [expandButton addTarget:self action:@selector(expandButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: expandButton];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
    [tableView reloadData];
}

- (void) expandButtonAction:(UIButton*)button
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
