#import "AppInterface.h"
#import "PaintController.h"

@interface PaintController ()

@end

@implementation PaintController

//鋼板 caculate field
@synthesize boardl;
@synthesize boardw;
@synthesize boardh;
@synthesize boardpcs;
@synthesize boardpaintprice;
@synthesize boardpaintarea;
@synthesize boardpercentage;
@synthesize boardpaintface;
//圓管 caculate field
@synthesize circlepipediamter;
@synthesize circlepipethick;
@synthesize circlepipem;
@synthesize circlepipepcs;
@synthesize circlepipepaintprice;
@synthesize circlepipepaintface;
@synthesize circlepipepercentage;
//圓鋼 caculate field
@synthesize circlesteeldiamter;
@synthesize circlesteelm;
@synthesize circlesteelpcs;
@synthesize circlesteelpaintprice;
@synthesize circlesteelpaintface;
@synthesize circlesteelpercentage;
//H型鋼 caculate field
@synthesize hseelh2;
@synthesize hseelb;
@synthesize hseelt1;
@synthesize hseelt2;
@synthesize hseelm;
@synthesize hseelpcs;
@synthesize hseelpaintprice;
@synthesize hseelpaintface;
@synthesize hseelpercentage;

//Base field
@synthesize hsteelneedl;
@synthesize hsteelneedkg;
@synthesize hsteelton;
@synthesize hsteelprice;
@synthesize circlepipeneedl;
@synthesize circlepipeeedkg;
@synthesize circlepipeton;
@synthesize circlepipeprice;
@synthesize circlesteelneedl;
@synthesize circlesteelneedkg;
@synthesize circlesteelton;
@synthesize circlesteelprice;
@synthesize boardneedl;
@synthesize boardneedkg;
@synthesize boardton;
@synthesize boardprice;

#pragma mark - Override Methods

-(void) autoUpdateResuls:(UITextField *)textField
{
    ValueView* editValueView = [SSViewHelper getSuperValueViewBySubView: textField];
    if ([SSViewHelper getSuperValueViewBySubView:circlepipeprice] == editValueView) {
        circlepipeprice.value = circlepipepaintprice.value * 1.0567;
        circlepipeeedkg.value = ((3.1415926 * circlepipediamter.value / 10 * circlepipem.value * 100 * circlepipepcs.value) / 10000) * ((100 + circlepipepercentage.value)/100)/circlepipepaintface.value;
        circlepipeneedl.value = circlepipeeedkg.value * 0.9463325;
        circlepipeton.value = circlepipeeedkg.value/((0.02466 * circlepipethick.value * (circlepipediamter.value - circlepipethick.value)) * circlepipem.value * circlepipepcs.value)*1000*circlepipepaintprice.value;
    }
    if ([SSViewHelper getSuperValueViewBySubView:boardprice] == editValueView) {
        boardprice.value = boardpaintprice.value * 1.0567;
        boardneedkg.value = ((boardl.value*boardw.value)/100*boardpaintface.value)/10000*((100 + boardpercentage.value)/100)/boardpaintarea.value;;
        boardneedl.value = boardneedkg.value * 0.9463325;
        boardton.value = boardneedkg.value / ((boardl.value * boardw.value * boardh.value * 0.00000785) * boardpcs.value)*1000*boardpaintprice.value;
    }
    if ([SSViewHelper getSuperValueViewBySubView:circlesteelprice] == editValueView) {
        circlesteelprice.value = circlesteelpaintprice.value * 1.0567;
        circlesteelneedkg.value = ((3.1415926*circlesteeldiamter.value/10*100*circlesteelm.value*circlesteelpcs.value)/10000)/circlesteelpaintface.value*((100+circlesteelpercentage.value)/100);
        circlesteelneedl.value = circlesteelneedkg.value * 0.9463325;
        circlesteelton.value = circlesteelneedkg.value / ((0.00617 * circlesteeldiamter.value * circlesteeldiamter.value) * circlesteelm.value * circlesteelpcs.value)*circlesteelpaintprice.value*1000;
    }
    if ([SSViewHelper getSuperValueViewBySubView:hsteelprice] == editValueView) {
        hsteelprice.value = hseelpaintprice.value * 1.0567;
        hsteelneedkg.value = (((hseelh2.value*2+hseelb.value*4)*10*hseelm.value*hseelpcs.value)/10000)/hseelpaintface.value*((100+hseelpercentage.value)/100);
        hsteelneedl.value = hsteelneedkg.value * 0.9463325;
        hsteelton.value = hsteelneedkg.value / ((hseelh2.value*hseelt1.value+hseelb.value*hseelt2.value*2)*0.00785* hseelm.value * hseelpcs.value)*1000*hseelpaintprice.value;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppScrollView* scrollView = (AppScrollView*)self.view;
    UIView* contentView = [scrollView.subviews firstObject];
    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, contentView.bounds.size.height);
    // Do any additional setup after loading the view.
 
    
    
    
    [ViewHelper iterateSubView:contentView class:[BaseButton class] handler:^BOOL(UIView *view) {
        BaseButton* refreshButton = (BaseButton*)view;
        if ([[refreshButton titleForState:UIControlStateNormal] isEqualToString: @"刷新"]) {
            refreshButton.didClickButtonAction = ^void(BaseButton* button) {
                [self refreshValueView: button];
            };
        }
        
        return NO;
    }];
}

- (IBAction) refreshValueView:(UIButton*)sender
{
    [ViewHelper resignFirstResponserOnView: [self contentView]];
    
    UIButton* refreshButton = sender;
    UIView* valueView = refreshButton.superview;
    
    while (valueView && ![valueView isKindOfClass:[ValueView class]]) {
        valueView = valueView.superview;
    }
    
    [ViewHelper iterateSubView: valueView class:[UITextField class] handler:^BOOL(UIView *view) {
        UITextField* tx = (UITextField*)view;
        tx.text = nil;
        return NO;
    }];
    
}

-(UIView*) contentView
{
    UIView* contentView = [self.view.subviews firstObject];
    return contentView;
}



@end
