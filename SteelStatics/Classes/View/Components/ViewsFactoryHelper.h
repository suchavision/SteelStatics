#import <Foundation/Foundation.h>

@interface ViewsFactoryHelper : NSObject


+(UILabel*) createLabel: (NSString*)title frame:(CGRect)frame fontSize:(CGFloat)fontsize superView:(UIView*)superView;




#pragma mark - TextField


+(UITextField*) createTextField: (NSString*)title frame:(CGRect)frame enabled:(BOOL)enable fontSize:(CGFloat)fontsize borderWidth:(CGFloat)width textAlignment:(NSTextAlignment)textAlignment superView:(UIView*)superView;

+(UITextField*) createTextField: (NSString*)title frame:(CGRect)frame enabled:(BOOL)enable fontSize:(CGFloat)fontsize borderWidth:(CGFloat)width textAlignment:(NSTextAlignment)textAlignment superView:(UIView*)superView clazz:(Class)clazz;

@end
