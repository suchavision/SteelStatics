#import "AppInterface.h"
#import "RolledSteelController.h"


@implementation RolledSteelController
{
    NSDictionary* specificationsMap ;
}

@synthesize hStyleSteelSpecTx;
@synthesize joistSteelSpecTx;
@synthesize uSteelSpecTx;
@synthesize equalRectTubeSpecTx;
@synthesize notEqualRectTubeSpecTx;
@synthesize circleSteelSpecTx;
@synthesize cStyleSteelSpecTx;
@synthesize zStyleSteelSpecTx;
@synthesize equalAngleSteelSpecTx;
@synthesize notEqualAngleSteelSpecTx;


//標準H型鋼對稱 caculate field
@synthesize hsteelsymmetrym, hsteelsymmetrypcs, hsteelsymmetryloss, hsteelsymmetry, hsteelsymmetrykg, hsteelsymmetryname;

//變截面H型鋼 caculate field
@synthesize hsectionh1, hsectionh2, hsectionb, hsectiont1, hsectiont2, hsectionm, hsectionpcs, hsectionloss, hsection, hsectionname, hsectionmodel;

//H型鋼不對稱 caculate field
@synthesize hsteelasymmetricalh, hsteelasymmetricalb1, hsteelasymmetricalb2, hsteelasymmetricaltw, hsteelasymmetricalt1, hsteelasymmetricalt2, hsteelasymmetricalm, hsteelasymmetricalpcs, hsteelasymmetricalloss, hsteelasymmetrical, hsteelasymmetricalmodel , hsteelasymmetricalname;

//變截面H型鋼 屋面樑 caculate field
@synthesize bridgeh1, bridgeh2, bridgeb, bridget1, bridget2, bridgewater, bridgem, bridgepcs, bridgeloss, bridge,bridgemodel , bridgename;

//天車樑 caculate field
@synthesize overheadmidl, overheadw, overheadtopl, overheadtopw, overheadlowerl, overheadlowerw, overheadoxh, overheadm, overheadpcs, overheadloss, overhead, overheadmodel , overheadname;

//工字鋼 caculate field
@synthesize girderpcs, girderloss, girderm, girderkg, girder, girdername;

//槽鋼 caculate field
@synthesize channelpcs, channelloss, channelm, channelkg, channel, channelname;

//角鋼 caculate field
@synthesize angleside1, angleside2, anglethick, anglem, anglepcs, angleloss, angles, anglekg, anglesname;

//圓管 caculate field
@synthesize circlepipediamter, circlepipethick, circlepipem, circlepipepcs, circlepipeloss, circlepipe, circlepipemodel , circlepipename;

//圓鋼 caculate field
@synthesize circlesteeldiamter, circlesteelm, circlesteelpcs, circlesteelloss, circlesteel, circlesteelkg, circlesteelname;

//矩形管 caculate field
@synthesize rectanglepipelong, rectanglepipeshort, rectanglepipethick, rectanglepipem, rectanglepipepcs, rectanglepipeloss, rectanglepipekg, rectanglepipe, rectanglepipename;

//鋼板 caculate field
@synthesize boardl, boardw, boardh, boardpcs, boardloss, board, boardmodel, boardname;

//C型鋼 caculate field
@synthesize csteelh, csteelb, csteelc, csteelthick, csteelm, csteelpcs, csteelloss, csteelkg, csteel, csteelname;

//Z型鋼 caculate field
@synthesize zsteelh, zsteelb, zsteelc, zsteelthick, zsteelm, zsteelpcs, zsteelloss, zsteelkg, zsteel, zsteelname;




//角鋼 Label
@synthesize anglessidekglabel, anglesside1label, anglesside2label, anglesthicklabel, anglesmlabel, anglespcslabel, angleslosslabel, anglessidekg2label, a1, a2;

//圓鋼 Label
@synthesize circlesteeldiamterlabel, c1, circlesteelkglabel;

//矩形管 Label
@synthesize rectanglepipelonglabel, rectanglepipelonglabel2, rectanglepipeshortlabel, rectanglepipeshortlabel2, rectanglepipethicklabel, rectanglepipemlabel, rectanglepipepcslabel, rectanglepipelosslabel, rectanglepipekglabel, r1, r2, r3;

//C型鋼 Label
@synthesize csteelhlabel, csteelblabel, csteelclabel, csteelthicklabel, csteelmlabel, csteelpcslabel, csteellosslabel, csteelkglabel, x1, x2, x3;

