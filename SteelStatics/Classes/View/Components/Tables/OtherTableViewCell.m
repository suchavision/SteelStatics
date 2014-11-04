#import "OtherTableViewCell.h"
#import "AppInterface.h"


@implementation OtherTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier NS_AVAILABLE_IOS(3_0)
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}



-(void) initialize: (NSDictionary*)dictionary
{
    _isInitialize = YES;
    for (NSString* attributeKey in dictionary) {
        CGRect rect = CGRectFromString(dictionary[attributeKey]);
        
        BaseTextField* field = [[BaseTextField alloc] initWithFrame:rect];
        field.layer.borderWidth = 0.5;
        field.textAlignment = NSTextAlignmentCenter;
        field.attributeKey = attributeKey;
        field.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(18)];
        [self.contentView addSubview: field];

        [field setOriginY: CanvasY(1)];
        [field setSizeHeight: CanvasH(49)];
        [field addOriginX: -1];
        [field addSizeWidth: 1];
    }
}


-(void) setContents: (NSDictionary*)contents
{
    for (int i = 0; i < self.contentView.subviews.count; i++) {
        UIView* view = self.contentView.subviews[i];
        if ([view isKindOfClass:[BaseTextField class]]) {
            BaseTextField* tx = (BaseTextField*)view;
            NSString* attributeKey = tx.attributeKey;
            tx.text = contents[attributeKey];
        }
    }
}


-(NSMutableDictionary*) getContents
{
    NSMutableDictionary* contents = [NSMutableDictionary dictionary];
    for (int i = 0; i < self.contentView.subviews.count; i++) {
        UIView* view = self.contentView.subviews[i];
        if ([view isKindOfClass:[BaseTextField class]]) {
            BaseTextField* tx = (BaseTextField*)view;
            NSString* value = tx.text;
            NSString* attributeKey = tx.attributeKey;
            if (value)[contents setObject: value forKey:attributeKey];
        }
    }
    return contents;
}


@end
