#import <UIKit/UIKit.h>



#define kColumn_Number           @"kColumn_Number"

#define kProject_Name            @"kProject_Name"
#define kMaterial_Specifications @"kMaterial_Specifications"

#define kFormula_Image           @"kFormula_Image"


#define kCaculate_Result         @"kCaculate_Result"
#define kUnit_Price              @"kUnit_Price"
#define kResult_Unit             @"kResult_Unit"

#define kTotal                   @"kTotal"







@class FormulaView;

@interface OrderTableViewCell : UITableViewCell

-(NSUInteger) index;
-(void) setIndex: (NSUInteger)index;

-(NSMutableDictionary*) getValues;
-(void) setValues:(NSDictionary *)values;



@end