//Z Label
@synthesize zsteelhlabel, zsteelblabel, zsteelclabel, zsteelthicklabel, zsteelmlabel, zsteelpcslabel, zsteellosslabel, zsteelkglabel, z1, z2, z3;


#pragma mark - Override Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Scrollview
    AppScrollView* scrollView = (AppScrollView*)self.view;
    UIView* contentView = [scrollView.subviews firstObject];
    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, contentView.bounds.size.height);
    
    // Specifications
    NSError* error = nil;
    NSData* valuesData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource: @"specifications" ofType:@"json"]];
    specificationsMap = [NSJSONSerialization JSONObjectWithData: valuesData options:NSJSONReadingAllowFragments error:&error];

    // set the pop table view datasource
    [self setPopupTableDataSource: hStyleSteelSpecTx key:@"hStyleSteelSpecTx"];
    [self setPopupTableDataSource: joistSteelSpecTx key:@"joistSteelSpecTx"];
    [self setPopupTableDataSource: uSteelSpecTx key:@"uSteelSpecTx"];
    [self setPopupTableDataSource: equalRectTubeSpecTx key:@"equalRectTubeSpecTx"];
    [self setPopupTableDataSource: notEqualRectTubeSpecTx key:@"notEqualRectTubeSpecTx"];
    [self setPopupTableDataSource: circleSteelSpecTx key:@"circleSteelSpecTx"];
    [self setPopupTableDataSource: cStyleSteelSpecTx key:@"cStyleSteelSpecTx"];
    [self setPopupTableDataSource: zStyleSteelSpecTx key:@"zStyleSteelSpecTx"];
    [self setPopupTableDataSource: equalAngleSteelSpecTx key:@"equalAngleSteelSpecTx"];
    [self setPopupTableDataSource: notEqualAngleSteelSpecTx key:@"notEqualAngleSteelSpecTx"];
    
    [self Creat];
    
    
    // the refresh event
    [ViewHelper iterateSubView: contentView class:[BaseButton class] handler:^BOOL(UIView *view) {
        BaseButton* refreshButton = (BaseButton*)view;
        if ([[refreshButton titleForState:UIControlStateNormal] isEqualToString: @"刷新"]) {
            refreshButton.didClickButtonAction = ^void(BaseButton* button) {
                [self refreshValueView: button];
            };
        }
        return NO;
    }];
}

-(void) setPopupTableDataSource: (SpecificationTableTextField*)textField key:(NSString*)key
{
    textField.categoryKey = key;
    [textField setDataSources: [DictionaryHelper getSortedKeys: specificationsMap[key]]];
}


