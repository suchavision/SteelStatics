#import <UIKit/UIKit.h>
#import "ComponentProtocal.h"


@class BaseImageView;


typedef void(^BaseImageViewDidClickAction)(BaseImageView* imageView);


@interface BaseImageView : UIImageView <ComponentProtocal>


@property (nonatomic, copy) BaseImageViewDidClickAction didTapAction;


@end
