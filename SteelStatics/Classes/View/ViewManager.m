#import "ViewManager.h"
#import "AppInterface.h"

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




#pragma mark - Public Methods

-(void) showHint: (NSString*)string
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[ViewHelper getTopView] animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = string;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay: 0.5];
}

@end
