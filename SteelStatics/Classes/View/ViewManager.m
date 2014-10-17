#import "ViewManager.h"

@implementation ViewManager

static ViewManager* shareInstance;

+(void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[ViewManager alloc] init];
    });
}


+(ViewManager*) shareInstance
{
    return shareInstance;
}

@end
