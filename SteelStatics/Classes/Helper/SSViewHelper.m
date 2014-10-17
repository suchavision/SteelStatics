#import "SSViewHelper.h"
#import "AppInterface.h"



@implementation SSViewHelper


#pragma mark -

+(ValueView*) getValueView: (NSString*)attributeKey inView:(UIView*)inView
{
    __block ValueView* result = nil;
    [ViewHelper iterateSubView:inView class:[ValueView class] handler:^BOOL(UIView *view) {
        ValueView* valueView = (ValueView*)view;
        if ([valueView.attributeKey isEqualToString: attributeKey]) {
            result = valueView;
            return YES;
        }
        return NO;
    }];
    return result;
}

+(BaseTextField*) getBaseTextFieldByAttributeKey:(NSString*)attributeKey inView:(UIView*)inView
{
    __block BaseTextField* result = nil;
    [ViewHelper iterateSubView:inView class:[BaseTextField class] handler:^BOOL(UIView *view) {
        BaseTextField* textField = (BaseTextField*) view;
        if ([textField.attributeKey isEqualToString:attributeKey]) {
            result = textField;
            return YES;
        }
        return NO;
    }];
    return result;
}



+(BaseTextField*) createText: (NSString*)title frame:(CGRect)frame key:(NSString*)key enable:(BOOL)enabled
{
    BaseTextField *textTextField = [[BaseTextField alloc]initWithFrame:frame];
    textTextField.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(15)];
    textTextField.text = title;
    [textTextField.layer setBorderWidth:0.5];
    textTextField.textAlignment = NSTextAlignmentCenter;
    textTextField.attributeKey = key;
    textTextField.enabled = enabled;
    return textTextField;
}



#pragma mark -

+(void) setViewsHiddenNO: (NSArray*)views
{
    [self setViewsHidden: views hiden:NO];
}

+(void) setViewsHiddenYes: (NSArray*)views
{
    [self setViewsHidden: views hiden:YES];
}

+(void) setViewsHidden: (NSArray*)views hiden:(BOOL)hidden
{
    for (UIView* v in views) {
        v.hidden = hidden;
    }
}


#pragma mark -

+(void) clearTextField: (NSArray*)textFields
{
    for (UITextField* tx in textFields) {
        tx.text = nil;
    }
}


+(ValueView*) getSuperValueViewBySubView: (UIView*)subView
{
    ValueView* valueView = (ValueView*)subView.superview;
    while (valueView && ![valueView isKindOfClass:[ValueView class]]) {
        valueView = (ValueView*)valueView.superview;
    }
    return valueView;
}


+(ValueCaculateView*) getSuperValueCaculateViewBySubView: (UIView*)subView
{
    ValueCaculateView* valueView = (ValueCaculateView*)subView.superview;
    while (valueView && ![valueView isKindOfClass:[ValueCaculateView class]]) {
        valueView = (ValueCaculateView*)valueView.superview;
    }
    return valueView;
}



#pragma mark - 

+(BOOL) checkIsNumericWithAlert: (NSString*)text
{
    if (! text || [text isEqualToString: @""] || [text isEqualToString:@"."]) {
        return YES;
    }
    
    BOOL isNumeric = [StringHelper isNumericValue: text];
    if (!isNumeric) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle: @"錯誤"
                                                        message: @"請輸入數字"
                                                       delegate: nil
                                              cancelButtonTitle: @"確定"
                                              otherButtonTitles: nil];
        [alert show];
    }
    return isNumeric;
}



@end
