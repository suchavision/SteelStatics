#import "BaseTextField.h"
#import "AppInterface.h"

@implementation BaseTextField
{
    NSString* _attributeKey;
}

-(NSString *)attributeKey
{
    return _attributeKey;
}

-(void)setAttributeKey:(NSString *)attributeKey
{
    _attributeKey = attributeKey;
}

-(id)connotation
{
    return self.text;
}

-(void)setConnotation:(id)connotation
{
    self.text = connotation;
}


#pragma mark - Override Methods

-(void) initializeDefaultVariables
{
    [super initializeDefaultVariables];
    self.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(17)];
}


@end
