#import "BaseImageView.h"
#import "AppInterface.h"

@implementation BaseImageView
{
    NSString* _attributeKey;
    
    BOOL originUserInteractionEnabled;
    UITapGestureRecognizer* tapGestureRecognizer;
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
    return self.image;
}

-(void)setConnotation:(id)connotation
{
    self.image = connotation;
}



#pragma mark - 

-(void)setDidTapAction:(BaseImageViewDidClickAction)didTapAction
{
    _didTapAction = didTapAction;
    
    if (didTapAction) {
        originUserInteractionEnabled = self.userInteractionEnabled;
        self.userInteractionEnabled = YES;
        if (!tapGestureRecognizer) {
            tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(tapAction:)];
        }
        [self addGestureRecognizer: tapGestureRecognizer];
    } else {
        self.userInteractionEnabled = originUserInteractionEnabled;
        [self removeGestureRecognizer:tapGestureRecognizer];
    }
}

-(void) tapAction: (UITapGestureRecognizer *)tapGesture {
    if (self.didTapAction) {
        self.didTapAction(self);
    }
}




@end
