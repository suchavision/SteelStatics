#import <UIKit/UIKit.h>

@interface BaseButton : UIButton

@property(strong) NSString* attributeKey;

@property(copy) void(^didClickButtonAction)(BaseButton* button);

@end
