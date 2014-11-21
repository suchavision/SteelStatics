#import <UIKit/UIKit.h>

@class FormulaView;

@interface OrderTableViewCell : UITableViewCell


@property (strong, readonly) NSString* identifcation;




-(NSUInteger) index;
-(void) setIndex: (NSUInteger)index;

-(NSMutableDictionary*) getValues;
-(void) setValues:(NSDictionary *)values;




#pragma mark - Class Methods

+(void) caculateCellTheTotalValue: (NSMutableDictionary*)values;



@end
