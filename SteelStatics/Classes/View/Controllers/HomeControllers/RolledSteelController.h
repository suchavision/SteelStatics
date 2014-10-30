#import "CaculateBaseController.h"

@class SpecificationTextField;
@class SpecificationTableTextField;

@class CaculateTextField;
@class BaseTextField;
@class NumberTextField;

@interface RolledSteelController : CaculateBaseController

//標準H型鋼對稱 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelsymmetrym;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelsymmetrypcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelsymmetryloss;
@property (weak, nonatomic) IBOutlet NumberTextField *hsteelsymmetry;
@property (weak, nonatomic) IBOutlet NumberTextField *hsteelsymmetrykg;
@property (weak, nonatomic) IBOutlet UITextField *hsteelsymmetryname;

//變截面H型鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *hsectionh1;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsectionh2;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsectionb;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsectiont1;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsectiont2;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsectionm;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsectionpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsectionloss;
@property (weak, nonatomic) IBOutlet NumberTextField *hsection;
@property (weak, nonatomic) IBOutlet UITextField *hsectionname;
@property (weak, nonatomic) IBOutlet UITextField *hsectionmodel;

//H型鋼不對稱 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelasymmetricalh;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelasymmetricalb1;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelasymmetricalb2;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelasymmetricaltw;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelasymmetricalt1;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelasymmetricalt2;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelasymmetricalm;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelasymmetricalpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelasymmetricalloss;
@property (weak, nonatomic) IBOutlet NumberTextField *hsteelasymmetrical;
@property (weak, nonatomic) IBOutlet UITextField *hsteelasymmetricalname;
@property (weak, nonatomic) IBOutlet UITextField *hsteelasymmetricalmodel;

//變截面H型鋼 屋面樑 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *bridgeh1;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridgeh2;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridgeb;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridget1;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridget2;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridgewater;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridgem;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridgepcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridgeloss;
@property (weak, nonatomic) IBOutlet NumberTextField *bridge;
@property (weak, nonatomic) IBOutlet UITextField *bridgename;
@property (weak, nonatomic) IBOutlet UITextField *bridgemodel;

//天車樑 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadmidl;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadw;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadtopl;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadtopw;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadlowerl;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadlowerw;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadoxh;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadm;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadloss;
@property (weak, nonatomic) IBOutlet NumberTextField *overhead;
@property (weak, nonatomic) IBOutlet UITextField *overheadname;
@property (weak, nonatomic) IBOutlet UITextField *overheadmodel;

//工字鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *girderpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *girderloss;
@property (weak, nonatomic) IBOutlet CaculateTextField *girderm;
@property (weak, nonatomic) IBOutlet NumberTextField *girderkg;
@property (weak, nonatomic) IBOutlet NumberTextField *girder;
@property (weak, nonatomic) IBOutlet UITextField *girdername;

//槽鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *channelpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *channelloss;
@property (weak, nonatomic) IBOutlet CaculateTextField *channelm;
@property (weak, nonatomic) IBOutlet NumberTextField *channelkg;
@property (weak, nonatomic) IBOutlet NumberTextField *channel;
@property (weak, nonatomic) IBOutlet UITextField *channelname;

//角鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *angleside1;
@property (weak, nonatomic) IBOutlet CaculateTextField *angleside2;
@property (weak, nonatomic) IBOutlet CaculateTextField *anglethick;
@property (weak, nonatomic) IBOutlet CaculateTextField *anglem;
@property (weak, nonatomic) IBOutlet CaculateTextField *anglepcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *angleloss;
@property (weak, nonatomic) IBOutlet NumberTextField *angles;
@property (weak, nonatomic) IBOutlet NumberTextField *anglekg;
@property (weak, nonatomic) IBOutlet UITextField *anglesname;

//圓管 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipediamter;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipethick;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipem;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipepcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipeloss;
@property (weak, nonatomic) IBOutlet NumberTextField *circlepipe;
@property (weak, nonatomic) IBOutlet UITextField *circlepipename;
@property (weak, nonatomic) IBOutlet UITextField *circlepipemodel;

//圓鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *circlesteeldiamter;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlesteelm;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlesteelpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlesteelloss;
@property (weak, nonatomic) IBOutlet NumberTextField *circlesteel;
@property (weak, nonatomic) IBOutlet NumberTextField *circlesteelkg;
@property (weak, nonatomic) IBOutlet UITextField *circlesteelname;

//矩形管 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *rectanglepipelong;
@property (weak, nonatomic) IBOutlet CaculateTextField *rectanglepipeshort;
@property (weak, nonatomic) IBOutlet CaculateTextField *rectanglepipethick;
@property (weak, nonatomic) IBOutlet CaculateTextField *rectanglepipem;
@property (weak, nonatomic) IBOutlet CaculateTextField *rectanglepipepcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *rectanglepipeloss;
@property (weak, nonatomic) IBOutlet NumberTextField *rectanglepipekg;
@property (weak, nonatomic) IBOutlet NumberTextField *rectanglepipe;
@property (weak, nonatomic) IBOutlet UITextField *rectanglepipename;

//鋼板 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *boardl;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardw;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardh;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardloss;
@property (weak, nonatomic) IBOutlet NumberTextField *board;
@property (weak, nonatomic) IBOutlet UITextField *boardname;
@property (weak, nonatomic) IBOutlet UITextField *boardmodel;