-(void) autoUpdateResuls:(UITextField *)textField
{
    ValueView* editValueView = [SSViewHelper getSuperValueViewBySubView: textField];
    
    if ([SSViewHelper getSuperValueViewBySubView:zsteel] == editValueView) {
        if ([zStyleSteelSpecTx.text isEqualToString:@""]){
            zsteel.value = (0.00785 * zsteelthick.value * (zsteelh.value + 2 * zsteelb.value + 2 * zsteelc.value)) * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        }else{
            zsteel.value = 4.233 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        }
    }
    
    if ([SSViewHelper getSuperValueViewBySubView:csteel] == editValueView) {
        if ([cStyleSteelSpecTx.text isEqualToString:@""]) {
            csteel.value = (0.00785 * csteelthick.value * (csteelh.value + 2 * csteelb.value + 2 * csteelc.value)) * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        }else{
            csteel.value = csteelkg.value * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        }
    }
    
    if ([SSViewHelper getSuperValueViewBySubView:hsteelsymmetry] == editValueView) {
        hsteelsymmetry.value = hsteelsymmetrykg.value * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
    }
    
    if ([SSViewHelper getSuperValueViewBySubView:angles] == editValueView) {
        if ([zStyleSteelSpecTx.text isEqualToString:@""]&&[notEqualAngleSteelSpecTx.text isEqualToString:@""] &&[notEqualAngleSteelSpecTx.text isEqualToString:@""]){
            angles.value = (0.00785 * anglethick.value * (angleside1.value + angleside2.value - anglethick.value)) * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        }else{
            angles.value = anglekg.value * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        }
    }
    
    if ([SSViewHelper getSuperValueViewBySubView:girder] == editValueView) {
        girder.value = girderkg.value * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    }
    
    if ([SSViewHelper getSuperValueViewBySubView:channel] == editValueView) {
        channel.value = channelkg.value * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
    }
    
    if ([SSViewHelper getSuperValueViewBySubView:rectanglepipe] == editValueView) {
        if ([equalRectTubeSpecTx.text isEqualToString:@""]&&[notEqualRectTubeSpecTx.text isEqualToString:@""]){
            rectanglepipe.value = ((rectanglepipelong.value + rectanglepipeshort.value - 2 * rectanglepipethick.value) * rectanglepipethick.value * 0.0157) * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        }else{
            rectanglepipe.value = rectanglepipekg.value * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        }
    }
    
    if ([SSViewHelper getSuperValueViewBySubView:circlesteel] == editValueView) {
        if ([circleSteelSpecTx.text isEqualToString:@""]){
            circlesteel.value = (0.00617 * circlesteeldiamter.value * circlesteeldiamter.value) * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        }else{
            circlesteel.value = circlesteelkg.value * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        }
    }
    
    if ([SSViewHelper getSuperValueViewBySubView:hsection] == editValueView) {
        hsection.value = ((hsectionh1.value + hsectionh2.value) / 2 * hsectiont1.value * 0.00785 + hsectionb.value * hsectiont2.value * 2 * 0.00785) * hsectionm.value * hsectionpcs.value * (hsectionloss.value / 100 + 1);
    }
    
    if ([SSViewHelper getSuperValueViewBySubView:bridge] == editValueView) {
        bridge.value = ((bridgeh1.value + bridgeh2.value) / 2 * bridget1.value * 0.00785 + bridgeb.value * bridget2.value * 2 * 0.00785) * bridgem.value * bridgepcs.value * (sqrtf(100 * 100 + bridgewater.value * bridgewater.value) / 100) * (bridgeloss.value / 100 + 1);
    }
    
    if ([SSViewHelper getSuperValueViewBySubView:overhead] == editValueView) {
        overhead.value = ((overheadmidl.value * overheadw.value * overheadm.value * 0.00785) + (overheadtopl.value * overheadtopw.value * overheadm.value * 0.00785) + (overheadlowerl.value * overheadlowerw.value * (overheadm.value + ((overheadmidl.value - overheadoxh.value) / 500)) * 0.00785)) * overheadpcs.value * (overheadloss.value / 100 + 1);
    }
    
    if ([SSViewHelper getSuperValueViewBySubView:board] == editValueView) {
        board.value = (boardl.value * boardw.value * boardh.value * 0.00000785) * boardpcs.value * (boardloss.value / 100 + 1);
    }
    
    if ([SSViewHelper getSuperValueViewBySubView:circlepipe] == editValueView) {
        circlepipe.value = (0.02466 * circlepipethick.value * (circlepipediamter.value - circlepipethick.value)) * circlepipem.value * circlepipepcs.value * (circlepipeloss.value / 100 + 1);
    }
    
    if ([SSViewHelper getSuperValueViewBySubView:hsteelasymmetrical] == editValueView) {
        hsteelasymmetrical.value = (((hsteelasymmetricalh.value - hsteelasymmetricalt1.value - hsteelasymmetricalt2.value)*hsteelasymmetricaltw.value*0.00785)+(hsteelasymmetricalb1.value*hsteelasymmetricalt1.value*0.00785)+(hsteelasymmetricalb2.value*hsteelasymmetricalt2.value*0.00785))*hsteelasymmetricalm.value*hsteelasymmetricalpcs.value*(hsteelasymmetricalloss.value / 100 + 1);
    }
}

- (void) refreshValueView:(UIButton*)sender
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

-(void) clearValueViewByKey: (NSString*)valueViewKey
{
    [ViewHelper resignFirstResponserOnView: [self contentView]];
    
    ValueView* valueView1 = [SSViewHelper getValueView: valueViewKey inView:[self contentView]];
    [ViewHelper iterateSubView: valueView1 class:[UITextField class] handler:^BOOL(UIView *view) {
        UITextField* tx = (UITextField*)view;
        tx.text = nil;
        return NO;
    }];
}

