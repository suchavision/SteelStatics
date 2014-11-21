#import "NumberTextField.h"
#import "AppInterface.h"

@implementation NumberTextField


-(void) initializeDefaultVariables
{
    [super initializeDefaultVariables];
    self.keyboardType = UIKeyboardTypeDecimalPad;
    
    
    self.textFieldShouldChangeBlock = ^BOOL(NormalTextField* textField, NSRange range, NSString* replaceString) {
        if (range.location == 1) {
            if ([textField.text isEqualToString:@"0"] && [replaceString isEqualToString:@"0"]) {
//                textField.text = nil;
                return YES;
            }
        }
        BOOL isNumber = [SSViewHelper checkIsNumericWithAlert: replaceString];
        return isNumber;
    };
}


#pragma mark - Override Methods

-(float) value
{
    return [self.text floatValue];
}


-(void) setValue:(float)value
{
    self.text = [[NSNumber numberWithFloat: value] stringValue];
}




@end
