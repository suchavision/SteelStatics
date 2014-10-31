#import "OrderTableViewCell.h"
#import "AppInterface.h"

@implementation OrderTableViewCell
{
    BaseTextField* numberTextField;
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        numberTextField = [self createTextAndAddToContentView:CanvasRect(3, 0, 51, 50) key: kColumn_Number enable:NO];
        numberTextField.tag = Table_Column_Tag(0);
        
        [self createTextAndAddToContentView:CanvasRect(54, 0, 175, 50) key: kProject_Name enable:YES].tag = Table_Column_Tag(1);
        [self createTextAndAddToContentView:CanvasRect(229, 0, 175, 50) key: kMaterial_Specifications enable:YES].tag = Table_Column_Tag(2);
        
        FormulaImageView* formulaImageView = [[FormulaImageView alloc]initWithFrame: CanvasRect(404, 0, 90, 50)];
        formulaImageView.attributeKey = kFormula_Image;
        formulaImageView.layer.borderWidth = 0.5;
        [self.contentView addSubview:formulaImageView];
        formulaImageView.tag = Table_Column_Tag(3);
        formulaImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self createTextAndAddToContentView:CanvasRect(494, 0, 50, 50) key: kResult_Unit enable:YES].tag = Table_Column_Tag(4);
        
        
        
        CaculateTextField* caculateResultTextField = [[CaculateTextField alloc] initWithFrame:CanvasRect(544, 0, 70, 50)];
        caculateResultTextField.attributeKey = kCaculate_Result;
        caculateResultTextField.tag = Table_Column_Tag(5);
        caculateResultTextField.layer.borderWidth = 0.5;
        caculateResultTextField.textAlignment = NSTextAlignmentCenter;
        caculateResultTextField.borderStyle = UITextBorderStyleNone;
        caculateResultTextField.keyboardType = UIKeyboardTypeDecimalPad;
        [self.contentView addSubview: caculateResultTextField];
        
        CaculateTextField* unitPriceTextField = [[CaculateTextField alloc] initWithFrame:CanvasRect(614, 0, 70, 50)];
        unitPriceTextField.attributeKey = kUnit_Price;
        unitPriceTextField.tag = Table_Column_Tag(6);
        unitPriceTextField.layer.borderWidth = 0.5;
        unitPriceTextField.textAlignment = NSTextAlignmentCenter;
        unitPriceTextField.borderStyle = UITextBorderStyleNone;
        unitPriceTextField.keyboardType = UIKeyboardTypeDecimalPad;
        [self.contentView addSubview: unitPriceTextField];
        
        
        [self createTextAndAddToContentView:CanvasRect(684, 0, 80, 50) key: kTotal enable:NO].tag = Table_Column_Tag(7);
        
        
        
        [ViewHelper iterateSubView:self.contentView class:[BaseTextField class] handler:^BOOL(UIView *view) {
            BaseTextField* textField = (BaseTextField*)view;
            
            textField.textFieldDidEndEditingBlock = ^void(NormalTextField* textField, NSString* oldText){
                [self updateTableViewDatasources: (BaseTextField*)textField originText:oldText];
            };
            textField.textFieldDidSetTextBlock = ^void(NormalTextField* textField, NSString* oldText){
                [self updateTableViewDatasources: (BaseTextField*)textField originText:oldText];
            };
            textField.textFieldEditingChangedBlock = ^void(NormalTextField* textField) {
                [self updateTableViewDatasources: (BaseTextField*)textField originText:nil];
            };
            return NO;
        }];
    }
    return self;
}

-(void)setIndex:(NSUInteger)index
{
    numberTextField.text = [NSString stringWithFormat: @"%lu", index + 1];
}

-(NSUInteger)index
{
    return [numberTextField.text integerValue];
}

-(void) setValues:(NSDictionary *)values
{
    for (UIView* subView in self.contentView.subviews) {
        if ([subView conformsToProtocol:@protocol(ComponentProtocal) ]) {
            id<ComponentProtocal> component = (id<ComponentProtocal>)subView;
            NSString* key = [component attributeKey];
            id value = values[key];
            if (value && key) {
                [component setConnotation: value];
            }
        }
    }
}

-(NSMutableDictionary*) getValues
{
    NSMutableDictionary* result = [NSMutableDictionary dictionary];
    for (UIView* subView in self.contentView.subviews) {
        if ([subView conformsToProtocol:@protocol(ComponentProtocal) ]) {
            id<ComponentProtocal> component = (id<ComponentProtocal>)subView;
            NSString* key = [component attributeKey];
            id value = [component connotation];
            if (value && key) {
                [result setObject:value forKey:key];
            }
        }
    }
    return result;
}




#pragma mark - Private Methods

-(BaseTextField*) createTextAndAddToContentView: (CGRect)frame key:(NSString*)key enable:(BOOL)enabled
{
    BaseTextField* textTextField = [SSViewHelper createText:nil frame:frame key:key enable:enabled];
    textTextField.borderStyle = UITextBorderStyleNone;
    [self.contentView addSubview: textTextField];
    return textTextField;
}



-(void) updateTableViewDatasources: (BaseTextField*)textField originText:(NSString*)originText
{
    // the same text , return .
    NSString* newText = textField.text;
    if ([newText isEqualToString: originText]) return;
    
    
    // for kUnit_Price & kCaculate_Result, not number , return .
    NSString* key = textField.attributeKey;
    if ([key isEqualToString:kUnit_Price] || [key isEqualToString: kCaculate_Result]) {
        if (![SSViewHelper checkIsNumericWithAlert: newText]) {
            textField.text = nil;
            return;
        }
    }
    
    
    OrderTableView* tableView = VIEW.tableController.tableView;
    NSMutableArray* cellsDataContents = tableView.cellsDataContents;
    
    NSMutableDictionary* values = [self getValues];
    NSIndexPath* indexPath = [tableView indexPathForCell: self];
    if (!indexPath) {
        // the cell is not in the table
        return;
    }
    
    
    
    // for kUnit_Price & kCaculate_Result,  update the caculate results
    if (!isEmptyString(values[kCaculate_Result]) && !isEmptyString(values[kUnit_Price])) {
        float quantityPrice = [values[kCaculate_Result] floatValue];
        float unitPrice = [values[kUnit_Price] floatValue];
        
        float total = unitPrice * quantityPrice;
        NSString* totalString = [NSString stringWithFormat:@"%.0f", total];
        [values setObject: totalString forKey: kTotal];
    }
    
    [cellsDataContents replaceObjectAtIndex: indexPath.row withObject:values];
    
    [tableView updateCellValuesAtRow:indexPath.row cell:self];
}


@end