- (IBAction)rectanglepipeclear {
    
    NSArray* hiddenNoViews = @[rectanglepipelong,rectanglepipelonglabel2,rectanglepipeshort,rectanglepipeshortlabel2,rectanglepipethick,rectanglepipeshortlabel,rectanglepipethicklabel,r1,r2];
    [SSViewHelper setViewsHiddenNO:hiddenNoViews];
    
    NSArray* hiddenYesViews = @[rectanglepipekglabel,rectanglepipekg];
    [SSViewHelper setViewsHiddenYes:hiddenYesViews];
    
    rectanglepipelonglabel.text = @"(mm)";
    [zStyleSteelSpecTx becomeFirstResponder];
    [zStyleSteelSpecTx resignFirstResponder];
    [r3 setOriginX:CanvasX(498)];
    [rectanglepipem setOriginX:CanvasX(369)];
    [rectanglepipepcs setOriginX:CanvasX(439)];
    [rectanglepipeloss setOriginX:CanvasX(509)];
    [rectanglepipemlabel setOriginX:CanvasX(371)];
    [rectanglepipepcslabel setOriginX:CanvasX(451)];
    [rectanglepipelosslabel setOriginX:CanvasX(521)];
    notEqualRectTubeSpecTx.enabled = YES;
    equalRectTubeSpecTx.enabled = YES;
    
}

- (IBAction)circlsteelclear {
    
    NSArray* hiddenNoViews = @[circlesteeldiamter,circlesteeldiamterlabel];
    [SSViewHelper setViewsHiddenNO:hiddenNoViews];
    
    NSArray* hiddenYesViews = @[circlesteelkg,circlesteelkglabel];
    [SSViewHelper setViewsHiddenYes:hiddenYesViews];
    
    [c1 setOriginX:CanvasX(236)];
}

- (IBAction)csteelclear {
    
    NSArray* hiddenNoViews = @[csteelh,csteelb,csteelc,csteelthick,csteelclabel,csteelthicklabel,csteelblabel,x2,x1,x3];
    [SSViewHelper setViewsHiddenNO:hiddenNoViews];
    
    NSArray* hiddenYesViews = @[csteelkglabel,csteelkg];
    [SSViewHelper setViewsHiddenYes:hiddenYesViews];
    
    csteelhlabel.text = @"H(mm)";
    [csteelm setOriginX:CanvasX(410)];
    [csteelpcs setOriginX:CanvasX(475)];
    [csteelloss setOriginX:CanvasX(540)];
    [csteelmlabel setOriginX:CanvasX(412)];
    [csteelpcslabel setOriginX:CanvasX(487)];
    [csteellosslabel setOriginX:CanvasX(553)];
    
}
- (IBAction)zsteelclear {
    
    NSArray* hiddenNoViews = @[z1,z2,z3,zsteelh,zsteelb,zsteelc,zsteelthick,zsteelclabel,zsteelblabel,zsteelthicklabel];
    [SSViewHelper setViewsHiddenNO:hiddenNoViews];
    
    NSArray* hiddenYesViews = @[zsteelkg,zsteelkglabel,anglessidekg2label];
    [SSViewHelper setViewsHiddenYes:hiddenYesViews];
    
    zsteelhlabel.text = @"H(mm)";
    zStyleSteelSpecTx.text = @"";
    [zsteelm setOriginX:CanvasX(409)];
    [zsteelpcs setOriginX:CanvasX(471)];
    [zsteelloss setOriginX:CanvasX(533)];
    [zsteelmlabel setOriginX:CanvasX(412)];
    [zsteelpcslabel setOriginX:CanvasX(483)];
    [zsteellosslabel setOriginX:CanvasX(546)];
    
}

- (IBAction)angleclear {
    
    NSArray* hiddenNoViews = @[angleside1,angleside2,anglethick,anglesside1label,anglesside2label,anglesthicklabel,a1,a2];
    [SSViewHelper setViewsHiddenNO:hiddenNoViews];
    
    NSArray* hiddenYesViews = @[anglekg,anglessidekglabel,anglessidekg2label];
    [SSViewHelper setViewsHiddenYes:hiddenYesViews];
    [equalRectTubeSpecTx becomeFirstResponder];
    [equalRectTubeSpecTx resignFirstResponder];
    [anglem setOriginX:CanvasX(399)];
    [anglepcs setOriginX:CanvasX(479)];
    [angleloss setOriginX:CanvasX(559)];
    [anglesmlabel setOriginX:CanvasX(402)];
    [anglespcslabel setOriginX:CanvasX(492)];
    [angleslosslabel setOriginX:CanvasX(571)];
    
    notEqualAngleSteelSpecTx.enabled = YES;
    zStyleSteelSpecTx.enabled = YES;
}

