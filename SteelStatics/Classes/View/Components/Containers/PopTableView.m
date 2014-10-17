#import "PopTableView.h"
#import "AppInterface.h"

@implementation PopTableView
{
    UILabel* titleLabel;
}


@synthesize tableViewObj;



- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // back ground
        UIImage* bgImage = [UIImage imageNamed:@"PoPTableBG.png"];
        UIImageView* bgImageView = [[UIImageView alloc] initWithImage: bgImage];
        [bgImageView setSize: [FrameTranslater convertCanvasSize: bgImage.size]];
        bgImageView.userInteractionEnabled = YES;
        
        CGSize imageViewSize = bgImageView.size;
        
        
        // table view
        CGFloat x = CanvasW(13);
        CGFloat y = CanvasH(60);
        CGFloat w = imageViewSize.width - x * 2;
        CGFloat h = imageViewSize.height - y - CanvasH(25);
        tableViewObj = [[HeaderSearchTableView alloc] initWithFrame: CGRectMake(x, y, w, h)];
        tableViewObj.backgroundColor = [UIColor clearColor];
        [tableViewObj.searchBar setHiddenCancelButton: YES];
        tableViewObj.headerTableViewHeaderHeightAction = ^CGFloat(HeaderTableView* v){
            return 0;
        };
        tableViewObj.searchBar.textField.placeholder = @"搜索";
        tableViewObj.searchBar.textField.textAlignment = NSTextAlignmentCenter;
        
        [bgImageView addSubview: tableViewObj];
        [self addSubview: bgImageView];
        
        
        // title label
        titleLabel = [[UILabel alloc] initWithFrame:CanvasRect(0, 0, 200, 60)];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize: CanvasFontSize(22)];
        
        [self addSubview: titleLabel];
        
        
        self.frame = CGRectMake(0, 0, imageViewSize.width, imageViewSize.height);
    }
    return self;
    
    
}

-(void)setTitle:(NSString *)title
{
    titleLabel.text = title;
    
    [titleLabel adjustWidthToFontText];
    [titleLabel setCenterX: titleLabel.superview.frame.size.width / 2];
}




@end
