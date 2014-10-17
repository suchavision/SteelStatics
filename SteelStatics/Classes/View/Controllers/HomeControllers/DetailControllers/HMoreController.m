#import "AppInterface.h"
#import "HMoreController.h"

@implementation HMoreController

- (void)viewDidLoad
{   
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)top {
    self.topcilck.hidden = YES;
    self.downcilck.hidden = NO;
    self.image1.hidden = NO;
    self.image2.hidden = NO;
    self.image3.hidden = YES;
}
- (IBAction)down {
    self.topcilck.hidden = NO;
    self.downcilck.hidden = YES;
    self.image1.hidden = YES;
    self.image2.hidden = YES;
    self.image3.hidden = NO;
}

@end