-(void)Creat
{
    __weak RolledSteelController* weakSelf = self;
    
    
    // ----------
    hStyleSteelSpecTx.didSelectTextInTableAction = ^void(SpecificationTableTextField* tx) {
        [weakSelf autoFillFirstFieldWhenSpecificationTableTextFieldSelected: tx];
    };
    
    

    // ----------
    equalRectTubeSpecTx.didSelectTextInTableAction = ^void(SpecificationTableTextField* tx) {
        weakSelf.uSteelSpecTx.enabled = NO;
        
        [weakSelf autoFillFirstFieldWhenSpecificationTableTextFieldSelected: tx];
        
        NSArray* hiddenYesViews = @[weakSelf.rectanglepipelong,weakSelf.rectanglepipelonglabel2,weakSelf.rectanglepipeshort,weakSelf.rectanglepipeshortlabel2,weakSelf.rectanglepipethick,weakSelf.rectanglepipeshortlabel,weakSelf.rectanglepipethicklabel,weakSelf.r1,weakSelf.r2];
        [SSViewHelper setViewsHiddenYes:hiddenYesViews];
        
        NSArray* hiddenNoViews = @[weakSelf.rectanglepipekglabel,weakSelf.rectanglepipekg];
        [SSViewHelper setViewsHiddenNO:hiddenNoViews];
        
        NSArray* textFields = @[weakSelf.rectanglepipe,weakSelf.rectanglepipem,weakSelf.rectanglepipeloss,weakSelf.rectanglepipepcs];
        [SSViewHelper clearTextField: textFields];
        
        [weakSelf.r3 setOriginX:CanvasX(215)];
        [weakSelf.rectanglepipem setOriginX:CanvasX(229)];
        [weakSelf.rectanglepipepcs setOriginX:CanvasX(299)];
        [weakSelf.rectanglepipeloss setOriginX:CanvasX(369)];
        [weakSelf.rectanglepipemlabel setOriginX:CanvasX(234)];
        [weakSelf.rectanglepipepcslabel setOriginX:CanvasX(312)];
        [weakSelf.rectanglepipelosslabel setOriginX:CanvasX(382)];
    };
    
    
    
    // ----------
    notEqualRectTubeSpecTx.didSelectTextInTableAction = ^void(SpecificationTableTextField* tx) {
        weakSelf.joistSteelSpecTx.enabled = NO;
        
        [weakSelf autoFillFirstFieldWhenSpecificationTableTextFieldSelected: tx];
        
        NSArray* hiddenYesViews = @[weakSelf.rectanglepipelong,weakSelf.rectanglepipelonglabel2,weakSelf.rectanglepipeshort,weakSelf.rectanglepipeshortlabel2,weakSelf.rectanglepipethick,weakSelf.rectanglepipeshortlabel,weakSelf.rectanglepipethicklabel,weakSelf.r1,weakSelf.r2];
        [SSViewHelper setViewsHiddenYes:hiddenYesViews];
        
        NSArray* hiddenNoViews = @[weakSelf.rectanglepipekglabel,weakSelf.rectanglepipekg];
        [SSViewHelper setViewsHiddenNO:hiddenNoViews];
        
        NSArray* textFields = @[weakSelf.rectanglepipe,weakSelf.rectanglepipem,weakSelf.rectanglepipeloss,weakSelf.rectanglepipepcs];
        [SSViewHelper clearTextField: textFields];
        
        weakSelf.rectanglepipelonglabel.text = @" (Kg)";
        [weakSelf.r3 setOriginX:CanvasX(215)];
        [weakSelf.rectanglepipem setOriginX:CanvasX(229)];
        [weakSelf.rectanglepipepcs setOriginX:CanvasX(299)];
        [weakSelf.rectanglepipeloss setOriginX:CanvasX(369)];
        [weakSelf.rectanglepipemlabel setOriginX:CanvasX(234)];
        [weakSelf.rectanglepipepcslabel setOriginX:CanvasX(312)];
        [weakSelf.rectanglepipelosslabel setOriginX:CanvasX(382)];
    };
    
    
    
    // ----------
    circleSteelSpecTx.didSelectTextInTableAction = ^void(SpecificationTableTextField* tx) {
        [weakSelf autoFillFirstFieldWhenSpecificationTableTextFieldSelected: tx];
        
        NSArray* hiddenYesViews = @[weakSelf.circlesteeldiamter,weakSelf.circlesteeldiamterlabel];
        [SSViewHelper setViewsHiddenYes:hiddenYesViews];
        
        NSArray* hiddenNoViews = @[weakSelf.circlesteelkg,weakSelf.circlesteelkglabel];
        [SSViewHelper setViewsHiddenNO:hiddenNoViews];
        
        NSArray* textFields = @[weakSelf.circlesteel,weakSelf.circlesteelloss,weakSelf.circlesteelm,weakSelf.circlesteelpcs];
        [SSViewHelper clearTextField: textFields];
        
        [weakSelf.c1 setOriginX:CanvasX(228)];
    };
    
    
    
    // ----------
    cStyleSteelSpecTx.didSelectTextInTableAction = ^void(SpecificationTableTextField* tx) {
        [weakSelf autoFillFirstFieldWhenSpecificationTableTextFieldSelected: tx];
        
        NSArray* hiddenYesViews = @[weakSelf.csteelh,weakSelf.csteelb,weakSelf.csteelc,weakSelf.csteelthick,weakSelf.csteelclabel,weakSelf.csteelthicklabel,weakSelf.csteelblabel,weakSelf.x2,weakSelf.x1,weakSelf.x3];
        [SSViewHelper setViewsHiddenYes:hiddenYesViews];
        
        NSArray* hiddenNoViews = @[weakSelf.csteelkglabel,weakSelf.csteelkg];
        [SSViewHelper setViewsHiddenNO:hiddenNoViews];
        
        NSArray* textFields = @[weakSelf.csteelm,weakSelf.csteelpcs,weakSelf.csteelloss,weakSelf.csteel];
        [SSViewHelper clearTextField: textFields];
        
        [weakSelf.csteelm setOriginX:CanvasX(221)];
        [weakSelf.csteelpcs setOriginX:CanvasX(283)];
        [weakSelf.csteelloss setOriginX:CanvasX(345)];
        [weakSelf.csteelmlabel setOriginX:CanvasX(226)];
        [weakSelf.csteelpcslabel setOriginX:CanvasX(295)];
        [weakSelf.csteellosslabel setOriginX:CanvasX(358)];
        weakSelf.csteelhlabel.text = @"  (Kg)";
    };
    
    
    
    
    
    
    // ------------
    joistSteelSpecTx.didSelectTextInTableAction = ^void(SpecificationTableTextField* tx) {
        [weakSelf autoFillFirstFieldWhenSpecificationTableTextFieldSelected: tx];
    };
    
    
    // -------------
    uSteelSpecTx.didSelectTextInTableAction = ^void(SpecificationTableTextField* tx) {
        [weakSelf autoFillFirstFieldWhenSpecificationTableTextFieldSelected: tx];
    };
    
    
    
    
    // -------------
    zStyleSteelSpecTx.didSelectTextInTableAction = ^void(SpecificationTableTextField* tx) {
        [weakSelf autoFillFirstFieldWhenSpecificationTableTextFieldSelected: tx];
        
        NSArray* hiddenYesViews = @[weakSelf.z1,weakSelf.z2,weakSelf.z3,weakSelf.zsteelh,weakSelf.zsteelb,weakSelf.zsteelc,weakSelf.zsteelthick,weakSelf.zsteelclabel,weakSelf.zsteelblabel,weakSelf.zsteelthicklabel];
        [SSViewHelper setViewsHiddenYes:hiddenYesViews];
        
        NSArray* hiddenNoViews = @[weakSelf.zsteelkg,weakSelf.zsteelkglabel,weakSelf.anglessidekg2label];
        [SSViewHelper setViewsHiddenNO:hiddenNoViews];
        
        NSArray* textFields = @[weakSelf.zsteelm,weakSelf.zsteelloss,weakSelf.zsteelpcs,weakSelf.zsteel];
        [SSViewHelper clearTextField: textFields];
        
        weakSelf.zsteelhlabel.text = @"  (Kg)";
        
        [weakSelf.zsteelm setOriginX:CanvasX(223)];
        [weakSelf.zsteelpcs setOriginX:CanvasX(285)];
        [weakSelf.zsteelloss setOriginX:CanvasX(347)];
        [weakSelf.zsteelmlabel setOriginX:CanvasX(228)];
        [weakSelf.zsteelpcslabel setOriginX:CanvasX(297)];
        [weakSelf.zsteellosslabel setOriginX:CanvasX(358)];
    };
    
    
    // -------------
    equalAngleSteelSpecTx.didSelectTextInTableAction = ^void(SpecificationTableTextField* tx) {
        weakSelf.notEqualAngleSteelSpecTx.enabled = NO;
        
        [weakSelf autoFillFirstFieldWhenSpecificationTableTextFieldSelected: tx];
        
        NSArray* hiddenYesViews = @[weakSelf.angleside1,weakSelf.angleside2,weakSelf.anglethick,weakSelf.anglesside1label,weakSelf.anglesside2label,weakSelf.anglesthicklabel,weakSelf.a1,weakSelf.a2];
        [SSViewHelper setViewsHiddenYes:hiddenYesViews];
        
        NSArray* hiddenNoViews = @[weakSelf.anglekg,weakSelf.anglessidekglabel,weakSelf.anglessidekg2label];
        [SSViewHelper setViewsHiddenNO:hiddenNoViews];
        
        NSArray* textFields = @[weakSelf.angleloss,weakSelf.angles,weakSelf.anglem,weakSelf.anglepcs];
        [SSViewHelper clearTextField: textFields];
        
        [weakSelf.anglem setOriginX:CanvasX(239)];
        [weakSelf.anglepcs setOriginX:CanvasX(319)];
        [weakSelf.angleloss setOriginX:CanvasX(399)];
        [weakSelf.anglesmlabel setOriginX:CanvasX(243)];
        [weakSelf.anglespcslabel setOriginX:CanvasX(331)];
        [weakSelf.angleslosslabel setOriginX:CanvasX(413)];
    };
    
    
    // -------------
    notEqualAngleSteelSpecTx.didSelectTextInTableAction = ^void(SpecificationTableTextField* tx) {
        weakSelf.zStyleSteelSpecTx.enabled = NO;
        
        [weakSelf autoFillFirstFieldWhenSpecificationTableTextFieldSelected: tx];
        
        NSArray* hiddenYesViews = @[weakSelf.angleside1,weakSelf.angleside2,weakSelf.anglethick,weakSelf.anglesside1label,weakSelf.anglesside2label,weakSelf.anglesthicklabel,weakSelf.a1,weakSelf.a2];
        [SSViewHelper setViewsHiddenYes:hiddenYesViews];
        
        NSArray* hiddenNoViews = @[weakSelf.anglekg,weakSelf.anglessidekglabel,weakSelf.anglessidekg2label];
        [SSViewHelper setViewsHiddenNO:hiddenNoViews];
        
        NSArray* textFields = @[weakSelf.angleloss,weakSelf.angles,weakSelf.anglem,weakSelf.anglepcs];
        [SSViewHelper clearTextField: textFields];
        
        [weakSelf.anglem setOriginX:CanvasX(239)];
        [weakSelf.anglepcs setOriginX:CanvasX(319)];
        [weakSelf.angleloss setOriginX:CanvasX(399)];
        [weakSelf.anglesmlabel setOriginX:CanvasX(243)];
        [weakSelf.anglespcslabel setOriginX:CanvasX(331)];
        [weakSelf.angleslosslabel setOriginX:CanvasX(413)];
    };
    
    
}



#pragma mark - Private Methods

-(void) autoFillFirstFieldWhenSpecificationTableTextFieldSelected: (SpecificationTableTextField*)specificationTx
{
    // get text field
    ValueView* valueView = (ValueView*)[ViewHelper getSuperView: specificationTx clazz:[ValueView class]];
    ValueCaculateView* caculateView = (ValueCaculateView*)[ViewHelper getSubview: valueView clazz:[ValueCaculateView class]];
    NumberTextField* textField = [self getFirstXValueTextFieldIn: caculateView];
    
    // set the value
    double value = [specificationsMap[specificationTx.categoryKey][specificationTx.text] doubleValue];
    textField.value = value;
}

-(NumberTextField*) getFirstXValueTextFieldIn: (UIView*)superView
{
    __block NumberTextField* result = nil;
    [ViewHelper iterateSubView: superView class:[NumberTextField class] handler:^BOOL(id subView) {
        NumberTextField* tx = (NumberTextField*)subView;
        if (!result) {
            result = tx;
        }
        if ([tx originX] < [result originX]) {
            result = tx;
        }
        return NO;
    }];
    return result;
}

@end
