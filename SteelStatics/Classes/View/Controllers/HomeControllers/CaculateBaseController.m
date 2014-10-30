#import "CaculateBaseController.h"
#import "AppInterface.h"


@implementation CaculateBaseController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden: YES animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // swip
    [GestureHelper addGestureToView: self.view];
    
    // content view
    AppScrollView* scrollView = (AppScrollView*)self.view;
    UIView* contentView = [scrollView.subviews firstObject];
    
    // when CaculateTextField set text action
    [ViewHelper iterateSubView: contentView class:[CaculateTextField class] handler:^BOOL(id subView) {
        CaculateTextField* textField = (CaculateTextField*)subView;
        textField.textFieldDidSetTextBlock = ^void(NormalTextField* textField, NSString* oldText){
            [self doAutoUpdateResult: textField originText:oldText];
        };
        
        textField.textFieldDidEndEditingBlock = ^void(NormalTextField* textField, NSString* oldText){
            [self doAutoUpdateResult: textField originText:oldText];
        };
        textField.textFieldEditingChangedBlock = ^void(NormalTextField* textField) {
            [self doAutoUpdateResult: textField originText:nil];
        };
        return NO;
    }];
    
    // add order Button
    [ViewHelper iterateSubView: contentView class:[AddOrderButton class] handler:^BOOL(AddOrderButton *orderButton) {
        orderButton.didClickButtonAction = ^void(BaseButton* button) {
            
            ValueView* valueView = (ValueView*)[ViewHelper getSuperView: button clazz:[ValueView class]];
            NSMutableDictionary* values = [valueView getDatas];
            
            OrderTableViewController* tableViewController = VIEW.tableController;
            [tableViewController.tableView.cellsDataContents addObject: values];
            
            [VIEW showHint: @"已經加入表單"];
        };
        return NO;
    }];
}



#pragma mark - Private Methods

-(void) doAutoUpdateResult: (UITextField*)textField originText:(NSString*)originText
{
    NSString* newText = textField.text;
    if ([newText isEqualToString: originText]) return;
    if (![SSViewHelper checkIsNumericWithAlert: newText]) {
        textField.text = nil;
        return;
    }
    [self autoUpdateResuls:textField];
}



#pragma mark - Override Methods

-(void) autoUpdateResuls:(UITextField *)textField {}




@end
