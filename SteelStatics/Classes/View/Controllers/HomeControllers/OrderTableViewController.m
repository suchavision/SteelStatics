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
    tableView = [[OrderTableView alloc] initWithFrame: CanvasRect(4, 100, 768, 920)];
    [ColorHelper setBorder: tableView color:[UIColor blackColor]];
    [self.view addSubview: tableView];
    
    //
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
    
    
    //
    NormalButton* editButton = [[NormalButton alloc] init];
    editButton.frame = CanvasRect(150, 0, 150, 45);
    [editButton setTitle: @"編輯排序" forState:UIControlStateNormal];
    [editButton setTitle: @"完成編輯" forState:UIControlStateSelected];
    [editButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [editButton setTitleColor: [UIColor blackColor] forState:UIControlStateHighlighted];
    editButton.didClikcButtonAction = ^void(UIButton* button) {
        button.selected = !button.selected;
        
        BOOL isSelected = button.selected;
        [weakInstance.tableView setEditing: isSelected animated:YES];
        if (!isSelected) {
            [weakInstance.tableView performSelector:@selector(reloadData) withObject:nil afterDelay:0.5];
        }
        
    };
    
    //
    NormalButton* printButton = [[NormalButton alloc] init];
    printButton.frame = CanvasRect(300, 0, 150, 45);
    [printButton setTitle: @"列印表單" forState:UIControlStateNormal];
    [printButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [printButton setTitleColor: [UIColor blackColor] forState:UIControlStateHighlighted];
    printButton.didClikcButtonAction = ^void(UIButton* button) {
        [ViewHelper printView: tableView completeHandler:^(UIPrintInteractionController *controller, BOOL completed, NSError *error) {
            [VIEW showHint: @"已經加列印機隊列"];
        }];
    };
    
    // 
    NormalButton* saveButton = [[NormalButton alloc] init];
    saveButton.frame = CanvasRect(450, 0, 150, 45);
    [saveButton setTitle: @"保存表單" forState:UIControlStateNormal];
    [saveButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [saveButton setTitleColor: [UIColor blackColor] forState:UIControlStateHighlighted];
    saveButton.didClikcButtonAction = ^void(UIButton* button) {
        NSMutableArray* dataSources = weakInstance.tableView.cellsDataContents;
        NSString* savedPath = [OrderTableViewController saveArchiversPathWithSubPath: SUB_PATH_QUOTE_ORDER];
        NSString* fileName = [[DateHelper stringFromDate: [NSDate date] pattern:PATTERN_DATE_TIME] stringByAppendingString:@" Quote.data"];
        NSString* path = [savedPath stringByAppendingPathComponent: fileName];
        [FileManager createFolderWhileNotExist: path];
        [NSKeyedArchiver archiveRootObject: dataSources toFile: path];
        
        [VIEW showHint: @"已經保存"];
    };
    
    
    // 
    NormalButton* savedListButton = [[NormalButton alloc] init];
    savedListButton.frame = CanvasRect(600, 0, 150, 45);
    [savedListButton setTitle: @"表單列表" forState:UIControlStateNormal];
    [savedListButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [savedListButton setTitleColor: [UIColor blackColor] forState:UIControlStateHighlighted];
    savedListButton.didClikcButtonAction = ^void(UIButton* button) {
        NSString* savedPath = [OrderTableViewController saveArchiversPathWithSubPath: SUB_PATH_QUOTE_ORDER];
        NSArray* files = [FileManager getFileNamesIn: savedPath];
        if (!files) return;
        NSMutableDictionary* tableViewContentsDictionary = [DictionaryHelper deepCopy: @{@"": files}];
        
        PopTableView* popTableView = [[PopTableView alloc] init];
        popTableView.tableViewObj.tableView.contentsDictionary = tableViewContentsDictionary;
        popTableView.tableViewObj.tableView.tableViewBaseDidSelectIndexPathAction = ^void(TableViewBase* tableViewBase, NSIndexPath* indexPath) {
            
            NSString* filename = [tableViewBase contentForIndexPath: indexPath];
            NSString* filepath = [savedPath stringByAppendingPathComponent: filename];
            
            NSArray* tmp = [NSKeyedUnarchiver unarchiveObjectWithFile: filepath];
            NSMutableArray* dataSources = [ArrayHelper deepCopy: tmp];
            [weakInstance.tableView.cellsDataContents setArray: dataSources];
            [weakInstance.tableView reloadData];
            
            [PopupViewHelper dissmissCurrentPopView];
        };
        [PopupViewHelper popView:popTableView willDissmiss:nil];
        
        // delete 
        popTableView.tableViewObj.tableView.tableViewBaseCanEditIndexPathAction = ^BOOL(TableViewBase * tableView, NSIndexPath * indexPath){
            return YES;
        };
        popTableView.tableViewObj.tableView.tableViewBaseShouldDeleteContentsAction = ^BOOL(TableViewBase* tableViewObj, NSIndexPath* indexPath) {
            NSString* fileName = [tableViewObj contentForIndexPath:indexPath];
            NSString* fullPath = [savedPath stringByAppendingPathComponent: fileName];
            [FileManager deleteFile: fullPath];
            return YES;
        };
    };
    
    
    //
    UIView* toolsView = [[UIView alloc] initWithFrame:CanvasRect(0, 48, 768, 50)];
    [self.view addSubview: toolsView];
    [toolsView addSubview: expandButton];
    [toolsView addSubview: editButton];
    [toolsView addSubview: printButton];
    [toolsView addSubview: saveButton];
    [toolsView addSubview: savedListButton];
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


+(NSString*) saveArchiversPathWithSubPath: (NSString*)subPath
{
    return [[FileManager documentsPath] stringByAppendingPathComponent:subPath];
}


@end
