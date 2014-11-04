#import <UIKit/UIKit.h>

@class FormulaView;

@interface OrderTableViewCell : UITableViewCell

-(NSUInteger) index;
-(void) setIndex: (NSUInteger)index;

-(NSMutableDictionary*) getValues;
-(void) setValues:(NSDictionary *)values;



@end
