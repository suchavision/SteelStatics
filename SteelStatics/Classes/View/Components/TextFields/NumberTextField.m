#import "NumberTextField.h"
#import "AppInterface.h"

@implementation NumberTextField


-(void) initializeDefaultVariables
{
    [super initializeDefaultVariables];
    self.keyboardType = UIKeyboardTypeDecimalPad;
    
    
    self.textFieldShouldChangeBlock = ^BOOL(NormalTextField* textField, NSRange range, NSString* replaceString) {
        if (range.location == 0) {
            if ([replaceString isEqualToString:@"0" ]) {
                return NO;
            }
        }
        return [SSViewHelper checkIsNumericWithAlert: replaceString];
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
