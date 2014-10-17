#import "ViewsFactoryHelper.h"
#import "AppInterface.h"

@implementation ViewsFactoryHelper


+(UILabel*) createLabel: (NSString*)title frame:(CGRect)frame fontSize:(CGFloat)fontsize superView:(UIView*)superView
{
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    label.text = title;
    label.font = [UIFont boldSystemFontOfSize:fontsize];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 1;
    [superView addSubview: label];
    return label;
}



#pragma mark - TextField


+(UITextField*) createTextField: (NSString*)title frame:(CGRect)frame enabled:(BOOL)enable fontSize:(CGFloat)fontsize borderWidth:(CGFloat)width textAlignment:(NSTextAlignment)textAlignment superView:(UIView*)superView
{
    return [self createTextField:title frame:frame enabled:enable fontSize:fontsize borderWidth:width textAlignment:textAlignment superView:superView clazz:NULL];
}

+(UITextField*) createTextField: (NSString*)title frame:(CGRect)frame enabled:(BOOL)enable fontSize:(CGFloat)fontsize borderWidth:(CGFloat)width textAlignment:(NSTextAlignment)textAlignment superView:(UIView*)superView clazz:(Class)clazz
{
    if (clazz == NULL ) {
        clazz = [UITextField class];
    }
    UITextField *text = [[clazz alloc] initWithFrame:frame];
    text.font = [UIFont fontWithName:@"Arial" size:fontsize];
    text.text = title;
    [text.layer setBorderWidth:width];
    text.enabled = enable;
    text.textAlignment = textAlignment;
    [superView addSubview: text];
    return text;
}

@end
