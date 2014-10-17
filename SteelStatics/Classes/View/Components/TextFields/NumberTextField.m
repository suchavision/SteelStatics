#import "NumberTextField.h"
#import "AppInterface.h"

@implementation NumberTextField


-(void) initializeDefaultVariables
{
    [super initializeDefaultVariables];
    self.keyboardType = UIKeyboardTypeDecimalPad;
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
