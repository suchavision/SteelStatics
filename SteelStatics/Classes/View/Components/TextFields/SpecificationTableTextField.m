#import "SpecificationTableTextField.h"
#import "AppInterface.h"

@implementation SpecificationTableTextField
{
    UIControl* tapOverlayView;
}

@synthesize popTableView;

-(void) initializeDefaultVariables
{
    [super initializeDefaultVariables];

    // popup table
    if (! popTableView) {
        __weak SpecificationTableTextField* weakInstance = self;
        popTableView = [[PopTableView alloc] init];
        popTableView.tableViewObj.tableView.tableViewBaseDidSelectIndexPathAction = ^void(TableViewBase* tableViewBase, NSIndexPath* indexPath) {
            NSString* text = [tableViewBase contentForIndexPath: indexPath];
            weakInstance.text = text;
            weakInstance.didSelectTextInTableAction(weakInstance);
            [PopupViewHelper dissmissCurrentPopView];
        };
    }
    [popTableView setTitle: self.placeholder];
    
    // over layer
    if (! tapOverlayView) {
        tapOverlayView = [[UIControl alloc] init];
        [tapOverlayView addTarget: self action:@selector(strokeAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}


-(void)didMoveToSuperview
{
    [super didMoveToSuperview];
    
    if (!popTableView || !tapOverlayView) {
        [self initializeDefaultVariables];
    }
    
    tapOverlayView.frame = self.frame;
    [self.superview addSubview: tapOverlayView];
}


#pragma mark - Public Methods

-(void)setDataSources:(NSArray *)datasSources
{
    popTableView.tableViewObj.tableView.contentsDictionary = [@{@"": datasSources} mutableCopy];
    [popTableView.tableViewObj.tableView reloadData];
}


#pragma mark - Private Methods

-(void) strokeAction: (UIControl*)sender
{
    [PopupViewHelper popView:popTableView willDissmiss:nil];
}

@end
