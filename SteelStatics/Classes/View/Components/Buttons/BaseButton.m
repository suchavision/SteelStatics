#import "BaseButton.h"
@implementation BaseButton

-(void)awakeFromNib
{
    [self setDefaultVariables];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setDefaultVariables];
    }
    return self;
}

-(void) setDefaultVariables
{
    [self addTarget: self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void) clickAction: (UIButton*)button
{
    if (self.didClickButtonAction) {
        self.didClickButtonAction(self);
    }
}


@end
