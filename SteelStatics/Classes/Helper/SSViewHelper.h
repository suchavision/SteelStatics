#import <Foundation/Foundation.h>

@class AddOrderButton;
@class BaseTextField;


@class ValueView;
@class ValueCaculateView;


@interface SSViewHelper : NSObject



+(ValueView*) getValueView: (NSString*)attributeKey inView:(UIView*)inView;;
+(BaseTextField*) getBaseTextFieldByAttributeKey:(NSString*)attributeKey inView:(UIView*)inView;


+(BaseTextField*) createText: (NSString*)title frame:(CGRect)frame key:(NSString*)key enable:(BOOL)enabled;

#pragma mark -


+(void) setViewsHiddenNO: (NSArray*)views;
+(void) setViewsHiddenYes: (NSArray*)views;
+(void) setViewsHidden: (NSArray*)views hiden:(BOOL)hidden;


#pragma mark -

+(void) clearTextField: (NSArray*)textFields;
+(ValueView*) getSuperValueViewBySubView: (UIView*)subView;
+(ValueCaculateView*) getSuperValueCaculateViewBySubView: (UIView*)subView;



#pragma mark -

+(BOOL) checkIsNumericWithAlert: (NSString*)text;

@end