//C型鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *csteelh;
@property (weak, nonatomic) IBOutlet CaculateTextField *csteelb;
@property (weak, nonatomic) IBOutlet CaculateTextField *csteelc;
@property (weak, nonatomic) IBOutlet CaculateTextField *csteelthick;
@property (weak, nonatomic) IBOutlet CaculateTextField *csteelm;
@property (weak, nonatomic) IBOutlet CaculateTextField *csteelpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *csteelloss;
@property (weak, nonatomic) IBOutlet NumberTextField *csteelkg;
@property (weak, nonatomic) IBOutlet NumberTextField *csteel;
@property (weak, nonatomic) IBOutlet UITextField *csteelname;

//Z型鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *zsteelh;
@property (weak, nonatomic) IBOutlet CaculateTextField *zsteelb;
@property (weak, nonatomic) IBOutlet CaculateTextField *zsteelc;
@property (weak, nonatomic) IBOutlet CaculateTextField *zsteelthick;
@property (weak, nonatomic) IBOutlet CaculateTextField *zsteelm;
@property (weak, nonatomic) IBOutlet CaculateTextField *zsteelpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *zsteelloss;
@property (weak, nonatomic) IBOutlet NumberTextField *zsteelkg;
@property (weak, nonatomic) IBOutlet NumberTextField *zsteel;
@property (weak, nonatomic) IBOutlet UITextField *zsteelname;


//角鋼 Label
@property (weak, nonatomic) IBOutlet UILabel *anglessidekglabel;
@property (weak, nonatomic) IBOutlet UILabel *anglesside1label;
@property (weak, nonatomic) IBOutlet UILabel *anglesside2label;
@property (weak, nonatomic) IBOutlet UILabel *anglesthicklabel;
@property (weak, nonatomic) IBOutlet UILabel *anglesmlabel;
@property (weak, nonatomic) IBOutlet UILabel *anglespcslabel;
@property (weak, nonatomic) IBOutlet UILabel *angleslosslabel;
@property (weak, nonatomic) IBOutlet UILabel *a1;
@property (weak, nonatomic) IBOutlet UILabel *a2;
@property (weak, nonatomic) IBOutlet UILabel *anglessidekg2label;

//圓鋼 Label
@property (weak, nonatomic) IBOutlet UILabel *circlesteeldiamterlabel;
@property (weak, nonatomic) IBOutlet UILabel *circlesteelkglabel;
@property (weak, nonatomic) IBOutlet UILabel *c1;

//矩形管 Label
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipelonglabel;
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipelonglabel2;
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipeshortlabel;
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipeshortlabel2;
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipethicklabel;
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipemlabel;
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipepcslabel;
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipelosslabel;
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipekglabel;
@property (weak, nonatomic) IBOutlet UILabel *r1;
@property (weak, nonatomic) IBOutlet UILabel *r2;
@property (weak, nonatomic) IBOutlet UILabel *r3;

//C型鋼 Label
@property (weak, nonatomic) IBOutlet UILabel *csteelhlabel;
@property (weak, nonatomic) IBOutlet UILabel *csteelblabel;
@property (weak, nonatomic) IBOutlet UILabel *csteelclabel;
@property (weak, nonatomic) IBOutlet UILabel *csteelthicklabel;
@property (weak, nonatomic) IBOutlet UILabel *csteelmlabel;
@property (weak, nonatomic) IBOutlet UILabel *csteelpcslabel;
@property (weak, nonatomic) IBOutlet UILabel *csteellosslabel;
@property (weak, nonatomic) IBOutlet UILabel *csteelkglabel;
@property (weak, nonatomic) IBOutlet UILabel *x1;
@property (weak, nonatomic) IBOutlet UILabel *x2;
@property (weak, nonatomic) IBOutlet UILabel *x3;

//Z Label
@property (weak, nonatomic) IBOutlet UILabel *zsteelhlabel;
@property (weak, nonatomic) IBOutlet UILabel *zsteelblabel;
@property (weak, nonatomic) IBOutlet UILabel *zsteelclabel;
@property (weak, nonatomic) IBOutlet UILabel *zsteelthicklabel;
@property (weak, nonatomic) IBOutlet UILabel *zsteelmlabel;
@property (weak, nonatomic) IBOutlet UILabel *zsteelpcslabel;
@property (weak, nonatomic) IBOutlet UILabel *zsteellosslabel;
@property (weak, nonatomic) IBOutlet UILabel *zsteelkglabel;
@property (weak, nonatomic) IBOutlet UILabel *z1;
@property (weak, nonatomic) IBOutlet UILabel *z2;
@property (weak, nonatomic) IBOutlet UILabel *z3;

@property (weak, nonatomic) IBOutlet SpecificationTableTextField *hStyleSteelSpecTx;
@property (weak, nonatomic) IBOutlet SpecificationTableTextField *joistSteelSpecTx;
@property (weak, nonatomic) IBOutlet SpecificationTableTextField *uSteelSpecTx;
@property (weak, nonatomic) IBOutlet SpecificationTableTextField *equalRectTubeSpecTx;
@property (weak, nonatomic) IBOutlet SpecificationTableTextField *notEqualRectTubeSpecTx;

@property (weak, nonatomic) IBOutlet SpecificationTextField *circleSteelSpecTx;
@property (weak, nonatomic) IBOutlet SpecificationTextField *cStyleSteelSpecTx;
@property (weak, nonatomic) IBOutlet SpecificationTextField *zStyleSteelSpecTx;
@property (weak, nonatomic) IBOutlet SpecificationTextField *equalAngleSteelSpecTx;
//@property (weak, nonatomic) IBOutlet SpecificationTextField *notEqualAngleSteelSpecTx;

@end
