#import "OtherTableViewCell.h"
#import "AppInterface.h"


@implementation OtherTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier NS_AVAILABLE_IOS(3_0)
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

-(void) initialize: (NSDictionary*)dictionary
{
    _isInitialize = YES;
    for (NSString* attributeKey in dictionary) {
        CGRect rect = CGRectFromString(dictionary[attributeKey]);
        
        __weak OtherTableViewCell* weakInstance = self;
        
        UIView* view = nil;
        
        if([attributeKey isEqualToString:kColumn_Action]) {
            
            NormalButton* addButton = [[NormalButton alloc] init];

            [addButton setTitle: @"加入清單" forState:UIControlStateNormal];
            [addButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
            [addButton setTitleColor: [UIColor blackColor] forState:UIControlStateHighlighted];
            
            [self.contentView addSubview: addButton];
            
            addButton.didClikcButtonAction = ^void(NormalButton* btn) {
                OtherTableViewCell* cell = (OtherTableViewCell*)[TableViewHelper getTableViewCellBySubView: btn];
                NSDictionary* contents = [cell getContents];
                
                OrderTableViewController* tableViewController = VIEW.tableController;
                OrderTableView* orderTableView = tableViewController.tableView;
                [orderTableView.cellsDataContents addObject: contents];
                [orderTableView reloadData];
                
                [VIEW showHint: @"已經加入表單"];
            };
            
            
            view = addButton;
            
        } else {
            
            
            BaseTextField* field = [[BaseTextField alloc] init];
            
            if ([attributeKey isEqualToString: kColumn_Unit_Price] || [attributeKey isEqualToString: kColumn_Caculate_Quantity]) {
                
                field = [[NumberTextField alloc] init];
                
                // auto update
                field.textFieldDidEndEditingBlock = ^void(NormalTextField* textField, NSString* oldText){
                    [weakInstance autoUpdateResults: textField];
                };
                field.textFieldDidSetTextBlock = ^void(NormalTextField* textField, NSString* oldText){
                    // forbid stack overflow
                    if ([textField.text isEqualToString: oldText]) return;
                    [weakInstance autoUpdateResults: textField];
                };
                field.textFieldEditingChangedBlock = ^void(NormalTextField* textField) {
                    if ([textField.text hasSuffix:@"."]) return;
                    
                    [weakInstance autoUpdateResults: textField];
                };
                
            }

            field.attributeKey = attributeKey;
            field.textAlignment = NSTextAlignmentCenter;
            field.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(18)];
            
            view = field;
        }
        
        
        view.frame = rect;
        view.layer.borderWidth = 0.5;

        [view setOriginY: CanvasY(1)];
        [view setSizeHeight: CanvasH(49)];
        [view addOriginX: -1];
        [view addSizeWidth: 1];
        
        [self.contentView addSubview: view];
    }
}

-(NSMutableDictionary*) getContents
{
    NSMutableDictionary* contents = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < self.contentView.subviews.count; i++) {
        UIView* view = self.contentView.subviews[i];
        if ([view isKindOfClass:[BaseTextField class]]) {
            
            BaseTextField* tx = (BaseTextField*)view;
            NSString* attributeKey = tx.attributeKey;
            id value = tx.text;

            if (value) {
                [contents setObject: value forKey:attributeKey];
            }
            
        }
    }
    
    if (_identifcation) {
        [contents setObject:_identifcation forKey:kColumn_Id];
    }
    
    return contents;
}

-(void) setContents:(NSMutableDictionary *)contents
{
    _identifcation = contents[kColumn_Id];
    
    for (int i = 0; i < self.contentView.subviews.count; i++) {
        UIView* view = self.contentView.subviews[i];
        if ([view isKindOfClass:[BaseTextField class]]) {
            
            BaseTextField* tx = (BaseTextField*)view;
            NSString* attributeKey = tx.attributeKey;
            id value = contents[attributeKey];
            if ([value isKindOfClass:[NSNumber class]]) {
                value = [value stringValue];
            }
            tx.text = value;
            
        }
    }
    
    BaseTextField* totalPriceTextField = [self getCellTextFieldWithKey: kColumn_Total_Price];
    totalPriceTextField.text = nil;
    
    NumberTextField* unitPriceTextField = (NumberTextField*)[self getCellTextFieldWithKey: kColumn_Unit_Price];
    NumberTextField* quantityTextField = (NumberTextField*)[self getCellTextFieldWithKey: kColumn_Caculate_Quantity];
    
    float unitPriceValue = unitPriceTextField.value;
    float quantityValue = quantityTextField.value;
    
    if (unitPriceValue == 0 || quantityValue == 0) return;
    
    float totalPrice = unitPriceValue * quantityValue;
    
    totalPriceTextField.text = [NSString stringWithFormat:@"%.2f", totalPrice];
}

-(BaseTextField*) getCellTextFieldWithKey: (NSString*)key
{
    for (int i = 0; i < self.contentView.subviews.count; i++) {
        UIView* view = self.contentView.subviews[i];
        if ([view isKindOfClass:[BaseTextField class]]) {
            BaseTextField* tx = (BaseTextField*)view;
            NSString* attributeKey = tx.attributeKey;
            if ([attributeKey isEqualToString: key]) {
                return tx;
            }
        }
    }
    return nil;
}

#pragma mark -

-(void) autoUpdateResults: (UITextField*)textField
{
    NumberTextField* numTx = (NumberTextField*)textField;
    OtherController* otherController = (OtherController*)[ViewHelper getTopViewController];
    
    if (![otherController isKindOfClass:[OtherController class]]) return;
    
    NSMutableArray* sectionZeroContents = otherController.sectionZeroContents;
    
    UITableView* tableView = otherController.otherTableView;
    OtherTableViewCell* cell = (OtherTableViewCell*)[TableViewHelper getTableViewCellBySubView: numTx];
    
    NSIndexPath* indexPath = [tableView indexPathForCell: cell];
    if (!indexPath) {
        return;
    }
    
    NSString* key = numTx.attributeKey;
    
    NSUInteger row = indexPath.row;
    NSMutableDictionary* contents = [sectionZeroContents objectAtIndex: row];
    
    if (numTx.text == nil || [numTx.text isEqualToString:@""]) {
        [contents removeObjectForKey: key];
    } else {
        [contents setObject: @(numTx.value) forKey:key];
    }

    [cell setContents: contents];
}



@end
