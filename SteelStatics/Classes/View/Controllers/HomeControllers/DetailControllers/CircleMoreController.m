#import "CircleMoreController.h"
#import "AppInterface.h"
@interface CircleMoreController ()

@end

@implementation CircleMoreController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)top {
    self.topcilick.hidden = YES;
    self.downcilck.hidden = NO;
    self.image1.hidden = NO;
    self.image2.hidden = NO;
    self.image3.hidden = YES;
}
- (IBAction)down {
    self.topcilick.hidden = NO;
    self.downcilck.hidden = YES;
    self.image1.hidden = YES;
    self.image2.hidden = YES;
    self.image3.hidden = NO;
}

@end
